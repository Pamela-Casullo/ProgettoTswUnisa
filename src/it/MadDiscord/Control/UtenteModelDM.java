package it.MadDiscord.Control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.MadDiscord.DBConnectionPool;
import it.MadDiscord.Model.UtenteBean;

public class UtenteModelDM {
	public UtenteBean doRetrieveBy(String nome_utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UtenteBean bean = new UtenteBean();
		
		String selectSQL ="SELECT * FROM UserTable WHERE nome_utente=?";
		
		try {
			connection = DBConnectionPool.getConnection(); 
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, getString(nome_utente));
			
			System.out.println("doRetriveBy:"+preparedStatement.toString());
			ResultSet rs= preparedStatement.executeQuery();
			
            while(rs.next()) {

                bean.setId(rs.getInt("id"));
                bean.setNome_oggetto(rs.getString("nome_oggetto"));
                bean.setPrezzo(rs.getInt("prezzo"));
                bean.setQuant(rs.getInt("quant"));
            }
           System.out.println(bean);
		} finally {
				try {
					if(preparedStatement != null) 
						preparedStatement.close();
				} finally {
					DBConnectionPool.releaseConnection(connection);
				}
			}
			
		return bean;
		
	}

	public Collection<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<UtenteBean> products = new LinkedList<UtenteBean>();
		
		String selectSQL = "SELECT * FROM ShopTable";
		
		if(order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				UtenteBean bean = new UtenteBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNome_oggetto(rs.getString("nome_oggetto"));
				bean.setPrezzo(rs.getInt("prezzo"));
				bean.setQuant(rs.getInt("quant"));
				
				products.add(bean);
			}
		} finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DBConnectionPool.releaseConnection(connection);
			}
		}
		
		return products;
	}

	public void doSave(UtenteBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO ShopTable" +
		"(nome_oggetto, prezzo, quant)"+"VALUES( ?, ?, ?)";
		
		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
		
			preparedStatement.setString(1, product.getNome_oggetto());
			preparedStatement.setString(2, product.getPrezzo());
			preparedStatement.setString(3, product.getQuant());
			
			System.out.println("doSave "+preparedStatement.toString());
			
			preparedStatement.executeUpdate();
			connection.commit();
			
			} finally {
					try {
						if(preparedStatement != null) 
							preparedStatement.close();
					} finally {
						DBConnectionPool.releaseConnection(connection);
					}
				}
		}


	public void doUpdate(UtenteBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String updateSQL= "UPDATE ShopTable SET nome_oggetto=?, prezzo=?, quant=? WHERE id=?";

		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, product.getNome_oggetto());
			preparedStatement.setString(2, product.getPrezzo());
			preparedStatement.setString(3, product.getQuant());
			
			preparedStatement.setString(4, product.getNome_utente());
			
			System.out.println("doUpdate: "+preparedStatement.toString());
		
			preparedStatement.executeUpdate();
			connection.commit();
			
		} finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DBConnectionPool.releaseConnection(connection);
			}
		}
	}
		
		

	public void doDelete(UtenteBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String deleteSQL= "DELETE FROM ShopTable WHERE id=?";
		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, product.getNome_utente());
			System.out.println("DoDelete "+preparedStatement.toString());
		
			preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DBConnectionPool.releaseConnection(connection);
			}
		}
	}
}

