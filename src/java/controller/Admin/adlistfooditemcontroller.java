package controller.Admin;

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
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "adlistfooditemcontroller", urlPatterns = {"/adlistfooditemcontroller"})
public class adlistfooditemcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        List<Fooditem> listf = FooditemDAO.getInstance().getAll();
        session.setAttribute("listf", listf);

        List<List<Fooditem>> listf1 = new ArrayList<>();

        session.setAttribute("listf1", listf1);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/listfooditem.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
