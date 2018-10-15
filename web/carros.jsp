<%@page import="TADSBD.Carros.Carros"%>
<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<%
    CarrosDAO dao = new CarrosDAO();
    ArrayList<Carros> lista = dao.buscarCarros();
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
            <% for( Carros carro : lista ) { %>
            <tr>
                <td><%= carro.getMarca() %></td>
                <td><%= carro.getModelo() %></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
