<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection, it.MadDiscord.Model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Collection <?> articles =(Collection<?>) request.getAttribute("articles");

	String error =(String)request.getAttribute("error");

	if(articles==null&& error == null){
	response.sendRedirect(response.encodeRedirectURL("./Article"));
		return;
	}


	ArticleBean aBean = (ArticleBean) request.getAttribute("article");


%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<title>GESTIONE ARTICOLI</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class=Articoli style="color:white">
<h1>Inserimento degli articoli al sito. Sono richiesti un titolo, un'immagine ed un contenuto(200 caratteri max)</h1>
	
	
	<form action="<%=response.encodeURL("Article?action=insert")%>" enctype="multipart/form-data" method=post>
	
		<table border="">
		<tr>
		<td> Titolo	</td>
		<td><input type="text" class=selettore placeholder="Inserisci un titolo" name="titolo" size=50></td>
		</tr>
		<tr><td> Contenuto</td>
		<td>
	<input type="text" class=selettore placeholder="Inserisci il contenuto" name="cont" size=50></td>
		</tr>
		<tr><th> Immagine</th>
		<th>
			<div class=immagine>
			<input type="file" class=selettore placeholder="Inserisci un'immagine" name="immagine" size=50>	
			</div></th>
		</tr>
		<tr>
		<td colspan=2>	
		<input type="submit" value="inserisci">
	
		</td>
		</tr>
		</table>
	
	
	<h2>Elenco articoli. Selezionarne uno per visionarlo/modificarlo.</h2>
	</form>
	
<table style="color:white" border="">
	<tr>
		<th>Titolo</th>
		<th>Contenuto</th>
		<th>Immagine</th>
	</tr>
	<%
		if(articles!=null && articles.size()>0){

			Iterator <?> it = articles.iterator();
			while(it.hasNext()){
				ShopBean bean =(ShopBean)it.next();
		%>
			<tr>
				<td><%=aBean.getId_articolo() %> </td>
				<td><%=aBean.getTitolo() %> </td>				
				<td><%=aBean.getCont() %></td>
				<td><%=aBean.getImmagine() %></td>
				<td>
				<a href="<%=response.encodeURL("Article?action=delete&id="+aBean.getId_articolo())%>">Rimuovi dal database</a>
				<a href="<%=response.encodeURL("Article?action=details&id="+aBean.getId_articolo())%>">dettagli</a>
				</td>
			</tr>
		
		<% }
			
		} else {
		%>
		<tr>
			<td colspan=4>Database vuoto</td>
		</tr>
		<%} %>
	</table>
	<% if(articles!=null &&!articles.isEmpty()) { %>
	
	<h2>DETTAGLI</h2>
	<table>
			<tr>
				<th>ID</th>
				<th>titolo</th>
				<th>contenuto</th>
				<th>Immagine</th>
			</tr>
			<tr>
				<td><%=aBean.getId_articolo() %></td>
				<td><%=aBean.getTitolo()%></td>
				<td><%=aBean.getCont()%></td>
				<td><%=aBean.getImmagine()%></td>
			</tr>
		</table>
			
		<form action="<%=response.encodeURL("Article") %>" method=POST>
		<fieldset>
		<legend><b> Update </b></legend>
		<input type=hidden name=action value=update>
		<input type=hidden name=id_articolo value="<%=aBean.getId_articolo()%>">
		
		<label for=name> Titolo:</label>
		<input name=titolo type=text maxlength=20  placeholder="enter name" required value="<%=aBean.getTitolo()%>"> <br>
		
		<label for=price>Contenuto:</label>
		<input name=cont type="text" maxlength="200" required><%=aBean.getCont() %><br>
			
		<label for=quantity>Immagine:</label>
		<input name=immagine type=file required><%=aBean.getImmagine() %><br>
		
		<input type=submit value=Update> 
		<input type=reset value=Reset>
		</fieldset>
	</form>	
	
	<%} %>
	
	<form action="<%=response.encodeURL("Article?action=insert")%>" enctype="multipart/form-data" method=post>
		<fieldset>
		<legend><b> Insert </b></legend>
		<input type=hidden name=action value=insert>
		
		<label for=nome_oggetto> Nome:</label>
		<input name=nome_oggetto type=text maxlength=20  placeholder="enter name" required> <br>
		
		<label for=prezzo>Prezzo:</label>
		<input name=prezzo type=number min=0 value=0 required><br>
		
			
		<label for=quant>Quantità:</label>
		<input name=quant type=number min=1 value=1 required><br>
		
		<input type=submit value=Insert> 
		<input type=reset value=Reset>
		</fieldset>
	</form>
	
</div>	
</body>
</html>