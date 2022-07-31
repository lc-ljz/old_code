package com.cclsol.servlet.test;

import com.cclsol.pojo.Base_Material;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class SelectTaskList1Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String myEquipmentName = req.getParameter("myEquipmentName");

        FileServiceImpl fileService = new FileServiceImpl();
        List<Base_Material> list = new ArrayList<>();
        list = fileService.getBaseMaterialDataBySearch1(myEquipmentName);
        String json = JsonUtils.objectToJson(list);
        OutputStream out = resp.getOutputStream();
        out.write(json.getBytes("UTF-8"));
        out.flush();
    }

}
