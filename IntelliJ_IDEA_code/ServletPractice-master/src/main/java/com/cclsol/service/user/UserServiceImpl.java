package com.cclsol.service.user;

import com.cclsol.dao.BaseDao;
import com.cclsol.dao.user.UserDao;
import com.cclsol.dao.user.UserDaoImpl;
import com.cclsol.pojo.Admin;
import com.cclsol.pojo.User;

import java.sql.Connection;

public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public UserServiceImpl() {
        userDao = new UserDaoImpl();
    }

    @Override
    public Admin login(String iAdminID, String txtPassword) {
        Connection connection = null;
        Admin admin = null;
        try{
            connection = BaseDao.getConnection();
            admin=userDao.getLoginUser(connection,iAdminID);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        if(admin != null){
            if(!admin.getTxtPassword().equals(txtPassword)){
                admin = null;
            }
        }
        return admin;
    }

    @Override
    public boolean register(String userCode, String userPassword, String userName) {
        Connection connection = null;
        boolean flag = true;
        try{
            connection = BaseDao.getConnection();
            flag = userDao.registerUser(connection,userCode,userPassword,userName);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return flag;
    }
}
