package com.cclsol.service.user;

import com.cclsol.pojo.Admin;
import com.cclsol.pojo.User;

public interface UserService {
    public Admin login(String iAdminID, String txtPassword);
    public boolean register(String iAdminID,String txtPassword,String userName);

}
