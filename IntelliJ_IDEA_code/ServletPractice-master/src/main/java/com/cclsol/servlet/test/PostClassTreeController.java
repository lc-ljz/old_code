package com.cclsol.servlet.test;

import com.cclsol.pojo.MyTree;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.JsonUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

public class PostClassTreeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        FileServiceImpl fileService = new FileServiceImpl();
        MyTree list = new MyTree();
        list = fileService.getPostClassTree();
        String json = JsonUtils.objectToJson(list);
        json = "[" + json + "]";
        OutputStream out = response.getOutputStream();
        out.write(json.getBytes("UTF-8"));
        out.flush();

    }
}
