package com.cclsol.dao.user;

import com.cclsol.dao.BaseDao;
import com.cclsol.pojo.Admin;
import com.cclsol.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    @Override
    public Admin getLoginUser(Connection connection, String iAdminID) throws Exception {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Admin admin = null;
        if (connection != null) {
            String sql = "select * from admin where iAdminID = ?";
            Object[] params = {iAdminID};
            resultSet = BaseDao.execute(connection, preparedStatement, resultSet, sql, params);
            if(resultSet.next()) {
                admin = new Admin();
                admin.setiAdminID(resultSet.getInt("iAdminID"));
                admin.setTxtPassword(resultSet.getString("txtPassword"));
            }
            BaseDao.closeResource(null, preparedStatement, resultSet);
        }
        return admin;
    }

    @Override
    public boolean registerUser(Connection connection, String userCode, String userPassword,String userName){
        boolean flag =true;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user = null;
        if (connection != null) {
            String sql = "insert into User(userCode, userName, userPassword) VALUES (?,?,?);";
            Object[] params = {userCode,userName,userPassword};

            try {
                BaseDao.execute(connection,preparedStatement,sql,params);
            } catch (SQLException throwables) {
                flag =false;
            }finally {
                BaseDao.closeResource(null,preparedStatement,null);
            }
        }
        return flag;
    }
}

