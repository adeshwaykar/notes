package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hiber.FactoryProvider;
import com.note.N_T;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			 N_T note1=new N_T(title, content, new Date());
			// System.out.println(note1.getId()+":"+note1.getContent());
			 Session s=FactoryProvider.getFactory().openSession();
			 Transaction t=s.beginTransaction();
			 s.save(note1);
			 t.commit();
			 s.close();
			 response.setContentType("text/html");
			 PrintWriter out=response.getWriter();
			 out.println("<h1 style='text-align:center;'>Note is added seccefully</h1>");
			 out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>view all notes</a></h1>");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}