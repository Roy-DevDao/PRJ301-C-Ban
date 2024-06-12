package controller.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.dao.OrderDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "adstatuscheckcontroller", urlPatterns = {"/adstatuscheckcontroller"})
public class adstatuscheckcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        List<Order> listO = OrderDAO.getInstance().getAll();
        List<Order> listOrPro = new ArrayList<Order>();

        for (Order o : listO) {
            if (o.getStatus().equalsIgnoreCase("Đang xử lý")) {
                listOrPro.add(o);
            }
        }

        session.setAttribute("listOrPro", listOrPro);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/status.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
