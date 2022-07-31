package com.cclsol.servlet.test;

import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.JsonUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class DeleteFormController extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "upload";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        FileServiceImpl fileService = new FileServiceImpl();
        boolean returnCondition=false;
        String txtLrnPath = request.getParameter("txtLrnPath");
        int iLrnID = Integer.parseInt(request.getParameter("iLrnID"));
        String uploadPath = request.getRealPath("./") + "\\" + UPLOAD_DIRECTORY;
        Map<String,Object> resultMap = new HashMap<String,Object>();
        //先删除记录
        try {
            returnCondition = fileService.deleteForm(iLrnID);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("error", 1);
            resultMap.put("message", "删除失败");
        }

        if (returnCondition == true) {
            if (!txtLrnPath.equals("")) {

                //如果没有上传文件 则只删除记录
                try {
                    //如果上传了文件 删除文件 删除记录
                    String[] strDirPath = txtLrnPath.split(",");
                    for (String r : strDirPath) {
                        fileService.deleteFile(r,uploadPath);
                    }
                    resultMap.put("error", 0);
                    resultMap.put("message", "删除成功");
                } catch (Exception e) {
                    e.printStackTrace();
                    resultMap.put("error", 1);
                    resultMap.put("message", "删除失败");
                }
            }
            resultMap.put("error", 0);
            resultMap.put("message", "删除成功");
        }
        String json = JsonUtils.objectToJson(resultMap);
        OutputStream out = response.getOutputStream();
        out.write(json.getBytes("UTF-8"));
        out.flush();

    }
}
