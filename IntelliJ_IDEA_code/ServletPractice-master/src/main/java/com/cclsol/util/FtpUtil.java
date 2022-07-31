package cn.ftp.util;

import java.io.*;
import java.net.SocketException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * ftp工具类
 * @author lijj
 */

public class FtpUtil {


    private final static Log logger = LogFactory.getLog(FtpUtil.class);
    /** 本地字符编码 */
    private static String LOCAL_CHARSET = "GBK";

    // FTP协议里面，规定文件名编码为iso-8859-1
    private static String SERVER_CHARSET = "ISO-8859-1";

    /**
     * 获取FTPClient对象
     *
     * @param ftpHost
     *            FTP主机服务器
     *
     * @param ftpPassword
     *            FTP 登录密码
     *
     * @param ftpUserName
     *            FTP登录用户名
     *
     * @param ftpPort
     *            FTP端口 默认为21
     *
     * @return
     */
    public static FTPClient getFTPClient(String ftpHost, int ftpPort, String ftpUserName, String ftpPassword) {
        FTPClient ftpClient = null;
        try {
            ftpClient = new FTPClient();
            ftpClient.connect(ftpHost, ftpPort);// 连接FTP服务器
            ftpClient.login(ftpUserName, ftpPassword);// 登陆FTP服务器
            if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
                logger.info("未连接到FTP，用户名或密码错误。");
                ftpClient.disconnect();
            } else {
                logger.info("FTP连接成功。");
            }
        } catch (SocketException e) {
            e.printStackTrace();
            logger.info("FTP的IP地址可能错误，请正确配置。");
        } catch (IOException e) {
            e.printStackTrace();
            logger.info("FTP的端口错误,请正确配置。");
        }
        return ftpClient;
    }

