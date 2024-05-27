<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<%! String str1; %>
<%! String str2; %>
<html>
<head><title>This is a Jdbc Example</title></head>
<body>
<%
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}
try{
con = DriverManager.getConnection("jdbc:mysql://localhost/account","root", "");
st = con.createStatement();
str1=request.getParameter("username");
str2=request.getParameter("password");
rs = st.executeQuery("SELECT * from registration WHERE username='"+str1+"'");
    session.setAttribute("user",str1);
if(rs.next()) {
String uname = rs.getString(1);
String gmail = rs.getString(2);
String pass = rs.getString(3);
if(str1.equals(uname))
     {
      out.println("WELCOME");
      if(pass.equals(str2))
      {
          out.println(uname);
          out.println("<br><a href='index.html'>Click here to Continue to home page</a>");
      }
      else
      {
       String redirect="http://localhost:8080/shop/account.html";
        response.sendRedirect(redirect);
      //  out.println("<a href='account.html'></a>");
      }
     }
      else
  {
   String redirect="http://localhost:8080/shop/index.html";
  response.sendRedirect(redirect);
  }
}
rs.close();
st.close();
con.close();
}catch(SQLException exception){
out.println("<!--");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
exception.printStackTrace(pw);
out.print(sw);
sw.close();
pw.close();
out.println("-->");
}
%>
</body>
</html>
