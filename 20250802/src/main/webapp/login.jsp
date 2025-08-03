<%@ page import="java.sql.*, javax.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>회원가입</title>

</head>







<body>

<form >



<label>이름<br>

<input type = "text" name = "name1" />

</label></br>


<label>아이디<br>

<input type = "text" name = "id1" />

</label></br>



<label>패스워드<br>

<input type = "text" name = "pw1" />

</label></br>


<label>주소<br>

<input type = "text" name = "address" />

</label></br>



<label>email<br>

<input type = "text" name = "email" />

</label></br>



<label>전화번호<br>

<input type = "text" name = "phone" />

</label></br>



<input type = "submit" value = "회원가입" />



<%

Connection conn = null;

Statement stmt = null;

ResultSet rs = null;

String name = request.getParameter("name1");

String id = request.getParameter("id1");

String pw = request.getParameter("pw1");

String address = request.getParameter("address");

String email = request.getParameter("email");

String phone = request.getParameter("phone");

String sql = "";



try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/sakila", "root", "1234");

    stmt = conn.createStatement();

    sql = String.format("insert into login(name1, id1, pw1, address, email, phone) values ('%s', '%s', '%s', '%s', '%s', '%s')", 

			name, id, pw, address, email, phone);

    stmt.executeUpdate(sql);

    

} catch (SQLException e) {

    out.println("데이터베이스 오류: " + e.getMessage());

} catch (ClassNotFoundException e) {

    out.println("드라이버를 찾을 수 없습니다: " + e.getMessage());

} finally {

    try {

        if (rs != null) rs.close();

        if (stmt != null) stmt.close();

        if (conn != null) conn.close();

    } catch (SQLException e) {

        out.println("리소스를 닫는 도중 오류 발생: " + e.getMessage());

    }

}

%>



</form>
<form action="login4.jsp">
<input type="submit" value = "로그인" />

</form>
</body>

</html>