package controller.Admin;

import model.Order;
import model.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.dao.OrderDAO;

@WebServlet(name = "updatestatuscontroller", urlPatterns = {"/updatestatuscontroller"})
public class updatestatuscontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        String query = request.getParameter("query");
        int id = Integer.parseInt(query);

        Order or = new Order(id, "Đã thanh toán");
        OrderDAO.getInstance().updateStatus(or);

        List<Order> listO = OrderDAO.getInstance().getAll();
        List<Order> listOrPro = new ArrayList<Order>();

        for (Order o : listO) {
            if (o.getStatus().equalsIgnoreCase("Đang xử lý")) {
                listOrPro.add(o);
            }
        }

        session.setAttribute("listOrPro", listOrPro);

        response.sendRedirect("./adstatuscheckcontroller");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
