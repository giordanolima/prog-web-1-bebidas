<%@page import="TADSBD.Bebidas.Bebidas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TADSBD.Bebidas.BebidasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<%
    BebidasDAO dao = new BebidasDAO();
    ArrayList<Bebidas> lista = dao.buscarBebidas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TADSBD</title>
    </head>
    <body>
        <h1>TADSBD</h1>
        <table border='1'>
            <% for( Bebidas bebida : lista ) { %>
            <tr>
                <td>#<%= bebida.getId() %></td>
                <td><%= bebida.getNome() %></td>
                <td><%= bebida.getCategoria() %></td>
                <td><%= bebida.getValor() %></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>