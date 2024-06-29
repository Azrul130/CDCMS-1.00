/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

/**
 *
 * @author Azrul Hafizam
 */
public class assetborrower {
    private int assetborrower_id;
    private String asset_name;
    private String status;
    private int quantity;
    private int asset_id;
    private int member_id;
    private int highcouncil_id;
    private String member_name;

    public assetborrower() {
    }

    public assetborrower(int assetborrower_id, String asset_name, String status, int quantity, int asset_id, int member_id, String member_name) {
        this.assetborrower_id = assetborrower_id;
        this.asset_name = asset_name;
        this.status = status;
        this.quantity = quantity;
        this.asset_id = asset_id;
        this.member_id = member_id;
        this.member_name = member_name;
    }

    public assetborrower(String asset_name, String status, int quantity, int asset_id, int member_id, String member_name) {
        this.asset_name = asset_name;
        this.status = status;
        this.quantity = quantity;
        this.asset_id = asset_id;
        this.member_id = member_id;
        this.member_name = member_name;
    }

    

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public int getAssetborrower_id() {
        return assetborrower_id;
    }

    public void setAssetborrower_id(int assetborrower_id) {
        this.assetborrower_id = assetborrower_id;
    }

    public String getAsset_name() {
        return asset_name;
    }

    public void setAsset_name(String asset_name) {
        this.asset_name = asset_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAsset_id() {
        return asset_id;
    }

    public void setAsset_id(int asset_id) {
        this.asset_id = asset_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getHighcouncil_id() {
        return highcouncil_id;
    }

    public void setHighcouncil_id(int highcouncil_id) {
        this.highcouncil_id = highcouncil_id;
    }
    
    
    
    
}
