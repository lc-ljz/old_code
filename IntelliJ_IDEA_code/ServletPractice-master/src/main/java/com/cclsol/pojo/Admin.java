package com.cclsol.pojo;

public class Admin {
    int iAdminID;
    String txtPassword;

    @Override
    public String toString() {
        return "Admin{" +
                "iAdminID=" + iAdminID +
                ", txtPassword='" + txtPassword + '\'' +
                '}';
    }

    public int getiAdminID() {
        return iAdminID;
    }

    public void setiAdminID(int iAdminID) {
        this.iAdminID = iAdminID;
    }

    public String getTxtPassword() {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) {
        this.txtPassword = txtPassword;
    }
}
