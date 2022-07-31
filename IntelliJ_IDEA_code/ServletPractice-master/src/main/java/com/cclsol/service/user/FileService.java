package com.cclsol.service.user;

import com.cclsol.pojo.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public interface FileService {

   // Map<String,Object> uploadFile(MultipartFile uploadFile,String ftpFilePath) throws Exception;
    boolean deleteFile(String fileName,String uploadPath) throws Exception;
    boolean deleteForm(int iLrnID) throws Exception;
    //插入
    public boolean insertBaseMaterial(Base_Material base_material);
    //查询 第二版
    public List<Base_Material> getBaseMaterialData();
   //查询 第一版
    public List<Base_Material> getBaseMaterialData1();

    //////////////////////////岗位combobox查询//////////////////////////
    public List<Lrn_TxtPostFolder> getPostName();
    //////////////////////////模块combobox查询//////////////////////////
    public List<Base_Material_Type> getTxtType();
    //////////////////////////根据资料标题查询//////////////////////////
    public List<Base_Material> getBaseMaterialDataBySearch(String myEquipmentName);
 //////////////////////////根据资料标题查询 版本1//////////////////////////
    public List<Base_Material> getBaseMaterialDataBySearch1(String myEquipmentName);
    //////////////////////////左侧树双击查询//////////////////////////
    public List<Base_Material> getTaskListByTree(String PostText);
    //////////////////////////左侧岗位等级树显示//////////////////////////
    public MyTree getPostClassTree();
    ////////////////////第一版////////////////////////////////////////
    public MyTree getPostClassTree1();
    //////////////////////////右侧等级树显示//////////////////////////
    public MyTree getClassTreeByPostName(String postName);
    ////////////////////////获取岗位对应文件夹路径//////////////////////////
    public Folder_Name getFolderName(String folder);

}
