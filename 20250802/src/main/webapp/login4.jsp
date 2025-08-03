<%@ page import="java.sql.*, javax.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method ="post">


<label>아이디<br>
<input type = "text" name = "id1" />
</label><br>

<label>비번<br>
<input type = "text" name = "pw1" />
</label><br>


<input type = "submit" name="action" value = "내정보페이지" />



<%

Connection conn = null;

Statement stmt = null;

ResultSet rs = null;

String id2 = request.getParameter("id1");

String pw2 = request.getParameter("pw1");


String action = request.getParameter("action");

String sql = "";

if(id2 != null && pw2 != null && "내정보페이지". equals(action)){

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/sakila", "root", "1234");

    stmt = conn.createStatement();
   
 
  	sql = String.format("select * from login where id1 = '%s' AND pw1 = '%s'",id2, pw2);
   	rs = stmt.executeQuery(sql);   
 
   	if(rs.next()){
   		response.sendRedirect("login2.jsp");
   	}else{
  		out.println("로그인실패"); 		
   	}
  
    } catch (SQLException e) {

    out.println(e.getMessage());

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
}
%>


</form>
</body>
</html>