<%@page import="com.note.N_T"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hiber.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!doctype html>
<html lang="en">
  <head>
  <title>All note:NoteTaker</title>
   <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container">
    <%@include file="navBar.jsp" %>
    <br>
    <h1 class="text-uppercase">All Notes:</h1>
    <div class="row">
    <div class="col-12">
     <%
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from N_T");
    List<N_T>list=q.list();
    for(N_T note:list)
    {
   %>
    	<div class="card mt-3">
  <img class="card-img-top m-4 mx-auto" style="max-width:100px" src="image/notepad.png" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%=note.getTitle() %></h5>
    <p class="card-text"><%=note.getContent() %></p>
    <p><b class="card-text"><%=note.getAddedDate() %>		</p>
    <div class="container text-center">
      <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    </div>
  
  </div>
</div>
   <%
    }
    
    s.close();
    %>
    
    </div>
    </div>
    
    
    
   
    
    </div>
  <
  </body>
 </html>