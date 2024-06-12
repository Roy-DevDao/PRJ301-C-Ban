package controller.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.FooditemDAO;
import java.io.IOException;


@WebServlet(name = "addeletecontroller", urlPatterns = {"/addeletecontroller"})
public class addeletecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String id = request.getParameter("query");

        FooditemDAO.getInstance().remove(id);

        response.sendRedirect("./adlistfooditemcontroller");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
