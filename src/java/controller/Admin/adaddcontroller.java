package controller.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Fooditem;
import model.dao.CategoryDAO;
import java.io.IOException;
import java.util.List;
import model.dao.FooditemDAO;



@WebServlet(name = "adaddcontroller", urlPatterns = {"/adaddcontroller"})
public class adaddcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Category> listC = CategoryDAO.getInstance().getAll();
        session.setAttribute("listC", listC);

        RequestDispatcher rd = request.getRequestDispatcher("views/dashboard/adadd.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String category_id = request.getParameter("category_id");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        int cate_id = Integer.parseInt(category_id);
        int pr = Integer.parseInt(price);

        Fooditem f = new Fooditem(name, cate_id, pr, image);
        FooditemDAO.getInstance().insertFooditem(f);

        List<Fooditem> listf = FooditemDAO.getInstance().getAll();
        session.setAttribute("listf", listf);

        response.sendRedirect("./adlistfooditemcontroller");

    }

}
