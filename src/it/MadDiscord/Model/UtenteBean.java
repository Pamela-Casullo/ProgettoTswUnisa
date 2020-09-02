package it.MadDiscord.Model;

import java.io.Serializable;

public class UtenteBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nome_utente;
	private String password_utente;
	private String email;
	
	public String getNome_utente() {
		return nome_utente;
	}
	
	public void setNome_utente(String nome_utente) {
		this.nome_utente= nome_utente;
	}
	public String getPassword_utente() {
		return password_utente;
	}
	public void setPassword_utente(String password_utente) {
		this.password_utente=password_utente;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return nome_utente+","+password_utente+","+email;
	}
	
	@Override
	public boolean equals(Object other) {
		return(this.getNome_utente()==((UtenteBean)other).getNome_utente());
	}

	
	
}
