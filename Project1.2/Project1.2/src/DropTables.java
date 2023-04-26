import java.sql.*;
public class DropTables {
    public static void main(String[] args) throws SQLException{
        Connection conn = getConnection();
        String[] createStatements = dropTables();
        try (var statement = conn.createStatement()){
            conn.setAutoCommit(false);
            for(String str: createStatements) {
                statement.addBatch(str);
            }
            statement.executeBatch();
            conn.commit();
            System.out.println("Tables dropped");
        }
    }
    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        String username = "coms363";
        String password = "password";
        String dbServer = "jdbc:mysql://localhost:3306/Project1";
        conn = DriverManager.getConnection(dbServer,username,password);
        System.out.println("Connection established");
        return conn;
    }
    public static String[] dropTables(){
        String[] strings = new String[7];
        strings[0] = "DROP TABLE major;";
        strings[1] = "DROP TABLE minor;";
        strings[2] = "DROP TABLE degrees";
        strings[3] = "DROP TABLE register;";
        strings[4] = "DROP TABLE courses;";
        strings[5] = "DROP TABLE departments;";
        strings[6] = "DROP TABLE students;";
        return strings;
    }
}
