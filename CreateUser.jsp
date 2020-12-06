<%@ page language="java" import="java.sql.*" %>

<body bgcolor="#FFFFE0">
<BR><BR><BR>
<%
	String uid=request.getParameter("uid");
	String pass=request.getParameter("pass");
String mail=request.getParameter("mail");
String coll=request.getParameter("coll");
String dep=request.getParameter("dep");
String utype=request.getParameter("utype");

	
try{
               Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalan","root","");
		Statement st=con.createStatement();

                String sql="select userid from wbmslogin where userid='"+uid+"'";
                System.out.println(" Query : "+sql);
                ResultSet rs=st.executeQuery(sql);

                if(rs.next())
                {
                        out.println("<center><H1> User ( "+uid+" ) already present <BR>");
                        out.println(" Please Choose another Name </H1><BR>");
                        out.println("<a href=reg.html>Create New User</a></center>");
                }
                else
                {
                   sql="insert into wbmslogin values('"+uid+"','"+pass+"','"+mail+"','"+coll+"','"+dep+"','"+utype+"')";
                   int n=st.executeUpdate(sql);
                        if(n>0)
                        {
                             out.println("<p><center><h1> User ( "+uid+" ) Created </h1></center>");
                             out.println("<p><center><h1> <a href='BackHomePage.html'>Back To HOME Page</a></h1></center>"); 
			     out.println("<p><center><h1> <a href='REGISTRATION FORM.html'>Back To Sign in Form</a> </h1></center>");	
                        }
                        else
                        {
                             out.println("<p><center><h1> User ( "+uid+" ) Can't be Created </h1></center>");                        
                        }
                }
	}catch(Exception e)
	{
	                out.println(e);
	}

%>

</body>

