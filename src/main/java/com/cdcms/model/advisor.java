/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

/**
 *
 * @author Azrul Hafizam
 */
public class advisor {
    private int advisor_id;
    private String advisor_name;
    private String advisor_email;
    private String advisor_password;
    private String advisor_phonenum;

    public advisor() {
    }

    public advisor(int advisor_id, String advisor_name, String advisor_email, String advisor_password, String advisor_phonenum) {
        this.advisor_id = advisor_id;
        this.advisor_name = advisor_name;
        this.advisor_email = advisor_email;
        this.advisor_password = advisor_password;
        this.advisor_phonenum = advisor_phonenum;
    }

    public advisor(String advisor_name, String advisor_email, String advisor_password, String advisor_phonenum) {
        this.advisor_name = advisor_name;
        this.advisor_email = advisor_email;
        this.advisor_password = advisor_password;
        this.advisor_phonenum = advisor_phonenum;
    }

    public int getAdvisor_id() {
        return advisor_id;
    }

    public void setAdvisor_id(int advisor_id) {
        this.advisor_id = advisor_id;
    }

    public String getAdvisor_name() {
        return advisor_name;
    }

    public void setAdvisor_name(String advisor_name) {
        this.advisor_name = advisor_name;
    }

    public String getAdvisor_email() {
        return advisor_email;
    }

    public void setAdvisor_email(String advisor_email) {
        this.advisor_email = advisor_email;
    }

    public String getAdvisor_password() {
        return advisor_password;
    }

    public void setAdvisor_password(String advisor_password) {
        this.advisor_password = advisor_password;
    }

    public String getAdvisor_phonenum() {
        return advisor_phonenum;
    }

    public void setAdvisor_phonenum(String advisor_phonenum) {
        this.advisor_phonenum = advisor_phonenum;
    }
    
    
    
}
