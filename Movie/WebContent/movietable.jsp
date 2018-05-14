<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.net.URLEncoder" %>
<%@ page import="org.json.simple.JSONObject"%> 
<%@ page import="org.json.simple.JSONArray"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");
	try {
		String url="jdbc:mysql://yeanjae0312.cut3keoa0m4b.ap-northeast-2.rds.amazonaws.com:3306/yeanjae0312";
		
		Connection conn = DriverManager.getConnection(url, "yeanjae0312", "duswo115!!");
		System.out.println("데이터베이스 연동 성공");
		if(conn == null){
    		throw new Exception("데이터베이스에 연결할 수 없습니다.");
    	}
		stmt = conn.createStatement();
		
		String strSQL="select theatername from movietheater";
		pstmt = conn.prepareStatement(strSQL);
		System.out.println(strSQL);
		
		rs = stmt.executeQuery(strSQL);
		JSONArray arr = new JSONArray();
		
		while(rs.next()) {
			String theatername = URLEncoder.encode(rs.getString("theatername"), "UTF-8");
			JSONObject obj = new JSONObject();
			obj.put("theatername", theatername);
			if(obj != null) {
				arr.add(obj);
			}
			out.println(arr);
			
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movietable.jsp</title>
</head>
<body>

</body>
</html>