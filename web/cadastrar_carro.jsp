<%@page import="java.util.List"%>
<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MarcasDAO dao = new MarcasDAO();
    List<Marcas> marcas = dao.buscarMarcas();
%>
<%@include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar novo carro</h1>
        <form method="POST" action="cad_carro.jsp">
            <div>
                <label>Marca:</label>
                <select name="marca">
                    
                    <% for( Marcas marca : marcas ) { %>
                    <option value="<%= marca.getId() %>"><%= marca.getNome() %></option>
                    <% } %>
                    
                </select>
            </div>
            <div>
                <label>Modelo:</label>
                <input type="text" name="modelo" />
            </div>
            <div>
                <label>Portas:</label>
                <input type="text" name="portas" />
            </div>
            <div>
                <label>Motor:</label>
                <input type="text" name="motor" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
