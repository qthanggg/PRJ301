/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Louis Kien
 */
public class LaptopDAO {
    private static final String VIEW_PRODUCT = "SELECT product_id, name, price FROM product";

    public List<Laptop> getListLaptop() throws SQLException {
        List<Laptop> listLaptop = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionv2();
            ptm = conn.prepareStatement(VIEW_PRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()){
                String product_id = rs.getString("product_id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                listLaptop.add(new Laptop(product_id, name, price));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return listLaptop;
    }
    
}
