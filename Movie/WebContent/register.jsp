<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "javamysql.ConnectDB" %>
<%@ page import="java.sql.*"%>
    <%
    
    
    String userID = request.getParameter("userId");
    String userPASSWORD = request.getParameter("userPw");
    String userNAME = request.getParameter("userName");
    String userEMAIL = request.getParameter("userEmail");
    //String type = request.getParameter("type");
    //String groupID = request.getParameter("groupCode");
    //String groupPW = request.getParameter("groupPw");
    
    System.out.println("연결됨");
    System.out.println(userID);
    System.out.println(userPASSWORD);
    System.out.println(userNAME);
    System.out.println(userEMAIL);
    //System.out.println(groupID);
    //System.out.println(groupPW);
    
    request.setCharacterEncoding("UTF-8");
    
    
    	//데이터 베이스 연결 관련 변수 선언
  	 Connection conn = null;
     PreparedStatement pstmt = null;
     int cnt = 0;
   	 ResultSet rs = null;
   	 boolean result = false;
   	 
   	 

    try {
    	//JDBC 드라이버 로드
    	Class.forName("com.mysql.jdbc.Driver");
    	
    	//데이터베이스 연결정보를 이용해 Connection = conn 인스턴스 확보
    	conn = DriverManager.getConnection("jdbc:mysql://yeanjae0312.cut3keoa0m4b.ap-northeast-2.rds.amazonaws.com:3306/yeanjae0312", "yeanjae0312","duswo115!!");
    	//한글깨짐 해결
    	//DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/user?useUnicode=true&characterEncoding=EUC_KR","root","qkqh11");
    	
    	System.out.println("데이터베이스 연동 성공");
    	
    	if(conn == null){
    		throw new Exception("데이터베이스에 연결할 수 없습니다.");
    	}
    	
    	//SQL 에 삽입할 커리 문장  String 으로 저장
    	String sql = "INSERT INTO user VALUES(?,?,?,?)";
    	
    	
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, userID);
    	pstmt.setString(2, userPASSWORD);
    	pstmt.setString(3, userEMAIL);
    	pstmt.setString(4, userNAME);
    	//pstmt.setString(5, groupID);
    	//pstmt.setString(6, groupPW);
    	//pstmt.setString(5, "1234");

    	
    	cnt = pstmt.executeUpdate();
    	System.out.println("시스템에 " + cnt + "개가 추가되었습니다.");
    	
    	
    	if(rs.next()) {
    		result = true;
    		out.print(rs.getString(1));
    		System.out.println(rs.getString(1));
    	}
    	else {
    		result = false;
    		out.print("0");
    		System.out.println("0");
    	}
		
		
		
    }catch(Exception e){
    	System.out.println("SQLException : " + e.getMessage());
    }
    finally {
    	try {
    		if(pstmt != null){
    			pstmt.close();
    		}
    		//pstmt.close();
    	}
    	catch(Exception e){
    		
    	}
    	try{
    		if(conn != null){
    			conn.close();
    		}
            //conn.close();
        }
        catch(Exception ignored){
        }
    }
    
    %>