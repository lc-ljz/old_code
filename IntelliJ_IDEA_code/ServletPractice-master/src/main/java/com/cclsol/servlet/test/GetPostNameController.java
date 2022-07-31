package com.cclsol.servlet.test;

import com.cclsol.pojo.Lrn_TxtPost;
import com.cclsol.pojo.Lrn_TxtPostFolder;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.JsonUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class GetPostNameController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        FileServiceImpl fileService = new FileServiceImpl();
        List<Lrn_TxtPostFolder> list = new ArrayList<>();
        list = fileService.getPostName();
        String json = JsonUtils.objectToJson(list);
        OutputStream out = response.getOutputStream();
        out.write(json.getBytes("UTF-8"));
        out.flush();

    }
}
