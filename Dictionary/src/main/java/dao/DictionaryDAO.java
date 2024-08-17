/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Dictionary;

/**
 *
 * @author NHAT
 */
public class DictionaryDAO {

    private Connection conn = null;

    public DictionaryDAO() {
        try {
            conn = db.DBConnection.getConnection();
            if (conn == null) {
                throw new Exception("Database connection failed.");
            }
        } catch (Exception e) {
            System.out.println("Error in LoginDAO constructor: " + e.getMessage());
        }
    }

    public ArrayList<Dictionary> getAllDictionary() {
        ArrayList<Dictionary> dictList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM sql12726522.Dictionary;";
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Dictionary dict = new Dictionary();
                dict.setEng(rs.getString("Eng"));
                dict.setVn(rs.getString("Vn"));
                dictList.add(dict);
            }
        } catch (Exception e) {
        }
        return dictList;
    }

    public int insertDictionary(Dictionary dict) {
        int count = 0;
        try {
            String sql = "INSERT INTO sql12726522.Dictionary"
                    + " (`Eng`,`Vn`)"
                    + " VALUES"
                    + "(?,?);";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, dict.getEng());
            pre.setString(2, dict.getVn());
            count = pre.executeUpdate();
        } catch (Exception e) {
        }
        return count;
    }
    
    public int uppdate(Dictionary newinfo){
        int count = 0;
        try{
            String sql = "Update sql12726522.Dictionary SET (`Eng`,`Vn`) Values(?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, newinfo.getEng());
            pst.setString(2, newinfo.getVn());
            count = pst.executeUpdate();
        }catch(Exception e){
            
        }
        return count;
    }
}
