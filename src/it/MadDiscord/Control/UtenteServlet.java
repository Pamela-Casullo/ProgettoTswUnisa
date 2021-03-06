package it.MadDiscord.Control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.MadDiscord.Model.UtenteBean;
import it.MadDiscord.Model.UtenteModelDM;
import it.MadDiscord.Model.UtenteBean.Tipo;


@WebServlet(urlPatterns = {"/Utente","/admin/Utente"})
public class UtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModelDM model = new UtenteModelDM();
	
    public UtenteServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sort = request.getParameter("sort");
		
		String action = request.getParameter("action");
		System.out.println("action uServlet = "+action);

			try {
				if(action != null) {
					switch (action) {
					
					case "insertUser":
						try {
							String nome_utente = request.getParameter("nome_utente");
							String email = request.getParameter("email");
							String password_utente = request.getParameter("password_utente");
							UtenteBean uBean = new UtenteBean();

								uBean.setNome_utente(nome_utente);
								uBean.setPassword_utente(password_utente);
								uBean.setEmail(email);
								
								uBean.setTipo(Tipo.admin);
								model.doSave(uBean);
							

							request.setAttribute("message", "Utente"+uBean.getNome_utente()+"salvato");
							
						} catch (SQLException e) {
							System.out.println(e);
						}
					break;
					
					case "updateUser":
						try {
							String nome_utente = request.getParameter("nome_utente");
							String password_utente = request.getParameter("password_utente");
							
							UtenteBean uBean = new UtenteBean();
							
							uBean.setNome_utente(nome_utente);
							uBean.setPassword_utente(password_utente);
							
							model.doUpdate(uBean);
							request.setAttribute("message", "Utente"+uBean.getNome_utente()+"aggiornato");
						} catch (SQLException e) {
							System.out.println(e);
						}
					break;
					
					case "deleteUser":
						try {

							String nome_utente = request.getParameter("nome_utente");

							if(model.doRetrieveBy(nome_utente)!=null)
									model.doDelete(nome_utente);

							/*
							UtenteBean uBean = model.doRetrieveBy(nome_utente);
							System.out.println("nome Utente=" + nome_utente);
							
							model.doDelete(uBean);*/

						} catch (SQLException e) {
							System.out.println(e);
						}
					break;
					
					case "getUtente":
						String nome_utente = request.getParameter("nome_utente");
						
						request.removeAttribute("user");
						try {
							request.setAttribute("user", model.doRetrieveBy(nome_utente));
						} catch (SQLException e) {
							System.out.println(e);
						}
					break;
					
					}
				}
			} catch (NumberFormatException e) {
				System.out.println("Error: "+e.getMessage());
				request.setAttribute("error", e.getMessage());
			}
			
			try {
				request.removeAttribute("users");
				request.setAttribute("users", model.doRetrieveAll(sort));
			} catch (SQLException e) {
				System.out.println("Error: "+e.getMessage());
				request.setAttribute("error", e.getMessage());
			}
		
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/admin/gestioneUtenti.jsp");
			dispatcher.forward(request, response);
		
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
