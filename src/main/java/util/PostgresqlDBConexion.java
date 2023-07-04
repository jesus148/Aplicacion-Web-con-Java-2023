package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class PostgresqlDBConexion {

    // Permite el acceso a los parámetros del archivo properties
    private static ResourceBundle rb = ResourceBundle.getBundle("database");

    // Accede a las clases del postgresql-XXXX.jar
    static {
        try {
            Class.forName(rb.getString("driverPos"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Método para crear conexiones
    public static Connection getConexion() {
        Connection salida = null;
        try {
            salida = DriverManager.getConnection(
                    rb.getString("urlPos"),
                    rb.getString("usernamePos"),
                    rb.getString("passwordPos"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salida;
    }
}
