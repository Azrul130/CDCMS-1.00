/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.model;

import java.util.Base64;

/**
 *
 * @author Azrul Hafizam
 */
public class asset {

    private int asset_id;
    private String asset_name;
    private int asset_quantity;
    private String asset_status;
    private byte[] asset_photo;

    public asset() {
    }

    public asset(int asset_id, String asset_name, int asset_quantity, String asset_status) {
        this.asset_id = asset_id;
        this.asset_name = asset_name;
        this.asset_quantity = asset_quantity;
        this.asset_status = asset_status;
    }

    public asset(int asset_id, String asset_name, int asset_quantity, String asset_status, byte[] asset_photo) {
        this.asset_id = asset_id;
        this.asset_name = asset_name;
        this.asset_quantity = asset_quantity;
        this.asset_status = asset_status;
        this.asset_photo = asset_photo;
    }

    public int getAsset_id() {
        return asset_id;
    }

    public void setAsset_id(int asset_id) {
        this.asset_id = asset_id;
    }

    public String getAsset_name() {
        return asset_name;
    }

    public void setAsset_name(String asset_name) {
        this.asset_name = asset_name;
    }

    public int getAsset_quantity() {
        return asset_quantity;
    }

    public void setAsset_quantity(int asset_quantity) {
        this.asset_quantity = asset_quantity;
    }

    public String getAsset_status() {
        return asset_status;
    }

    public void setAsset_status(String asset_status) {
        this.asset_status = asset_status;
    }

    public byte[] getAsset_photo() {
        return asset_photo;
    }

    public void setAsset_photo(byte[] aset_photo) {
        this.asset_photo = aset_photo;
    }

    public String getAsset_photoBase64() {
        if (asset_photo != null && asset_photo.length > 0) {
            return Base64.getEncoder().encodeToString(asset_photo);
        } else {
            return "";
        }
    }

}
