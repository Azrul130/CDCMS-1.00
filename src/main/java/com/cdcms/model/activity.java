/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

import java.util.Base64;
import java.io.IOException;
import java.io.OutputStream;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author Azrul Hafizam
 */
public class activity {

    private int activity_id;
    private String activity_title;
    private String activity_description;
    private String activity_place;
    private String activity_date;
    private String activity_time;
    private String activity_status;
    private String activity_proposalname;
    private String activity_proposalpath;
    private byte[] activity_photo;
    private int highcouncil_id;
    private int advisor_id;

    public activity() {
    }

    public activity(int activity_id, String activity_title, String activity_description, String activity_place, String activity_date, String activity_time, String activity_status, String activity_proposalname, String activity_proposalpath, int highcouncil_id) {
        this.activity_id = activity_id;
        this.activity_title = activity_title;
        this.activity_description = activity_description;
        this.activity_place = activity_place;
        this.activity_date = activity_date;
        this.activity_time = activity_time;
        this.activity_status = activity_status;
        this.activity_proposalname = activity_proposalname;
        this.activity_proposalpath = activity_proposalpath;
        this.highcouncil_id = highcouncil_id;
    }
    
    

    public activity(int activity_id, String activity_title, String activity_description, String activity_place, String activity_date, String activity_time, String activity_status, String activity_proposalname, String activity_proposalpath) {
        this.activity_id = activity_id;
        this.activity_title = activity_title;
        this.activity_description = activity_description;
        this.activity_place = activity_place;
        this.activity_date = activity_date;
        this.activity_time = activity_time;
        this.activity_status = activity_status;
        this.activity_proposalname = activity_proposalname;
        this.activity_proposalpath = activity_proposalpath;
       
    }

    public activity(int activity_id, String activity_title, String activity_description, String activity_place, String activity_date, String activity_time, String activity_status, String activity_proposalname, String activity_proposalpath, byte[] activity_photo, int highcouncil_id) {
        this.activity_id = activity_id;
        this.activity_title = activity_title;
        this.activity_description = activity_description;
        this.activity_place = activity_place;
        this.activity_date = activity_date;
        this.activity_time = activity_time;
        this.activity_status = activity_status;
        this.activity_proposalname = activity_proposalname;
        this.activity_proposalpath = activity_proposalpath;
        this.activity_photo = activity_photo;
        this.highcouncil_id = highcouncil_id;
    }

    public byte[] getPicture() {
        return activity_photo;
    }

    public String getActivity_photoBase64() {
        if (activity_photo != null && activity_photo.length > 0) {
            return Base64.getEncoder().encodeToString(activity_photo);
        } else {
            return "";
        }
    }

    public void setActivity_photo(byte[] activity_photo) {
        this.activity_photo = activity_photo;
    }

    public int getActivity_id() {
        return activity_id;
    }

    public void setActivity_id(int activity_id) {
        this.activity_id = activity_id;
    }

    public String getActivity_title() {
        return activity_title;
    }

    public void setActivity_title(String activity_title) {
        this.activity_title = activity_title;
    }

    public String getActivity_description() {
        return activity_description;
    }

    public void setActivity_description(String activity_description) {
        this.activity_description = activity_description;
    }

    public String getActivity_place() {
        return activity_place;
    }

    public void setActivity_place(String activity_place) {
        this.activity_place = activity_place;
    }

    public String getActivity_date() {
        return activity_date;
    }

    public void setActivity_date(String activity_date) {
        this.activity_date = activity_date;
    }

    public String getActivity_time() {
        return activity_time;
    }

    public void setActivity_time(String activity_time) {
        this.activity_time = activity_time;
    }

    public String getActivity_status() {
        return activity_status;
    }

    public void setActivity_status(String activity_status) {
        this.activity_status = activity_status;
    }

    public String getActivity_proposalname() {
        return activity_proposalname;
    }

    public void setActivity_proposalname(String activity_proposalname) {
        this.activity_proposalname = activity_proposalname;
    }

    public String getActivity_proposalpath() {
        return activity_proposalpath;
    }

    public void setActivity_proposalpath(String activity_proposalpath) {
        this.activity_proposalpath = activity_proposalpath;
    }

    public int getHighcouncil_id() {
        return highcouncil_id;
    }

    public void setHighcouncil_id(int highcouncil_id) {
        this.highcouncil_id = highcouncil_id;
    }

    public int getAdvisor_id() {
        return advisor_id;
    }

    public void setAdvisor_id(int advisor_id) {
        this.advisor_id = advisor_id;
    }
}
