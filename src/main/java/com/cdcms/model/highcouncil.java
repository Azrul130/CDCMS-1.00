/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

/**
 *
 * @author Azrul Hafizam
 */
public class highcouncil {
    private int highcouncil_id;
    private String highcouncil_name;
    private String highcouncil_email;
    private String highcouncil_password;
    private String highcouncil_phonenum;
    private String highcouncil_bodynum;

    public highcouncil() {
    }

    public highcouncil(String highcouncil_name, String highcouncil_email, String highcouncil_password, String highcouncil_phonenum, String highcouncil_bodynum) {
        super();
        this.highcouncil_name = highcouncil_name;
        this.highcouncil_email = highcouncil_email;
        this.highcouncil_password = highcouncil_password;
        this.highcouncil_phonenum = highcouncil_phonenum;
        this.highcouncil_bodynum = highcouncil_bodynum;
    }

    public highcouncil(int highcouncil_id, String highcouncil_name, String highcouncil_email, String highcouncil_password, String highcouncil_phonenum, String highcouncil_bodynum) {
        super();
        this.highcouncil_id = highcouncil_id;
        this.highcouncil_name = highcouncil_name;
        this.highcouncil_email = highcouncil_email;
        this.highcouncil_password = highcouncil_password;
        this.highcouncil_phonenum = highcouncil_phonenum;
        this.highcouncil_bodynum = highcouncil_bodynum;
    }
    
    

    public int getHighcouncil_id() {
        return highcouncil_id;
    }

    public void setHighcouncil_id(int highcouncil_id) {
        this.highcouncil_id = highcouncil_id;
    }

    public String getHighcouncil_name() {
        return highcouncil_name;
    }

    public void setHighcouncil_name(String highcouncil_name) {
        this.highcouncil_name = highcouncil_name;
    }

    public String getHighcouncil_email() {
        return highcouncil_email;
    }

    public void setHighcouncil_email(String highcouncil_email) {
        this.highcouncil_email = highcouncil_email;
    }

    public String getHighcouncil_password() {
        return highcouncil_password;
    }

    public void setHighcouncil_password(String highcouncil_password) {
        this.highcouncil_password = highcouncil_password;
    }

    public String getHighcouncil_phonenum() {
        return highcouncil_phonenum;
    }

    public void setHighcouncil_phonenum(String highcouncil_phonenum) {
        this.highcouncil_phonenum = highcouncil_phonenum;
    }

    public String getHighcouncil_bodynum() {
        return highcouncil_bodynum;
    }

    public void setHighcouncil_bodynum(String highcouncil_bodynum) {
        this.highcouncil_bodynum = highcouncil_bodynum;
    }
    
    
}
