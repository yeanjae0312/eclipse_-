<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="javamysql.ConnectDB"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Object" %>
<%@ page import="org.json.simple.JSONObject"%> 
<%@ page import="org.json.simple.JSONArray"%>
    <%
    
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    
    /*
    //String userName = request.getParameter("userName");
    //String userEmail = request.getParameter("userEmail");
    
    String type = request.getParameter("type");
    
    ConnectDB connectDB = ConnectDB.getInstance();
    if(type.equals("login")) {
    	String returns2 = connectDB.logindb(userId,userPw);
    	out.print(returns2);
    	System.out.println(returns2);
    	 
    }
    */
    
    
    System.out.println(userId);
    System.out.println(userPw);
    //System.out.println(userName);
    //System.out.println(userEmail);
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean result = false;
    String [] getDBData = {"","","","","","","","","",""};
    
    try {
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection("jdbc:mysql://yeanjae0312.cut3keoa0m4b.ap-northeast-2.rds.amazonaws.com:3306/yeanjae0312", "yeanjae0312","duswo115!!");
    	System.out.println("데이터베이스 연동 성공");
    	if(conn == null){
    		throw new Exception("데이터베이스에 연결할 수 없습니다.");
    	}
    	String sql = "select userid,password from user where userid=? and password=?";
    	
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, userId);
    	//pstmt.setString(2, userEmail);
    	pstmt.setString(2, userPw);
    	//pstmt.setString(4, userName);
    	
    	
    	rs = pstmt.executeQuery();
    	
    	if(rs.next()) {
    		result = true;
    		JSONObject jsonMain = new JSONObject();
    		JSONArray jArray = new JSONArray();
    		JSONObject jObject = new JSONObject();
    		
    		
    		jObject.put("userId",rs.getString(1));
    		jObject.put("userPw",rs.getString(2));
    		
    		 //윤재코드
    		//jObject.put("userName", rs.getString(3));
    		//jObject.put("groupName", rs.getString(5));
    		//jObject.put("groupPw", rs.getString(6));
    		
    		//jObject.put("userEamil", rs.getString(2));
    		//jObject.put("userName", rs.getString(4));
    		
    		
    		jArray.add(0, jObject);
    		
    		jsonMain.put("datasend", jArray);
    		
    		out.println(jsonMain);
    		out.flush();
        
    	}
    	else {
    		result = false;
    		out.print("0");
    		System.out.println("0");
    	}
		
    }finally {
    	try {
    		pstmt.close();
    	}
    	catch(Exception e){}
    	try{
            conn.close();
        }
        catch(Exception ignored){
        }
    }
    
    %>