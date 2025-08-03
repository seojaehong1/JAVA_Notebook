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

<title>회원가입</title>

</head>







<body>

<form method ='post'>



<label>사번<br>

<input type = "text" name = "deptno" />

</label></br>



<label>이름<br>

<input type = "text" name = "dname" />

</label></br>



<label>사는곳<br>

<input type = "text" name = "loc" />

</label></br>


<input type = "submit" name="action" value = "사원추가" />

<input type = "submit" name="action" value = "사원정보수정" />

<input type = "submit" name="action" value = "사원정보삭제" />

<input type = "submit" name="action" value = "사원정보검색" />



<%

Connection conn = null;

Statement stmt = null;

ResultSet rs = null;

String deptno = request.getParameter("deptno");

String dname = request.getParameter("dname");

String loc = request.getParameter("loc");

String action = request.getParameter("action");

String sql = "";



try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/sakila", "root", "1234");

    stmt = conn.createStatement();
    
    out.println("요청된 액션 값: " + action + "<br>");
   
    if("사원추가".equals(action)){
    sql = String.format("insert into dept(deptno, dname, loc) values ('%s', '%s', '%s')", 
			deptno, dname, loc);

    stmt.executeUpdate(sql);
    }
    else if("사원정보수정".equals(action)){
        sql = String.format("update dept set deptno = '%s', dname = '%s', loc = '%s' where dname = '%s'", 
    			deptno, dname, loc, dname);

        stmt.executeUpdate(sql);
   }else if("사원정보삭제".equals(action)){
	   sql = String.format("delete from dept where dname='%s'",dname);
	   
	   stmt.executeUpdate(sql);
   }else if("사원정보검색".equals(action)){
	   rs = stmt.executeQuery("select * from dept");   
%>    
  <table>
<tr>
<th>부서번호</th><th>부서 이름</th><th>부서 위치</th>
</tr>
<%    
    while (rs.next()) {
%> 
<tr>  	
<td><%=rs.getString("deptno") %></td>
<td><%=rs.getString("dname") %></td>
<td><%=rs.getString("loc") %></td>
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