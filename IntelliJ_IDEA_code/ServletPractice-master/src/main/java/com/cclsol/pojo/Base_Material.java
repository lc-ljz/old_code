package com.cclsol.pojo;

import java.util.Date;

public class Base_Material {
    //学习ID
    private int iLrnID;
    //学习资料标题
    private String txtLrnTitle;
    //学习类别
    private String txtLrnType;
    //学习岗位级别ID
    private int iLrnPostID;

    //存储路径
    private String txtLrnPath;
    //上传时间
    private Date m_date;
    //上传者用户ID
    private int iAdminID;
    //岗位
    private String txtPosName;
    //学习时长
    private int iLrnLen;
    //评论
    private String txtRemark;
    //学习资料分类
    private  String txtMrtClassName;
    //模块
    private String txtType;

    public String getTxtType() {
        return txtType;
    }

    public void setTxtType(String txtType) {
        this.txtType = txtType;
    }

    public int getiLrnID() {
        return iLrnID;
    }

    public void setiLrnID(int iLrnID) {
        this.iLrnID = iLrnID;
    }

    public String getTxtLrnTitle() {
        return txtLrnTitle;
    }

    public void setTxtLrnTitle(String txtLrnTitle) {
        this.txtLrnTitle = txtLrnTitle;
    }

    public String getTxtLrnType() {
        return txtLrnType;
    }

    public void setTxtLrnType(String txtLrnType) {
        this.txtLrnType = txtLrnType;
    }

    public int getiLrnPostID() {
        return iLrnPostID;
    }

    public void setiLrnPostID(int iLrnPostID) {
        this.iLrnPostID = iLrnPostID;
    }

    public String getTxtLrnPath() {
        return txtLrnPath;
    }

    public void setTxtLrnPath(String txtLrnPath) {
        this.txtLrnPath = txtLrnPath;
    }

    public Date getM_date() {
        return m_date;
    }

    public void setM_date(Date m_date) {
        this.m_date = m_date;
    }

    public int getiAdminID() {
        return iAdminID;
    }

    public void setiAdminID(int iAdminID) {
        this.iAdminID = iAdminID;
    }

    public String getTxtPosName() {
        return txtPosName;
    }

    public void setTxtPosName(String txtPosName) {
        this.txtPosName = txtPosName;
    }

    public int getiLrnLen() {
        return iLrnLen;
    }

    public void setiLrnLen(int iLrnLen) {
        this.iLrnLen = iLrnLen;
    }

    public String getTxtRemark() {
        return txtRemark;
    }

    public void setTxtRemark(String txtRemark) {
        this.txtRemark = txtRemark;
    }

    public String getTxtMrtClassName() {
        return txtMrtClassName;
    }

    public void setTxtMrtClassName(String txtMrtClassName) {
        this.txtMrtClassName = txtMrtClassName;
    }
}
