package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Fooditem;
import model.dao.FooditemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name = "indexcontroller", urlPatterns = {"/indexcontroller"})
public class indexcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = "1";
        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffset(id);
        HttpSession session = request.getSession();

        session.setAttribute("listfood", listF);
  
        List<Fooditem> listf = FooditemDAO.getInstance().get4new();

        session.setAttribute("listf", listf);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
