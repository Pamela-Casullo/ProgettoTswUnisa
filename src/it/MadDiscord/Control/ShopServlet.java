package it.MadDiscord.Control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.MadDiscord.Model.Cart;
import it.MadDiscord.Model.ShopBean;
import it.MadDiscord.Model.ShopModelDM;



@WebServlet("/Shop")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static ShopModelDM model = new ShopModelDM();

    public ShopServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		@SuppressWarnings("unchecked")
		Cart<ShopBean> cart = (Cart<ShopBean>) request.getSession().getAttribute("carrello");
		
		if(cart==null) {
			cart = new Cart<ShopBean>();
			request.getSession().setAttribute("carrello", cart);
		}
		String sort = request.getParameter("sort");
		
		String action = request.getParameter("action");
		
	
		if(action!=null) {
			if(action.equals("addCart")) {
					String id=request.getParameter("id");
					ShopBean bean;
					try {
						bean = model.doRetrieveBy(id);
						if(bean!=null && !bean.isEmpty()) {
							cart.addItem(bean);
							request.setAttribute("message", "Prodotto"+bean.getNome_oggetto()+" aggiunto al carrello");
					}} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
		
				}
		
		}
		request.setAttribute("cart", cart);
	
	
	try {
		request.removeAttribute("products");
		request.setAttribute("products", model.doRetrieveAll(sort));
		
	} catch (SQLException e) {
		System.out.println("Error: "+e.getMessage());
		request.setAttribute("error", e.getMessage());
	}
	
	
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/shop.jsp");
	dispatcher.forward(request, response);
	
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