//    /**
//     * 从FTP服务器下载文件
//     *
//     * @param ftpHost FTP IP地址
//     *
//     * @param ftpUserName FTP 用户名
//     *
//     * @param ftpPassword FTP用户名密码
//     *
//     * @param ftpPort FTP端口
//     *
//     * @param ftpPath FTP服务器中文件所在路径 格式： ftptest/aa
//     *
//     * @param localPath 下载到本地的位置 格式：H:/download
//     *
//     * @param fileName 文件名称
//     */
//    public static void downloadFtpFile(String ftpHost, String ftpUserName, String ftpPassword, int ftpPort,
//                                       String ftpPath, String localPath, String fileName, HttpServletResponse response) {
//
//        FTPClient ftpClient = null;
//        FileInputStream inputStream = null;
//        ServletOutputStream outputStream = null;
//        try {
////            response.reset();
////            //设置响应类型	PDF文件为"application/pdf"，WORD文件为："application/msword"， EXCEL文件为："application/vnd.ms-excel"。
////            response.setContentType("application/octet-stream;charset=utf-8");
//
//            //设置响应的文件名称,并转换成中文编码
//            //returnName = URLEncoder.encode(returnName,"UTF-8");
//           // fileName = response.encodeURL(new String(fileName.getBytes(),"iso8859-1"));	//保存的文件名,必须和页面编码一致,否则乱码
//
//            //attachment作为附件下载；inline客户端机器有安装匹配程序，则直接打开；注意改变配置，清除缓存，否则可能不能看到效果
//         //   response.addHeader("Content-Disposition",   "attachment;filename="+fileName);
//
//            ftpClient = getFTPClient(ftpHost, ftpPort, ftpUserName, ftpPassword);
//            // 设置上传文件的类型为二进制类型
//            if (FTPReply.isPositiveCompletion(ftpClient.sendCommand("OPTS UTF8", "ON"))) {// 开启服务器对UTF-8的支持，如果服务器支持就用UTF-8编码，否则就使用本地编码（GBK）.
//                LOCAL_CHARSET = "UTF-8";
//            }
//            ftpClient.setControlEncoding(LOCAL_CHARSET);
//            ftpClient.enterLocalPassiveMode();// 设置被动模式
//            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 设置传输的模式
//            // 上传文件
//            //对中文文件名进行转码，否则中文名称的文件下载失败
//            String fileNameTemp = new String(fileName.getBytes(LOCAL_CHARSET), SERVER_CHARSET);
//            ftpClient.changeWorkingDirectory(ftpPath);
//
//            InputStream retrieveFileStream = ftpClient.retrieveFileStream(fileNameTemp);
//
//            // 第一种方式下载文件(推荐)
//			 File localFile = new File(localPath + File.separatorChar + fileName);
//            //将文件读入响应流
////            inputStream = new FileInputStream(localFile);
////            outputStream = response.getOutputStream();
////            int length = 1024;
////            int readLength=0;
////            byte buf[] = new byte[1024];
////            readLength = inputStream.read(buf, 0, length);
////            while (readLength != -1) {
////                outputStream.write(buf, 0, readLength);
////                readLength = inputStream.read(buf, 0, length);
////            }
//
//			  OutputStream os = new FileOutputStream(localFile);
//			  ftpClient.retrieveFile(fileName, os);
//			  os.close();
//            // 第二种方式下载：将输入流转成字节，再生成文件，这种方式方便将字节数组直接返回给前台jsp页面
////            byte[] input2byte = input2byte(retrieveFileStream);
////            byte2File(input2byte, localPath, fileName);
//
//            if(null != retrieveFileStream){
//                retrieveFileStream.close();
//            }
//        } catch (FileNotFoundException e) {
//            logger.error("没有找到" + ftpPath + "文件");
//            e.printStackTrace();
//        } catch (SocketException e) {
//            logger.error("连接FTP失败.");
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//            logger.error("文件读取错误。");
//            e.printStackTrace();
//        } finally {
//
//            if (ftpClient.isConnected()) {
//                try {
//                    //退出登录
//                    ftpClient.logout();
//                    //关闭连接
//                    ftpClient.disconnect();
//                } catch (IOException e) {
//                }
//            }
//        }
//    }

    /**
     * Description: 向FTP服务器上传文件
     *
     * @param host
     *            FTP服务器hostname
     * @param port
     *            FTP服务器端口
     * @param username
     *            FTP登录账号
     * @param password
     *            FTP登录密码
     * @param basePath
     *            FTP服务器基础目录
     * @param filePath
     *            FTP服务器文件存放路径。例如分日期存放：/2015/01/01。文件的路径为basePath+filePath
     * @param filename
     *            上传到FTP服务器上的文件名
     * @param input
     *            输入流
     * @return 成功返回true，否则返回false
     */
    public static boolean uploadFile(String ftpHost, int ftpPort, String ftpUserName, String ftpPassword,
                                     String basePath, String filePath, String filename, InputStream input) {
        boolean result = false;
        FTPClient ftpClient = null;
        try {
            int reply;
            ftpClient = getFTPClient(ftpHost, ftpPort, ftpUserName, ftpPassword);
            reply = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftpClient.disconnect();
                return result;
            }
            // 切换到上传目录
            if (!ftpClient.changeWorkingDirectory(basePath + filePath)) {
                // 如果目录不存在创建目录
                String[] dirs = filePath.split("/");
                String tempPath = basePath;
                for (String dir : dirs) {
                    if (null == dir || "".equals(dir))
                        continue;
                    tempPath += "/" + dir;
                    if (!ftpClient.changeWorkingDirectory(tempPath)) {
                        if (!ftpClient.makeDirectory(tempPath)) {
                            return result;
                        } else {
                            ftpClient.changeWorkingDirectory(tempPath);
                        }
                    }
                }
            }
            // 设置上传文件的类型为二进制类型
            if (FTPReply.isPositiveCompletion(ftpClient.sendCommand("OPTS UTF8", "ON"))) {// 开启服务器对UTF-8的支持，如果服务器支持就用UTF-8编码，否则就使用本地编码（GBK）.
                LOCAL_CHARSET = "UTF-8";
            }
            ftpClient.setControlEncoding(LOCAL_CHARSET);
            ftpClient.enterLocalPassiveMode();// 设置被动模式
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 设置传输的模式
            // 上传文件
            filename = new String(filename.getBytes(LOCAL_CHARSET), SERVER_CHARSET);
            if (!ftpClient.storeFile(filename, input)) {
                return result;
            }

            if(null != input){
                input.close();
            }

            result = true;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ftpClient.isConnected()) {
                try {
                    //退出登录
                    ftpClient.logout();
                    //关闭连接
                    ftpClient.disconnect();
                } catch (IOException ioe) {
                }
            }
        }
        return result;
    }

    /**
     * 删除文件 未测试
     *
     * @param hostname
     *            FTP服务器地址
     * @param port
     *            FTP服务器端口号
     * @param username
     *            FTP登录帐号
     * @param password
     *            FTP登录密码
     * @param pathname
     *            FTP服务器保存目录
     * @param filename
     *            要删除的文件名称
     * @return
     */
    public static boolean deleteFile(String ftpHost, int ftpPort, String ftpUserName, String ftpPassword, String pathname,
                                     String filename) {
        boolean flag = false;
        FTPClient ftpClient = new FTPClient();
        try {
            ftpClient = getFTPClient(ftpHost, ftpPort, ftpUserName, ftpPassword);
            // 验证FTP服务器是否登录成功
            int replyCode = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(replyCode)) {
                return flag;
            }
            // 切换FTP目录
            ftpClient.changeWorkingDirectory(pathname);
            // 设置上传文件的类型为二进制类型
            if (FTPReply.isPositiveCompletion(ftpClient.sendCommand("OPTS UTF8", "ON"))) {// 开启服务器对UTF-8的支持，如果服务器支持就用UTF-8编码，否则就使用本地编码（GBK）.
                LOCAL_CHARSET = "UTF-8";
            }
            ftpClient.setControlEncoding(LOCAL_CHARSET);
            ftpClient.enterLocalPassiveMode();// 设置被动模式
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 设置传输的模式
            //对中文名称进行转码
            filename = new String(filename.getBytes(LOCAL_CHARSET), SERVER_CHARSET);
            ftpClient.dele(filename);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ftpClient.isConnected()) {
                try {
                    //退出登录
                    ftpClient.logout();
                    //关闭连接
                    ftpClient.disconnect();
                } catch (IOException e) {
                }
            }
        }
        return flag;
    }

    // 将字节数组转换为输入流
    public static final InputStream byte2Input(byte[] buf) {
        return new ByteArrayInputStream(buf);
    }

    // 将输入流转为byte[]
    public static final byte[] input2byte(InputStream inStream) throws IOException {
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100];
        int rc = 0;
        while ((rc = inStream.read(buff, 0, 100)) > 0) {
            swapStream.write(buff, 0, rc);
        }
        byte[] in2b = swapStream.toByteArray();
        return in2b;
    }

    // 将byte[]转为文件
    public static void byte2File(byte[] buf, String filePath, String fileName) {
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        File file = null;
        try {
            File dir = new File(filePath);
            if (!dir.exists() && dir.isDirectory()) {
                dir.mkdirs();
            }
            file = new File(filePath + File.separator + fileName);
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(buf);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}