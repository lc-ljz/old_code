package com.cclsol.util;

import java.io.*;
import java.net.URLEncoder;

import com.cclsol.pojo.MyTree;
import org.apache.commons.net.ftp.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 *
 * @author H.Yang
 * @QQ 1033542070
 * @date 2018年3月10日
 */
public class FTPUtils {

    private final Logger LOGGER = LogManager.getLogger(getClass());

    private FTPClient ftpClient = null;
    private String server;
    private int port;
    private String userName;
    private String userPassword;

    public FTPUtils(String server, int port, String userName, String userPassword) {
        this.server = server;
        this.port = port;
        this.userName = userName;
        this.userPassword = userPassword;
    }

    /**
     * <p>Title: 连接服务器</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月10日
     *
     * @return 连接成功与否 true:成功， false:失败
     */
    public boolean open() {
        // 判断是否已连接
        if (ftpClient != null && ftpClient.isConnected()) {
            return true;
        }

        try {
            ftpClient = new FTPClient();
            // 连接FTP服务器
            ftpClient.connect(this.server, this.port);
            // 如果采用默认端口，可以使用ftp.connect(host)的方式直接连接FTP服务器
            ftpClient.login(this.userName, this.userPassword);
            // 检测连接是否成功
            int reply = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                System.out.println("FTP服务器拒绝连接.");
                this.close();
                System.exit(1);
            }
            System.out.println("FTP连接成功:" + this.server + ";port:" + this.port + ";name:" + this.userName + ";pwd:" + this.userPassword);
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); // 设置上传模式.binally or ascii
            return true;
        } catch (Exception e) {
            this.close();
            e.printStackTrace();
            return false;
        }

    }

    /**
     * <p>Title: 切换到父目录</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @return 切换结果 true：成功， false：失败
     */
    private boolean changeToParentDir() {
        try {
            return ftpClient.changeToParentDirectory();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 改变当前目录到指定目录</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param dir 目的目录
     * @return 切换结果 true：成功，false：失败
     */
    private boolean cd(String dir) {
        try {
            return ftpClient.changeWorkingDirectory(dir);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 获取目录下所有的文件名称</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param filePath 指定的目录
     * @return 文件列表,或者null
     */
    private FTPFile[] getFileList(String filePath) {
        try {

            return ftpClient.listFiles(filePath);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * <p>Title: 层层切换工作目录</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param ftpPath 目的目录
     * @return 切换结果
     */
    public boolean changeDir(String ftpPath) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        try {
            // 将路径中的斜杠统一
            char[] chars = ftpPath.toCharArray();
            StringBuffer sbStr = new StringBuffer(256);
            for (int i = 0; i < chars.length; i++) {
                if ('\\' == chars[i]) {
                    sbStr.append('/');
                } else {
                    sbStr.append(chars[i]);
                }
            }
            ftpPath = sbStr.toString();
            if (ftpPath.indexOf('/') == -1) {
                // 只有一层目录
                ftpClient.changeWorkingDirectory(new String(ftpPath.getBytes(), "UTF-8"));
            } else {
                // 多层目录循环创建
                String[] paths = ftpPath.split("/");
                for (int i = 0; i < paths.length; i++) {
                    ftpClient.changeWorkingDirectory(new String(paths[i].getBytes(), "UTF-8"));
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 循环创建目录，并且创建完目录后，设置工作目录为当前创建的目录下</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param ftpPath 需要创建的目录
     * @return
     */
    public boolean mkDir(String ftpPath) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        try {
            // 将路径中的斜杠统一
            char[] chars = ftpPath.toCharArray();
            StringBuffer sbStr = new StringBuffer(256);
            for (int i = 0; i < chars.length; i++) {
                if ('\\' == chars[i]) {
                    sbStr.append('/');
                } else {
                    sbStr.append(chars[i]);
                }
            }
            ftpPath = sbStr.toString();
            System.out.println("ftpPath:" + ftpPath);
            if (ftpPath.indexOf('/') == -1) {
                // 只有一层目录
                ftpClient.makeDirectory(new String(ftpPath.getBytes("GBK"), "iso-8859-1"));
                ftpClient.changeWorkingDirectory(new String(ftpPath.getBytes("GBK"), "iso-8859-1"));
            } else {
                // 多层目录循环创建
                String[] paths = ftpPath.split("/");
                for (int i = 0; i < paths.length; i++) {
                    ftpClient.makeDirectory(new String(paths[i].getBytes("GBK"), "iso-8859-1"));
                    ftpClient.changeWorkingDirectory(new String(paths[i].getBytes("GBK"), "iso-8859-1"));
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 上传文件到FTP服务器</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param localDirectoryAndFileName 本地文件目录和文件名
     * @param ftpFileName 上传到服务器的文件名()
     * @param ftpDirectory FTP目录如:/path1/pathb2/,如果目录不存在会自动创建目录(目录可以省略)
     * @return
     */
    public boolean upload(String localDirectoryAndFileName, String ftpFileName, String ftpDirectory,File storeFile) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        boolean flag = false;
        if (ftpClient != null) {
           //恢复 File srcFile = new File(localDirectoryAndFileName);
            File srcFile = storeFile;
            FileInputStream fis = null;
            try {
                fis = new FileInputStream(srcFile);
                // 创建目录
                this.mkDir(ftpDirectory);
                ftpClient.setBufferSize(100000);
                ftpClient.setControlEncoding("UTF-8");
                // 设置文件类型（二进制）
                ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);

                if (ftpFileName == null || ftpFileName == "") {
                    ftpFileName = srcFile.getName();
                }

                // 上传
                flag = ftpClient.storeFile(new String(ftpFileName.getBytes("GBK"), "iso-8859-1"), fis);
            } catch (Exception e) {
                this.close();
                e.printStackTrace();
                return false;
            } finally {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("上传文件成功，本地文件名： " + localDirectoryAndFileName + "，上传到目录：" + ftpDirectory + "/" + ftpFileName);
        return flag;
    }

    /**
     * <p>Title: 从FTP服务器上下载文件</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param ftpDirectoryAndFileName ftp服务器文件路径，以/dir形式开始
     * @param localDirectoryAndFileName 保存到本地的目录
     * @return
     */
    public boolean get(String ftpDirectoryAndFileName, String localDirectoryAndFileName) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        ftpClient.enterLocalPassiveMode(); // Use passive mode as default
        try {
            // 将路径中的斜杠统一
            char[] chars = ftpDirectoryAndFileName.toCharArray();
            StringBuffer sbStr = new StringBuffer(256);
            for (int i = 0; i < chars.length; i++) {
                if ('\\' == chars[i]) {
                    sbStr.append('/');
                } else {
                    sbStr.append(chars[i]);
                }
            }
            ftpDirectoryAndFileName = sbStr.toString();
            String filePath = ftpDirectoryAndFileName.substring(0, ftpDirectoryAndFileName.lastIndexOf("/"));
            String fileName = ftpDirectoryAndFileName.substring(ftpDirectoryAndFileName.lastIndexOf("/") + 1);
            this.changeDir(filePath);

            ftpClient.retrieveFile(new String(fileName.getBytes("GBK"),"iso-8859-1"), new FileOutputStream(localDirectoryAndFileName)); // download
            // file
            System.out.println(ftpClient.getReplyString()); // check result
            System.out.println("从ftp服务器上下载文件：" + ftpDirectoryAndFileName + "， 保存到：" + localDirectoryAndFileName);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 返回FTP目录下的文件列表</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param pathName
     * @return
     */
    public String[] getFileNameList(String pathName) {
        try {
            return ftpClient.listNames(pathName);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * <p>Title: 删除FTP上的文件</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param ftpDirAndFileName 路径开头不能加/，比如应该是test/filename1
     * @return
     */
    public boolean deleteFile(String ftpDirAndFileName) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        try {
            String ftpDelete = new String(ftpDirAndFileName.getBytes("GBK"),"iso-8859-1");
            return ftpClient.deleteFile(ftpDelete);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 删除FTP目录</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月11日
     *
     * @param ftpDirectory
     * @return
     */
    public boolean deleteDirectory(String ftpDirectory) {
        if (!ftpClient.isConnected()) {
            return false;
        }
        try {
            return ftpClient.removeDirectory(ftpDirectory);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * <p>Title: 关闭链接</p>
     * <p>Description: </p>
     *
     * @author H.Yang
     * @date 2018年3月10日
     *
     */
    public void close() {
        try {
            if (ftpClient != null && ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            System.out.println("成功关闭连接，服务器ip:" + this.server + ", 端口:" + this.port);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public MyTree recursion(FTPFile[] fileArr, FTPClient ftp, MyTree myTree) throws Exception {
        int i=1;
        if (fileArr.length > 0) {
            for (FTPFile it : fileArr) {
                if (it.isDirectory()) {
                    ftp.changeWorkingDirectory(new String(it.getName().getBytes("GBK"), "iso-8859-1"));
                    FTPFile[] ftpFiles = ftp.listFiles();
                    if (ftpFiles.length > 0) {
                        myTree.getChildren().add(this.recursion(ftpFiles, ftp, new MyTree(it.getName(),i++,"open")));
                    } else {
                        myTree.getChildren().add(new MyTree(it.getName(),i++,"null"));
                        ftp.changeToParentDirectory();  // 空目录务必要返回上一级
                    }
                } else {
                    myTree.getChildren().add(new MyTree(it.getName(),i++,"null"));
                }
            }
        }
        ftp.changeToParentDirectory();
        return myTree;
    }
    /**
     * Description: 从FTP服务器下载文件
     * @param// host FTP服务器hostname
     * @param// port FTP服务器端口
     * @param// username FTP登录账号
     * @param// password FTP登录密码
     * @param// remotePath FTP服务器上的相对路径
     * @param// fileName 要下载的文件名
     * @param// localPath 下载后保存到本地的路径
     * @return
     */
    public  boolean downloadFile(String remotePath, String fileName, String localPath,HttpServletResponse response) {
        boolean result = false;
        if (!ftpClient.isConnected()) {
            return false;
        }
        try {

            //将客户端设置为被动模式
            ftpClient.enterLocalPassiveMode();
            //ftpClient.changeWorkingDirectory(remotePath);// 转移到FTP服务器目录
            ftpClient.changeWorkingDirectory(new String(remotePath.getBytes("GBK"), "iso-8859-1"));// 转移到FTP服务器目录
            ftpClient.setControlEncoding("GBK");
            FTPFile[] fs = ftpClient.listFiles();
            for (FTPFile ff : fs) {
                //if (ff.getName().equals(fileName)) {
               String ffName =ff.getName();
                if (ffName.equals(fileName)) {
                    File localFile = new File(localPath + "/" + ff.getName());
                    OutputStream is = new FileOutputStream(localFile);
                    ftpClient.retrieveFile(new String(ffName.getBytes("GBK"),"iso-8859-1"), is);
                    is.close();
                }
            }

            ftpClient.logout();
            result = true;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ftpClient.isConnected()) {
                try {
                    ftpClient.disconnect();
                } catch (IOException ioe) {
                }
            }
        }
        return result;
    }
    public  boolean downloadFile1(String remotePath, String fileName,HttpServletResponse response,boolean delFlag) throws IOException {
        boolean result = false;
        if (!ftpClient.isConnected()) {
            return false;
        }
        FileInputStream inputStream = null;
        ServletOutputStream outputStream = null;
        try {
            response.reset();
            response.setContentType("application/x-msdownload");
            // 设置文件头：最后一个参数是设置下载的文件名并编码为UTF-8
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            //将客户端设置为被动模式
            ftpClient.enterLocalPassiveMode();
            // 设置传输二进制文件
            int reply = ftpClient.getReplyCode();
            // 转移到FTP服务器目录
            ftpClient.setControlEncoding("GBK");
            ftpClient.changeWorkingDirectory(new String(remotePath.getBytes("GBK"), "iso-8859-1"));// 转移到FTP服务器目录
            FTPFile[] fs = ftpClient.listFiles();
            if(!FTPReply.isPositiveCompletion(reply)) {
                ftpClient.disconnect();
                throw new IOException("failed to connect to the FTP Server");
            }
            // 此句代码适用Linux的FTP服务器
            String newPath = new String(fileName.getBytes("GBK"),"ISO-8859-1");
            // ftp文件获取文件
            InputStream is = null;
            BufferedInputStream bis = null;
            try {
                is = ftpClient.retrieveFileStream(newPath);
                bis = new BufferedInputStream(is);
                OutputStream out = response.getOutputStream();
                byte[] buf = new byte[1024];
                int len = 0;
                while ((len = bis.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
                out.flush();
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

            ftpClient.logout();
            result = true;

            } 
        } finally {
            if (ftpClient.isConnected()) {
                try {
                    ftpClient.disconnect();
                } catch (IOException ioe) {
                }
            }


        }
        return result;
    }

//    public static void main(String[] args) {
//        FTPUtils ftp = new FTPUtils("192.168.1.120", 21, "admin", "admin");
//        boolean flag = ftp.open();
//        if (flag) {
//            // 上传
//            ftp.upload("C:/Users/dell/Desktop/FTPMain.java", "", "");
//
//            ftp.close();
//        }
//    }

}
