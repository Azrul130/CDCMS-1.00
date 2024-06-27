/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

/**
 *
 * @author Azrul Hafizam
 */
public class member {
    private int member_id;
    private String member_name;
    private String member_email;
    private String member_password;
    private String member_phonenum;
    private String member_bodynum;

    public member() {
    }

    public member(int member_id, String member_name, String member_email, String member_password, String member_phonenum, String member_bodynum) {
        this.member_id = member_id;
        this.member_name = member_name;
        this.member_email = member_email;
        this.member_password = member_password;
        this.member_phonenum = member_phonenum;
        this.member_bodynum = member_bodynum;
    }

    public member(String member_name, String member_email, String member_password, String member_phonenum, String member_bodynum) {
        this.member_name = member_name;
        this.member_email = member_email;
        this.member_password = member_password;
        this.member_phonenum = member_phonenum;
        this.member_bodynum = member_bodynum;
    }

    
    
    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getMember_email() {
        return member_email;
    }

    public void setMember_email(String member_email) {
        this.member_email = member_email;
    }

    public String getMember_password() {
        return member_password;
    }

    public void setMember_password(String member_password) {
        this.member_password = member_password;
    }

    public String getMember_phonenum() {
        return member_phonenum;
    }

    public void setMember_phonenum(String member_phonenum) {
        this.member_phonenum = member_phonenum;
    }

    public String getMember_bodynum() {
        return member_bodynum;
    }

    public void setMember_bodynum(String member_bodynum) {
        this.member_bodynum = member_bodynum;
    }
    
    
}
