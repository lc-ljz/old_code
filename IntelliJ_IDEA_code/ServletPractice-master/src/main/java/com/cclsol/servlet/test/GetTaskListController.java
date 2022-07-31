package com.cclsol.servlet.test;

import com.cclsol.pojo.Admin;
import com.cclsol.pojo.Base_Material;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.service.user.UserServiceImpl;
import com.cclsol.util.Constants;
import com.cclsol.util.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet("/GetTaskListController")
public class GetTaskListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        FileServiceImpl fileService = new FileServiceImpl();
        List<Base_Material> list = new ArrayList<>();
        list = fileService.getBaseMaterialData();
        String json = JsonUtils.objectToJson(list);
        OutputStream out = resp.getOutputStream();
        out.write(json.getBytes("UTF-8"));
        out.flush();
    }


}
