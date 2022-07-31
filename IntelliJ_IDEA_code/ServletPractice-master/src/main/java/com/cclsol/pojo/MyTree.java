package com.cclsol.pojo;

import java.util.ArrayList;
import java.util.List;

public class MyTree {
    private int id;
    private String text;
    private String state;
    private List<MyTree> children;


    public String getState() {
        return state;
    }

    public MyTree(String text, int id, List<MyTree> children, String state) {
        this.text = text;
        this.id = id;
        this.children = children;
        this.state = "closed";
    }

    public void setState(String state) {
        this.state = state;
    }

    public MyTree() {
    }

    public MyTree(String text) {
        this.text = text;
        this.children = new ArrayList<>();
    }

    public MyTree(String text, int id,String state) {
        this.text = text;
        this.id = id;
        this.state = state;
        this.children = new ArrayList<>();;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<MyTree> getChildren() {
        return children;
    }

    public void setChildren(List<MyTree> children) {
        this.children = children;
    }

    public MyTree(String text, List<MyTree> children) {
        this.text = text;
        this.children = children;
    }
}
