package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.AdminDAO;
import model.Admin;
import model.User;
import model.dao.UserDAO;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "logincontroller", urlPatterns = {"/logincontroller"})
public class logincontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();

        String a = "login";
        session.setAttribute("active", a);

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        String email = request.getParameter("email");
        String password = request.getParameter("password");


        boolean isValidUser = checkUserLogin(email, password);
        boolean isValidAdmin = checkAdminLogin(email, password);

        if (isValidUser) {
            List<User> listuserlogin = UserDAO.getInstance().get(email);
            User u = listuserlogin.get(0);

            session.setAttribute("email", email);
            session.setAttribute("listuserlogin", listuserlogin);
            session.setAttribute("user", u);

            response.sendRedirect("./indexcontroller");
        } else if (isValidAdmin) {
            session.setAttribute("username", email);
            response.sendRedirect("./adindexcontroller");
        } else {
            response.sendRedirect("./logincontroller");
            String err = "Email hoặc Password sai rồi bé! Check lại xem đê!";
            session.setAttribute("err", err);
        }
    }

    private boolean checkUserLogin(String email, String password) {
        User usr = new User(email, password);

        List<User> list = UserDAO.getInstance().getAll();

        for (User u : list) {
            if (u.getEmail().equals(usr.getEmail()) && u.getHashed_password().equals(usr.getHashed_password())) {
                return true;
            }
        }

        return false;
    }

    private boolean checkAdminLogin(String email, String password) {
        Admin ad = new Admin(email, password);

        List<Admin> list = AdminDAO.getInstance().getAll();

        for (Admin a : list) {
            if (ad.getEmail().equals(a.getEmail()) && ad.getPassword().equals(a.getPassword())) {
                return true;
            }
        }

        return false;
    }
}
