import java.sql.*;


public class CreateTables {
    public static void main(String[] args) throws SQLException{
        Connection conn = getConnection();
        String[] createStatements = createTables();
        try (var statement = conn.createStatement()){
            conn.setAutoCommit(false);
            for(String str: createStatements) {
                statement.addBatch(str);
            }
            statement.executeBatch();
            conn.commit();
            System.out.println("Tables created");
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
    public static String[] createTables(){
        String[] strings = new String[7];
        strings[0] = "CREATE TABLE students(\n" +
                "snum integer, ssn integer, name varchar(10), \n" +
                "gender varchar(1), dob datetime, c_addr varchar(20), c_phone varchar(10), \n" +
                "p_addr varchar(20), p_phone varchar(10),\n" +
                "primary key(ssn),\n" +
                "UNIQUE(snum));";
        strings[1] = "CREATE TABLE departments(\n" +
                "code integer, name varchar(50), phone\n" +
                "varchar(10), college varchar(20),\n" +
                "primary key(code),\n" +
                "UNIQUE(name));";
        strings[2] = "CREATE TABLE degrees(\n" +
                "name varchar(50), level varchar(5), \n" +
                "department_code integer,\n" +
                "primary key(name, level),\n" +
                "FOREIGN KEY(department_code) REFERENCES departments(code));";
        strings[3] = "CREATE TABLE courses(\n" +
                "number integer, name varchar(50), description\n" +
                "varchar(50), credithours integer, level varchar(20), department_code integer,\n" +
                "primary key(number),\n" +
                "UNIQUE(name),\n" +
                "FOREIGN KEY(department_code) REFERENCES departments(code));";
        strings[4] = "CREATE TABLE register(\n" +
                "snum integer, course_number integer, regtime \n" +
                "varchar(20), grade integer,\n" +
                "primary key(snum, course_number),\n" +
                "FOREIGN KEY(snum) REFERENCES students(snum),\n" +
                "FOREIGN KEY(course_number) REFERENCES courses(number));";
        strings[5] = "CREATE TABLE major(\n" +
                "snum integer, name varchar(50), level varchar(5),\n" +
                "primary key(snum, name, level),\n" +
                "FOREIGN KEY(snum) REFERENCES students(snum),\n" +
                "FOREIGN KEY(name,level) REFERENCES degrees(name,level));";
        strings[6] = "CREATE TABLE minor(\n" +
                "snum integer, name varchar(50), level varchar(5),\n" +
                "primary key(snum, name, level),\n" +
                "FOREIGN KEY(snum) REFERENCES students(snum),\n" +
                "FOREIGN KEY(name,level) REFERENCES degrees(name,level));";
        return strings;
    }
}