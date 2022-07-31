package com.cclsol.dao.user;

import com.cclsol.pojo.Admin;
import com.cclsol.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface UserDao{
    public Admin getLoginUser(Connection connection, String iAdminID) throws Exception;
    public boolean registerUser(Connection connection,String userCode,String userPassword,String userName) throws Exception;
}
