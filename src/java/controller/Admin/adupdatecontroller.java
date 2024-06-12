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
import model.dao.FooditemDAO;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "adupdatecontroller", urlPatterns = {"/adupdatecontroller"})
public class adupdatecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("query");

        HttpSession session = request.getSession();

        List<Fooditem> listf = FooditemDAO.getInstance().getFid(id);
        session.setAttribute("listff", listf);

        List<Category> listC = CategoryDAO.getInstance().getAll();
        session.setAttribute("listC", listC);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/adupdate.jsp");
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

        int cate = Integer.parseInt(category_id);
        int pr = Integer.parseInt(price);

        List<Fooditem> list = (List<Fooditem>) session.getAttribute("listff");

        Fooditem f = list.get(0);

        Fooditem ff = new Fooditem(f.getId(), name, cate, pr, image);

        FooditemDAO.getInstance().update(ff);

        response.sendRedirect("./adlistfooditemcontroller");
    }

}
