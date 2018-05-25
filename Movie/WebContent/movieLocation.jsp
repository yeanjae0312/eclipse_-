<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.net.URLEncoder"%>
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
		
		String strSQL="select * from movietheater;";
		
		pstmt = conn.prepareStatement(strSQL);
		System.out.println(strSQL);
		
		rs = stmt.executeQuery(strSQL);
		
		//JSONArray arr = new JSONArray();
		JSONObject jsonMain = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		while(rs.next()) {
			System.out.println("while안");
			JSONObject jObject = new JSONObject();
			
			//String theaterid = rs.getString("theaterid");
			String theatername = rs.getString(2);
			String location_x = rs.getString(3);
			String location_y = rs.getString(4);
			
			jObject.put("theatername", rs.getString(2));
			jObject.put("location_x", rs.getString(3));
			jObject.put("location_y", rs.getString(4));
			
			jArray.add(jObject);
			
			//System.out.println("영화관이름: "+theatername+", x좌표: "+location_x+", y좌표: "+location_y);
			//System.out.println(theaterid+","+theatername+","+location_x+","+location_y);
			//out.println("영화관이름: "+theatername+", x좌표: "+location_x+", y좌표: "+location_y+"//");
			//out.println(theaterid+","+theatername+","+location_x+","+location_y);
			
			/*
			String theatername = URLEncoder.encode(rs.getString("theatername"), "UTF-8");
			JSONObject obj = new JSONObject();
			obj.put("theatername", theatername);
			if(obj != null) {
				arr.add(obj);
			}
			out.println(arr);
			*/
			
		}
		jsonMain.put("datasend", jArray);
		out.println(jsonMain);
		out.flush();
		System.out.println("jsonMain = " + jsonMain);
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movieLocation.jsp</title>
</head>
<body>

</body>
</html>