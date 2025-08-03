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

<title>로그인</title>

</head>







<body>

<form method ='post'>



<label>아이디<br>

<input type = "text" name = "id1" />

</label></br>



<label>비번<br>

<input type = "text" name = "pw1" />

</label></br>


<input type = "submit" name="action" value = "로그인" />





<%

Connection conn = null;

Statement stmt = null;

ResultSet rs = null;

String id2 = request.getParameter("id1");

String pw2 = request.getParameter("pw1");


String action = request.getParameter("action");

String sql = "";



try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/sakila", "root", "1234");

    stmt = conn.createStatement();
    
    out.println("요청된 액션 값: " + action + "<br>");
   
   
    if("비번변경".equals(action)){
        sql = String.format("update dept set pw1 = '%s' where id1 = '%s' AND  pw1 = '%s'", 
    			pw2, pw2);

        stmt.executeUpdate(sql);
   }else if("회원탈퇴".equals(action)){
	   sql = String.format("delete from dept where id1='%s' AND PW1 ='%s'", id2, pw2);
	   
	   stmt.executeUpdate(sql);
   }else if("내정보검색".equals(action)){
	   rs = stmt.executeQuery("select name1, address, email, phone from login");   
%>    
  <table>
<tr>
<th>부서번호</th><th>부서 이름</th><th>부서 위치</th>
</tr>
<%    
    while (rs.next()) {
%> 
<tr>  	
<td><%=rs.getString("name1") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("phone") %></td>
</tr>  
	
<%    
    }
%>
</table>
<% 
} 
    } catch (SQLException e) {

    

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

</body>

</html>