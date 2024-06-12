package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Fooditem;
import java.io.IOException;
import java.util.List;
import model.dao.CategoryDAO;
import model.dao.FooditemDAO;


@WebServlet(name = "menucontroller", urlPatterns = {"/menucontroller"})
public class menucontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");       

        String id = "1";
        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffset(id);

        HttpSession session = request.getSession();

        session.setAttribute("listfood", listF);

        String a = "menu";
        session.setAttribute("active", a);

        List<Category> listC = CategoryDAO.getInstance().getAll();
        session.setAttribute("listcate", listC);

        int countP = FooditemDAO.getInstance().getCountfood();

        int endPage = countP / 6;
        if (countP % 6 != 0) {
            endPage++;
        }

        session.setAttribute("endPage", endPage);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/menu.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
