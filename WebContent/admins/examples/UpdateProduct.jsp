<%-- 
    Document   : UpdateProduct
    Created on : Oct 23, 2020, 9:41:56 AM
    Author     : Rajesh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String str="";
    Object ob=session.getAttribute("prod_up_msg");
    if(ob!=null)
        str=ob.toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product- Page</title>
         <style>
            body{
                margin: 0px;
            }
            header{
                min-height: 40px;
                line-height: 40px;
                background-color: navy;
            }
            nav{
                min-height: 40px;
                line-height: 40px;
                background-color: gray;
            }
            .navLink{
                text-decoration: none;
                font-size: 18px;
                font-family: verdana;
                display: inline-block;
                width: 120px;
                text-align: center;
                color:bisque;
            }
            .navLink:hover{
                background-color: red;
            }
            .signin_sinup_Link{
                text-decoration: none;
                font-size: 18px;
                font-family: verdana;
                display: inline-block;
                width: 120px;
                text-align: center;
                color:firebrick;
                float: right;
            }
            .signin_sinup_Link:hover{
                background-color: green;
                
            }
            main{
                min-height: 440px;
            }
            footer{
                min-height: 40px;
                line-height: 40px;
                background-color: black;
                color: white;
                font-family: monotype corsiva;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1 style="text-align: center;color: white;margin: 0px;">E-Shoppy...!(Update Product)</h1>
            <p style="position: 2px;color:yellow;font-size:18px;margin: 20px">Welcome : 
                <%
                    out.println(session.getAttribute("username").toString());
                %>
            </p>
        </header>
        <nav>
            <a class="navLink" href="#">Home</a>
            <a class="navLink" href="#">Gallery</a>
            <a class="navLink" href="#">Product</a>
            <a class="navLink" href="#">About US</a>
            
            <a class="signin_sinup_Link" href="#">Logout</a>
        
        </nav>
            <main>
                <br>
                <p style="color:red;font-size: 18px;text-align: center"><% out.println(str);%></p>
                <table align="center" border='1' style='background-color: lightgray'>
                   
                    <%
                        int prodid=Integer.parseInt(request.getParameter("pid"));
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","root");  
                            PreparedStatement stmt=con.prepareStatement("select * from product where pid=?");
                            stmt.setInt(1,prodid);
                            ResultSet rs=stmt.executeQuery();
                            rs.next();
                                
                                out.println("<tr><td>Pid</td><td><input type='text' name='pid' value='"+rs.getInt(1)+"' readonly required /></td></tr>");
                                out.println("<tr><td>Name</td><td><input type='text' name='pname' value='"+rs.getString(2)+"' required/></td></tr>");
                                out.println("<tr><td>Category</td><td><input type='text' name='cat' value='"+rs.getString(3)+"' required/></td></tr>");
                                out.println("<tr><td>Quantity</td><td><input type='text' name='qty' value='"+rs.getInt(4)+"' required/></td></tr>");
                                out.println("<tr><td>Price</td><td><input type='text' name='price' value='"+rs.getFloat(5)+"' required/></td></tr>");
                                out.println("<tr><td>Description</td><td><input type='text' name='desc' value='"+rs.getString(6)+"' required/></td></tr>");
                                out.println("<tr><td></td><td><input type='submit' value='UPDATE'/></td></tr>");
                                out.println("</form>");
                        }
                        catch(Exception e){
                            e.printStackTrace();
                        }
                    %>
                </table>
            </main>
        <footer>&COPY;Copyright-2020. All rights reserved.</footer> 
    </body>
</html>
