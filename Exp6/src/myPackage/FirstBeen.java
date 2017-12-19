package myPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class FirstBeen {
    public FirstBeen() {
    }

    public void write_in(String var1) {
        try {
            String var2 = "com.mysql.jdbc.Driver";
            String var3 = "root";
            String var4 = "895772";
            String var5 = "teamwork";
            String var6 = "jdbc:mysql://106.15.94.218/" + var5 + "?useUnicode=true&characterEncoding=UTF-8";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection var7 = DriverManager.getConnection(var6, var3, var4);
            Statement var8 = var7.createStatement();
            var8.executeUpdate(var1);
        } catch (Exception var9) {

        }

    }

    public ResultSet getRs(String var1) {
        try {
            String var2 = "com.mysql.jdbc.Driver";
            String var3 = "root";
            String var4 = "895772";
            String var5 = "teamwork";
            String var6 = "jdbc:mysql://106.15.94.218/" + var5 + "?useUnicode=true&characterEncoding=UTF-8";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection var7 = DriverManager.getConnection(var6, var3, var4);
            Statement var8 = var7.createStatement();
            ResultSet var9 = var8.executeQuery(var1);
            return var9;
        } catch (Exception var10) {
            return null;
        }
    }
}
