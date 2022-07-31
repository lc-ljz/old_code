package com.cclsol.servlet.test;

import com.cclsol.pojo.Lrn_TxtPost;
import com.cclsol.service.user.FileServiceImpl;
import com.cclsol.util.FTPUtils;
import com.cclsol.util.FileUtil;
import com.cclsol.util.JsonUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class FileDownloadController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String ftpDirectoryAndFileName =  request.getParameter("fileName");
        String filePath = ftpDirectoryAndFileName.substring(0, ftpDirectoryAndFileName.lastIndexOf("/"));
        String fileName = ftpDirectoryAndFileName.substring(ftpDirectoryAndFileName.lastIndexOf("/") + 1);
        //ftp服务器IP地址
//        String ftpHost = "192.168.3.12";
//        //ftp服务器端口
//        int ftpPort = 21;
//        //ftp服务器用户名
//        String ftpUserName = "admin";
//        //ftp服务器密码
//        String ftpPassword = "admin";
//        //ftp服务器路径
//        String ftpPath = "D:/FTP/其他/包装工段长/";
//        //本地路径
//        String localPath = "E://";
//        //文件名
//        String fileName1 = "1基于机器学习的故障诊断方法研究_王加昌(2021-07-31)0d40b389-f1ab-466f-a2d5-af4f32dd57c3.pdf";
//        cn.ftp.util.FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileName,response);
        FTPUtils ftp = new FTPUtils("172.31.193.177", 21, "ftpuser", "admin123456");
       // FTPUtils ftp = new FTPUtils("192.168.0.105", 21, "admin", "admin");
        boolean flag = ftp.open();
        if (flag) {
            //ftp.get("/D:/FTP/应知应会/11/1基于机器学习的故障诊断方法研究_王加昌(2021-07-31)0d40b389-f1ab-466f-a2d5-af4f32dd57c3.pdf","E://");
            //ftp.downloadFile("/file",fileName,localPath);
            ftp.downloadFile1(filePath,fileName,response,false);
            ftp.close();


        }

    }
}
