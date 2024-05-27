<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<%
String username=request.getParameter("username");
String email=request.getParameter("email");
String password=request.getParameter("password");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost/account","root", "");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into registration(username,email,password) values('"+username+"','"+email+"','"+password+"')");
           out.println("Data is registered successfully");
           session.setAttribute("user",username);
          // String red="http://localhost:8080/shop/index.jsp";
          // response.sendRedirect(red);
           out.println(username);
           out.println("<br><a href='account.html'>click here to Login</a>");
}catch(SQLException e){
  out.println(e);
}
%>
