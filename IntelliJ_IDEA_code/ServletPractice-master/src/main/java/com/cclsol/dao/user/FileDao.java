package com.cclsol.dao.user;

import com.cclsol.pojo.*;

import java.sql.Connection;
import java.util.List;

public interface FileDao {
    public boolean insertBaseMaterialTable(Connection connection, Base_Material base_material);

    public boolean deleteFormTable(Connection connection, int iLrnID);
    public List<Base_Material> getBaseMaterialData(Connection connection);
    public List<Base_Material> getBaseMaterialData1(Connection connection);

    //////////////////////////岗位combobox查询//////////////////////////
    public List<Lrn_TxtPostFolder> getPostNameData(Connection connection);
    //////////////////////////岗位对应文件目录询//////////////////////////
    public Folder_Name getFolderNameData(Connection connection,String folder);
    //////////////////////////模块combobox查询//////////////////////////
    public List<Base_Material_Type> getTxtType(Connection connection);
    //////////////////////////根据资料标题查询//////////////////////////
    public List<Base_Material> getBaseMaterialDataBySearch(Connection connection,String myEquipmentName);
    //////////////////////////根据资料标题查询 版本1//////////////////////////
    public List<Base_Material> getBaseMaterialDataBySearch1(Connection connection,String myEquipmentName);
    //////////////////////////左侧树双击查询//////////////////////////
    public List<Base_Material> getTaskListByTreeTable(Connection connection,String PostText);
    //////////////////////////左侧岗位等级树显示//////////////////////////
    public MyTree getPostClassTree(Connection connection);
    //////////////////////////左侧岗位等级树显示 版本1//////////////////////////
    public MyTree getPostClassTree1(Connection connection);
    //////////////////////////右侧等级树显示//////////////////////////
    public MyTree getClassTreeByPostNameTable(Connection connection,String postName);
    //////////////////////////获取ILrnPostID//////////////////////////
    public int getiMrtClassID(Connection connection,String PostText);
}
