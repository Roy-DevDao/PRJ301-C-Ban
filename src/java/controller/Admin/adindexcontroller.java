package controller.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.User;
import model.dao.OrderDAO;
import model.dao.UserDAO;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "adindexcontroller", urlPatterns = {"/adindexcontroller"})
public class adindexcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        List<Order> listO = OrderDAO.getInstance().getAll();

        List<User> listU = UserDAO.getInstance().getAll();

        List<User> listUst = UserDAO.getInstance().getByStatus("activate");

        String a = "index";

        session.setAttribute("activead", a);
        session.setAttribute("listO", listO);
        session.setAttribute("listU", listU);
        session.setAttribute("listUst", listUst);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/adindex.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
