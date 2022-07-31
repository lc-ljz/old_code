package com.cclsol.pojo;

public class User {
    private Integer id;
    private String userCode;
    private String userName;
    private String UserPassword;


    public User() {
    }

    public User(Integer id, String userCode, String userName, String userPassword) {
        this.id = id;
        this.userCode = userCode;
        this.userName = userName;
        this.UserPassword = userPassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userCode='" + userCode + '\'' +
                ", userName='" + userName + '\'' +
                ", UserPassword='" + UserPassword + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }
}
