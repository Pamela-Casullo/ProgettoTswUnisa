package it.MadDiscord.login.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import it.MadDiscord.login.bean.LoginBean;
import it.MadDiscord.login.database.LoginDat;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDat loginDat;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
		loginDat = new LoginDat();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome_utente = request.getParameter("nome_utente");
		String password_utente = request.getParameter("password_utente");
		
		LoginBean logBean = new LoginBean();
		logBean.setNome_utente(nome_utente);
		logBean.setPassword_utente(password_utente);
		
		try {
			
			if(loginDat.validate(logBean) != null) {
				HttpSession session= request.getSession();
			    session.setAttribute("nome_utente", nome_utente);
				response.sendRedirect("index_user.jsp");
			} else {
				String message = "Hai sbagliato qualcosa, riprova!";
				request.setAttribute("message", message);
				
				response.sendRedirect("login.jsp");
			}
			

		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
