import java.sql.*;
public class Query {
    public static void main(String[] args) throws SQLException{
        Connection conn = getConnection();
        String[] createStatements = query();
        try (var statement = conn.createStatement()){
            ResultSet rs = statement.executeQuery(createStatements[0]);
            System.out.println("1.The student number and ssn of the student whose name is \"Becky\"");
            while(rs.next()){
                int snum = rs.getInt("snum");
                int ssn = rs.getInt("ssn");
                System.out.println("snum: " + snum + " ssn: " + ssn);
            }
            rs = statement.executeQuery(createStatements[1]);
            System.out.println("2. The major name and major level of the student whose ssn is 123097834");
            while(rs.next()){
                String majorName = rs.getString("major.name");
                String level = rs.getString("level");
                System.out.println("major name: " + majorName + " level: " + level );
            }
            rs = statement.executeQuery(createStatements[2]);
            System.out.println("3. The names of all courses offered by the department of Computer Science");
            while(rs.next()){
                String courseName = rs.getString("courses.name");
                System.out.println("course name: " + courseName);
            }
            rs = statement.executeQuery(createStatements[3]);
            System.out.println("4. All degree names and levels offered by the department Computer Science");
            while(rs.next()){
                String majorName = rs.getString("degrees.name");
                String level = rs.getString("level");
                System.out.println("Degree name: " + majorName + ", level: " + level );
            }
            rs = statement.executeQuery(createStatements[4]);
            System.out.println("5. The names of all students who have a minor");
            while(rs.next()){
                String studentName = rs.getString("students.name");
                System.out.println("Student name: " + studentName);
            }

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
    public static String[] query(){
        String[] strings = new String[5];
        strings[0] =  "SELECT snum, ssn\n" +
                "FROM students\n" +
                "WHERE name = \"Becky\";";
        strings[1] = "SELECT major.name, level\n" +
                "FROM major\n" +
                "INNER JOIN students\n" +
                "\tON major.snum = students.snum\n" +
                "WHERE ssn= 123097834;";
        strings[2] = "SELECT courses.name\n" +
                "FROM courses\n" +
                "INNER JOIN departments\n" +
                "\tON department_code = code\n" +
                "WHERE code = 401;";
        strings[3] = "SELECT degrees.name, level\n" +
                "FROM degrees\n" +
                "INNER JOIN departments\n" +
                "\tON department_code = code\n" +
                "WHERE code = 401;";
        strings[4] = "SELECT students.name\n" +
                "FROM students\n" +
                "JOIN minor\n" +
                "ON minor.snum = students.snum;";
        return strings;
    }

}
