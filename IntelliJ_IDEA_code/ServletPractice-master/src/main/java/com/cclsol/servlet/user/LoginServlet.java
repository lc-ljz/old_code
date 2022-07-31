package com.cclsol.servlet.user;

import com.cclsol.pojo.Admin;
import com.cclsol.pojo.User;
import com.cclsol.service.user.UserServiceImpl;
import com.cclsol.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LoginServlet.......start......");
        String iAdminID = req.getParameter("userCode");
        String txtPassword = req.getParameter("userPassword");

        UserServiceImpl userService = new UserServiceImpl();
        Admin admin = userService.login(iAdminID,txtPassword);
        if(admin!=null){
            req.getSession().setAttribute(Constants.ADMIN_SESSION,admin);
            resp.sendRedirect("jsp/frame.jsp");
        }else{
            req.setAttribute("error","用户名或密码不正确");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
