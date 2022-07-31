package com.cclsol.dao.user;

import com.cclsol.dao.BaseDao;
import com.cclsol.pojo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDaoImpl implements FileDao {
    @Override
    public MyTree getPostClassTree(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        //总根节点
        MyTree myTree = new MyTree("root",1,"open");

        if (connection != null) {
            String sql = "select * from folder_name ";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                int i = 1;
                while (resultSet.next()) {
                    //总结点没有子孩子 第一条插入到子孩子
                    myTree.getChildren().add(new MyTree(resultSet.getString("cFolderName"),i++,"null"));
                }
//                myTree.getChildren().add(new MyTree("",i,"null"));
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return myTree;

    }
    @Override
    public MyTree getPostClassTree1(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        //总根节点
        MyTree myTree = new MyTree("root",1,"open");

        if (connection != null) {
            String sql = "select * from lrn_txtpostfolder ";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                int i = 1;
                while (resultSet.next()) {
                    //总结点没有子孩子 第一条插入到子孩子
                    myTree.getChildren().add(new MyTree(resultSet.getString("txtPosName"),i++,"null"));
                }
//                myTree.getChildren().add(new MyTree("",i,"null"));
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return myTree;

    }

    @Override
    public MyTree getClassTreeByPostNameTable(Connection connection, String postName) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        //总根节点
        MyTree myTree = new MyTree(postName,1,"open");

        if (connection != null) {
            String sql = "select * from lrn_txtpost where txtposName=? ";
            Object[] params = {postName};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    int i = 1;
                    myTree.getChildren().add(new MyTree(resultSet.getString("cFirstClass"),i++,"null"));
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return myTree;

    }

    @Override
    public boolean insertBaseMaterialTable(Connection connection, Base_Material base_material) {
        boolean flag = true;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            String sql = "insert into base_material( txtLrnTitle,txtLrnPath,m_date,iAdminID,txtPosName,iLrnLen,txtLrnType,txtRemark,txtType) VALUES (?,?,?,?,?,?,?,?,?);";
            //  String sql = "insert into base_material( txtLrnTitle,iMrtClassID,txtLrnPath,m_date,iAdminID,txtPosName,iLrnLen) VALUES (?,?,?,?,?,?,?);";
            Object[] params = {
                    base_material.getTxtLrnTitle(),
                    base_material.getTxtLrnPath(),
                    base_material.getM_date(),
                    base_material.getiAdminID(),
                    base_material.getTxtPosName(),
                    base_material.getiLrnLen(),
                    base_material.getTxtLrnType(),
                    base_material.getTxtRemark(),
                    base_material.getTxtType()
            };
            try {
                BaseDao.execute(connection, preparedStatement, sql, params);
            } catch (SQLException throwables) {
                flag = false;
            } finally {
                BaseDao.closeResource(null, preparedStatement, null);
            }
        }
        return flag;
    }

    public int getiMrtClassID(Connection connection, String txtPosName){
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int iLrnPostID=0;
        String sql;
        if (connection != null) {
                sql = "select iLrnPostID from lrn_txtpost WHERE txtPosName = ? ";
                Object[] params = {txtPosName};
                try {
                    resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                    while (resultSet.next()){
                        iLrnPostID = resultSet.getInt("iLrnPostID");
                    }
                    BaseDao.closeResource(null, preparedStatement, resultSet);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
        }
        return iLrnPostID;

    }
    @Override
    public boolean deleteFormTable(Connection connection, int iLrnID) {
        boolean flag = true;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            String sql = "DELETE FROM base_material WHERE iLrnID=?;";
            //  String sql = "insert into base_material( txtLrnTitle,iMrtClassID,txtLrnPath,m_date,iAdminID,txtPosName,iLrnLen) VALUES (?,?,?,?,?,?,?);";
            Object[] params = {
                    iLrnID
            };

            try {
                BaseDao.execute(connection, preparedStatement, sql, params);
            } catch (SQLException throwables) {
                flag = false;
            } finally {
                BaseDao.closeResource(null, preparedStatement, null);
            }
        }
        return flag;
    }

    @Override
    public List<Base_Material> getBaseMaterialData(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material> list = new ArrayList<>();
        if (connection != null) {
            String sql = "select a.* from base_material as a where a.txtType!='安全教育培训系统' and a.txtType!='环保教育培训系统' order by a.m_date  ";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    Base_Material base_material = new Base_Material();
                    base_material.setiLrnID(resultSet.getInt("iLrnID"));
                    base_material.setTxtLrnType(resultSet.getString("txtLrnType"));
                    base_material.setTxtLrnTitle(resultSet.getString("txtLrnTitle"));
                    base_material.setTxtLrnPath(resultSet.getString("txtLrnPath"));
                    base_material.setM_date(resultSet.getTimestamp("m_date"));
                    base_material.setiAdminID(resultSet.getInt("iAdminID"));
                    base_material.setTxtPosName(resultSet.getString("txtPosName"));
                    base_material.setiLrnLen(resultSet.getInt("iLrnLen"));
                    base_material.setTxtRemark(resultSet.getString("txtRemark"));
                    base_material.setTxtType(resultSet.getString("txtType"));
                   // base_material.setcFirstClass(resultSet.getString("cFirstClass"));
                    list.add(base_material);
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return list;
    }
    @Override
    public List<Base_Material> getBaseMaterialData1(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material> list = new ArrayList<>();
        if (connection != null) {
            String sql = "select a.* from base_material as a where a.txtType='安全教育培训系统' or a.txtType='环保教育培训系统' order by a.m_date ";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    Base_Material base_material = new Base_Material();
                    base_material.setiLrnID(resultSet.getInt("iLrnID"));
                    base_material.setTxtLrnType(resultSet.getString("txtLrnType"));
                    base_material.setTxtLrnTitle(resultSet.getString("txtLrnTitle"));
                    base_material.setTxtLrnPath(resultSet.getString("txtLrnPath"));
                    base_material.setM_date(resultSet.getTimestamp("m_date"));
                    base_material.setiAdminID(resultSet.getInt("iAdminID"));
                    base_material.setTxtPosName(resultSet.getString("txtPosName"));
                    base_material.setiLrnLen(resultSet.getInt("iLrnLen"));
                    base_material.setTxtRemark(resultSet.getString("txtRemark"));
                    base_material.setTxtType(resultSet.getString("txtType"));
                    // base_material.setcFirstClass(resultSet.getString("cFirstClass"));
                    list.add(base_material);
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return list;
    }


    @Override
    public List<Lrn_TxtPostFolder> getPostNameData(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Lrn_TxtPostFolder> list = new ArrayList<>();
        if (connection != null) {
            String sql = "select  txtPosName,cFolder from lrn_txtpostfolder GROUP BY txtPosName ORDER BY CONVERT( txtPosName USING gbk ) COLLATE gbk_chinese_ci ASC";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    Lrn_TxtPostFolder lrn_txtPostFolder = new Lrn_TxtPostFolder();

                    lrn_txtPostFolder.setcFolder(resultSet.getString("cFolder"));
                    lrn_txtPostFolder.setTxtPosName(resultSet.getString("txtPosName"));
                    list.add(lrn_txtPostFolder);
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return list;
    }

    @Override
    public Folder_Name getFolderNameData(Connection connection, String folder) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Folder_Name folder_name = new Folder_Name();
        if (connection != null) {
            String sql = "select * from folder_name where cFolder=?";
            Object[] params = {folder};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    folder_name.setcFolder(resultSet.getString("cFolder"));
                //    folder_name.setcFolderName(resultSet.getString("cFolder")+"-"+resultSet.getString("cFolderName"));
                    folder_name.setcFolderName(resultSet.getString("cFolderName"));
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return folder_name;
    }

    @Override
    public List<Base_Material_Type> getTxtType(Connection connection) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material_Type> list = new ArrayList<>();
        if (connection != null) {
            String sql = "select * from base_material_type";
            Object[] params = {};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    Base_Material_Type base_material_type = new Base_Material_Type();

                    base_material_type.setId(resultSet.getInt("id"));
                    base_material_type.setTxtType(resultSet.getString("txtType"));
                    list.add(base_material_type);
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return list;
    }

    @Override
    public List<Base_Material> getBaseMaterialDataBySearch(Connection connection, String myEquipmentName) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material> list = new ArrayList<>();
        String sql;
        myEquipmentName = "%" + myEquipmentName + "%";
        if (connection != null) {

                sql = "select * from base_material where txtLrnTitle like ? and txtType!='安全教育培训系统' and txtType!='环保教育培训系统'  order by m_date ";
                Object[] params = {myEquipmentName};
                try {
                    resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                    while (resultSet.next()) {
                        Base_Material base_material = new Base_Material();
                        base_material.setiLrnID(resultSet.getInt("iLrnID"));
                        base_material.setTxtLrnType(resultSet.getString("txtLrnType"));
                        base_material.setTxtLrnTitle(resultSet.getString("txtLrnTitle"));
                        base_material.setTxtLrnPath(resultSet.getString("txtLrnPath"));
                        base_material.setM_date(resultSet.getTimestamp("m_date"));
                        base_material.setiAdminID(resultSet.getInt("iAdminID"));
                        base_material.setTxtPosName(resultSet.getString("txtPosName"));
                        base_material.setTxtType(resultSet.getString("txtType"));
                        base_material.setiLrnLen(resultSet.getInt("iLrnLen"));
                        base_material.setTxtRemark(resultSet.getString("txtRemark"));

                        list.add(base_material);
                    }
                    BaseDao.closeResource(null, preparedStatement, resultSet);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        return list;
    }
    @Override
    public List<Base_Material> getBaseMaterialDataBySearch1(Connection connection, String myEquipmentName) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material> list = new ArrayList<>();
        String sql;
        myEquipmentName = "%" + myEquipmentName + "%";
        if (connection != null) {

            sql = "select * from base_material where txtLrnTitle like ? and txtType='安全教育培训系统' or txtType='环保教育培训系统' order by m_date ";
            Object[] params = {myEquipmentName};
            try {
                resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                while (resultSet.next()) {
                    Base_Material base_material = new Base_Material();
                    base_material.setiLrnID(resultSet.getInt("iLrnID"));
                    base_material.setTxtLrnType(resultSet.getString("txtLrnType"));
                    base_material.setTxtLrnTitle(resultSet.getString("txtLrnTitle"));
                    base_material.setTxtLrnPath(resultSet.getString("txtLrnPath"));
                    base_material.setM_date(resultSet.getTimestamp("m_date"));
                    base_material.setiAdminID(resultSet.getInt("iAdminID"));
                    base_material.setTxtPosName(resultSet.getString("txtPosName"));
                    base_material.setTxtType(resultSet.getString("txtType"));
                    base_material.setiLrnLen(resultSet.getInt("iLrnLen"));
                    base_material.setTxtRemark(resultSet.getString("txtRemark"));

                    list.add(base_material);
                }
                BaseDao.closeResource(null, preparedStatement, resultSet);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return list;
    }

    @Override
    public List<Base_Material> getTaskListByTreeTable(Connection connection, String PostText) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Base_Material> list = new ArrayList<>();
        String sql;

        if (connection != null) {
                sql = "select * from base_material where txtPosName=? order by m_date ";
                Object[] params={PostText};
                try {
                    resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
                    while (resultSet.next()) {
                        Base_Material base_material = new Base_Material();
                        base_material.setiLrnID(resultSet.getInt("iLrnID"));
                        base_material.setTxtLrnType(resultSet.getString("txtLrnType"));
                        base_material.setTxtLrnTitle(resultSet.getString("txtLrnTitle"));
                        base_material.setTxtLrnPath(resultSet.getString("txtLrnPath"));
                        base_material.setM_date(resultSet.getTimestamp("m_date"));
                        base_material.setiAdminID(resultSet.getInt("iAdminID"));
                        base_material.setTxtPosName(resultSet.getString("txtPosName"));
                        base_material.setiLrnLen(resultSet.getInt("iLrnLen"));
                        base_material.setTxtType(resultSet.getString("txtType"));
                        base_material.setTxtRemark(resultSet.getString("txtRemark"));
                        list.add(base_material);
                    }
                    BaseDao.closeResource(null, preparedStatement, resultSet);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }




        }
        return list;
    }


}






