package com.cclsol.service.user;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cclsol.dao.BaseDao;
import com.cclsol.dao.user.FileDao;
import com.cclsol.dao.user.FileDaoImpl;
import com.cclsol.pojo.*;
import com.cclsol.util.FTPUtils;
import com.cclsol.util.FileUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService {
    private FileDao fileDao;

    public FileServiceImpl() {
        fileDao = new FileDaoImpl();
    }
    //   @Override
//    public Map<String,Object> uploadFile(MultipartFile uploadFile,String ftpFilePath) throws Exception{
//
//
//        Map<String,Object> resultMap = new HashMap<String,Object>();
//        try {
//            if(uploadFile!=null && uploadFile.getOriginalFilename()!=null && uploadFile.getOriginalFilename().length()>0){
//                //生成一个新的文件名
//                //取原始文件名
//                String fileName = uploadFile.getOriginalFilename();
//
//                FTPUtils ftp = new FTPUtils("192.168.3.12", 21, "admin", "admin");
//                boolean flag = ftp.open();
//                if (flag) {
//                    // 上传
//                   // ftp.upload(filePath+newName, "", "/demo");
//                 ftp.upload(ftpFilePath, "", "/file");
//                    ftp.close();
//                }
//                //图片上传成功后，将图片的地址写回
//                resultMap.put("error", 0);
//                resultMap.put("url", "/file/" + fileName);
//                return resultMap;
//
//            }else{
//                //返回结果
//                resultMap.put("error", 1);
//                resultMap.put("message", "文件异常");
//                return resultMap;
//            }
//        } catch (Exception e) {
//            resultMap.put("error", 1);
//            resultMap.put("message", "文件上传发生异常");
//            return resultMap;
//        }
//    }

    @Override
    public boolean deleteFile(String fileName,String uploadPath) throws Exception{
        String fileName1 = fileName.substring(fileName.lastIndexOf("/")+1);

        FTPUtils ftp = new FTPUtils("172.31.193.177", 21, "ftpuser", "admin123456");
        //FTPUtils ftp = new FTPUtils("192.168.0.105", 21, "admin", "admin");
        boolean flag = ftp.open();
        if (flag) {
            ftp.deleteFile(fileName);
            ftp.close();
        }
        return true;
    }

    @Override
    public boolean deleteForm(int iLrnID) throws Exception {
        Connection connection = null;
        boolean result = true;
        try{
            connection = BaseDao.getConnection();
            result=fileDao.deleteFormTable(connection,iLrnID);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public boolean insertBaseMaterial(Base_Material base_material) {
        Connection connection = null;
        boolean result = true;
        try{
            connection = BaseDao.getConnection();
          // int iLrnPostID = getiMrtClassID(base_material.getTxtPosName());
            result=fileDao.insertBaseMaterialTable(connection,base_material);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }



    public int getiMrtClassID(String PostText){
        Connection connection = null;
        int result =0;
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getiMrtClassID(connection,PostText);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public List<Base_Material> getBaseMaterialData() {
        Connection connection = null;
        List<Base_Material> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getBaseMaterialData(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public List<Base_Material> getBaseMaterialData1() {
        Connection connection = null;
        List<Base_Material> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getBaseMaterialData1(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }




    @Override
    public List<Lrn_TxtPostFolder> getPostName() {
        Connection connection = null;
        List<Lrn_TxtPostFolder> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getPostNameData(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }
    @Override
    public Folder_Name getFolderName(String folder) {
        Connection connection = null;
        Folder_Name result = new Folder_Name();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getFolderNameData(connection,folder);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public List<Base_Material_Type> getTxtType() {
        Connection connection = null;
        List<Base_Material_Type> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getTxtType(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public List<Base_Material> getBaseMaterialDataBySearch(String myEquipmentName) {
        Connection connection = null;
        List<Base_Material> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getBaseMaterialDataBySearch(connection,myEquipmentName);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }
    @Override
    public List<Base_Material> getBaseMaterialDataBySearch1(String myEquipmentName) {
        Connection connection = null;
        List<Base_Material> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getBaseMaterialDataBySearch1(connection,myEquipmentName);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public List<Base_Material> getTaskListByTree(String PostText) {
        Connection connection = null;
        List<Base_Material> result = new ArrayList<>();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getTaskListByTreeTable(connection,PostText);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public MyTree getPostClassTree() {
        Connection connection = null;
        MyTree result = new MyTree();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getPostClassTree(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }
    @Override
    public MyTree getPostClassTree1() {
        Connection connection = null;
        MyTree result = new MyTree();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getPostClassTree1(connection);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }

    @Override
    public MyTree getClassTreeByPostName(String postName) {
        Connection connection = null;
        MyTree result = new MyTree();
        try{
            connection = BaseDao.getConnection();
            result=fileDao.getClassTreeByPostNameTable(connection,postName);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return result;
    }


}

