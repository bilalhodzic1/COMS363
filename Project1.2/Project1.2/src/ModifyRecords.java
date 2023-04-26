import java.sql.*;
public class ModifyRecords {
    public static void main(String[] args) throws SQLException{
        Connection conn = getConnection();
        String[] createStatements = modifyRecords();
        try (var statement = conn.createStatement()){
            conn.setAutoCommit(false);
            for(String str: createStatements) {
                statement.addBatch(str);
            }
            statement.executeBatch();
            conn.commit();
            System.out.println("Records Modified");
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
    public static String[] modifyRecords(){
        String[] strings = new String[3];
        strings[0] = "UPDATE students\n" +
                "SET name = \"Scott\"\n" +
                "WHERE ssn = \"746897816\";";
        strings[1] = "UPDATE major, students\n" +
                "SET major.name = \"Computer Science\", level = \"MS\"\n" +
                "WHERE major.snum = students.snum AND ssn = \"746897816\";";
        strings[2] = "DELETE FROM register\n" +
                "WHERE regtime = \"SPRING2021\";";
        return strings;
    }

}
