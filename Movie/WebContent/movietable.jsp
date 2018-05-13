<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");
	try {
		String url="jdbc:mysql://yeanjae0312.cut3keoa0m4b.ap-northeast-2.rds.amazonaws.com:3306/yeanjae0312";
		
		Connection conn = DriverManager.getConnection(url, "yeanjae0312", "duswo115!!");
		System.out.println("데이터베이스 연동 성공");
		
		Statement stmt = conn.createStatement();
		
		//String strSQL="";
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>