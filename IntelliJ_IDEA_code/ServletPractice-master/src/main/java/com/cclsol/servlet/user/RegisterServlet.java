package com.cclsol.servlet.user;

import com.cclsol.pojo.User;
import com.cclsol.service.user.UserServiceImpl;
import com.cclsol.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("RegisterServlet.......start......");
        String userCode = req.getParameter("userCode");
        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("userPassword");

        UserServiceImpl userService = new UserServiceImpl();
        boolean flag = userService.register(userCode,userPassword,userName);
        if(flag){
            req.setAttribute("success","注册成功，请登录");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }else{
            req.setAttribute("error","注册失败，账号已存在");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
