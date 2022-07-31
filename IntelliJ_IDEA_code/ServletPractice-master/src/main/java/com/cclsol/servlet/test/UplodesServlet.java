package com.cclsol.servlet.test;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cclsol.pojo.Admin;
import com.cclsol.pojo.Base_Material;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.FTPUtils;
import com.cclsol.util.FileUtil;
import com.cclsol.util.JsonUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.joda.time.DateTime;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UplodesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
    //common-fileupload
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final long MAX_FILE_SIZE      = 1024 * 1024 * 200; // 40MB
    private static final long MAX_REQUEST_SIZE   = 1024 * 1024 * 200; // 50MB
    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("cache-control", "no-cache");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        upload.setHeaderEncoding("UTF-8");
        //设置返回信息
        Map<String,Object> resultMap = new HashMap<String,Object>();
        String aa = request.getParameter("postFolder");
        try {
            List<FileItem> list=upload.parseRequest(request);

            //设置FTP上传时上传文件的目录
            String uploadPathFtp = getServletContext().getRealPath("/")  + UPLOAD_DIRECTORY;
            // 如果目录不存在则创建
             //获取模块
            String txtType=list.get(3).getString("utf-8");
            //获取岗位
            String txtPosName=list.get(4).getString("utf-8");
            //获取岗位对应文件目录
            String postFolder = list.get(5).getString("utf-8");
            String str1=postFolder.substring(0, postFolder.indexOf("-"));
//            String postFolderName=postFolder.substring(str1.length()+1, postFolder.length());

            String fileName="";
            String Path="";
            //新文件名
            String newName="";
            if (list.get(7).getName() != "" ) {
                // 迭代表单数据
                for (FileItem item : list) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        String date = new DateTime().toString("yyyy-MM-dd");
                        newName = fileName.substring(0,fileName.lastIndexOf("."))+"("+date+")"+ UUID.randomUUID() +fileName.substring(fileName.lastIndexOf("."));
                        String ftpFilePath = uploadPathFtp + File.separator + newName;
                        File storeFile = new File(ftpFilePath);
                        item.write(storeFile);
                        //上传到哪个目录 如果没有会自动创建
                        Path="/岗位应知应会"+"/"+postFolder;

                        FTPUtils ftp = new FTPUtils("172.31.193.177", 21, "ftpuser", "admin123456");
                       // FTPUtils ftp = new FTPUtils("192.168.0.105", 21, "admin", "admin");
                        boolean flag = ftp.open();
                        if (flag) {
                            // 上传
                            ftp.upload(ftpFilePath, newName, Path,storeFile);
                            ftp.close();
                        } else {

                resultMap.put("data", "false");
                resultMap.put("message", "上传失败");
                String json = null;
                json = JsonUtils.objectToJson(resultMap);
                OutputStream out = response.getOutputStream();
                out.write(json.getBytes("UTF-8"));
                out.flush();
            }

                    }
                }
            }
            Base_Material base_material = new Base_Material();
            //学习资料标题
            base_material.setTxtLrnTitle(list.get(0).getString("utf-8"));
            //岗位
            base_material.setTxtPosName(str1);

            //存储路径
            if(newName.equals(""))
                base_material.setTxtLrnPath("");
            else
                base_material.setTxtLrnPath(Path+"/"+newName);
            //学习类别
            String txtLrnType="";
            if(fileName.equals(""))
                base_material.setTxtLrnType(txtLrnType);
            else {
                txtLrnType =  fileName.substring(fileName.lastIndexOf('.') + 1).trim();
                base_material.setTxtLrnType(txtLrnType);
            }
            //上传时间
            Date m_date = new Date();
            base_material.setM_date(m_date);
            //上传者用户ID
            Admin admin = (Admin) request.getSession().getAttribute("adminSession");
            base_material.setiAdminID(admin.getiAdminID());
            //////////////获取任务时常////////////////
            Date startDate = null;
            Date endDate = null;
            startDate = df.parse(list.get(1).getString("utf-8"));//当前时间
            endDate = df.parse(list.get(2).getString("utf-8"));//过去
            long l = endDate.getTime() - startDate.getTime();
            int day = (int) (l / (24 * 60 * 60 * 1000));
            //学习时长
            int iLrnLen = day;
            base_material.setiLrnLen(iLrnLen);
            //获取备注信息
            base_material.setTxtRemark(list.get(6).getString("utf-8"));
            //获取模块信息
            base_material.setTxtType(txtType);
            FileServiceImpl fileService = new FileServiceImpl();
            boolean resule = fileService.insertBaseMaterial(base_material);

            resultMap.put("data", "success");
            resultMap.put("message", "上传成功");
            String json = null;
            json = JsonUtils.objectToJson(resultMap);
            OutputStream out = response.getOutputStream();
            out.write(json.getBytes("UTF-8"));
            out.flush();

        } catch (FileUploadException e) {
            e.printStackTrace();
            resultMap.put("data", "false");
            resultMap.put("message", "上传失败");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("data", "false");
            resultMap.put("message", "上传失败");
        }





    }

}