<%@page import="com.note.N_T"%>
<%@page import="com.hiber.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add_Note</title>
  <%@include file="all_js_css.jsp" %>
</head>
<body>
 <div class="cotainer">
    <%@include file="navBar.jsp" %>
    <h1>edit post</h1>
    
    <%
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    Session s=FactoryProvider.getFactory().openSession();
    N_T note=(N_T)s.get(N_T.class,noteId);
    
    %>
    <br>
    <!-- this is add form -->
    <form action="UpdateServlet" method="post">
    <input value="<%=note.getId() %>" name="noteId" type="hidden" />
    
  <div class="form-group">
    <label for="title">Note Title </label>
    <input 
    name="title"
    required type="text" 
    class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Here"
    value="<%=note.getTitle() %>"
    />
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
   <textarea 
   name="content"
    required
    id="content" 
    placeholder="enter your content here";
    class="form-control"
    style="height:300px;"
    ><%=note.getContent() %></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-success">save updated post</button>
  </div>
  
</form>
    </div>	
</body>
</html>