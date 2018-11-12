<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<%
    MarcasDAO dao = new MarcasDAO();
    ArrayList<Marcas> lista = dao.buscarMarcas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TADSBD</title>
    </head>
    <body>
        <h1>TADSBD</h1>
        <a href="cadastrar_marca.jsp">Cadastrar marca</a>
        <table border='1'>
            <% for( Marcas marca : lista ) { %>
            <tr>
                <td>#<%= marca.getId() %></td>
                <td><%= marca.getNome() %></td>
                <td>
                    <a href="editar_marca.jsp?id=<%= marca.getId() %>">Editar</a>
                </td>
                <td>
                    <a href="excluir_marca.jsp?id=<%= marca.getId() %>">Excluir</a>
                </td>
            </tr>
            <% } %>
        </table>
        <p>A página irá atualizar em: <span id="cont">20</span>s.</p>
        <script>
            function checkTime(i) {
                if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
                return i;
            }
            var time = 20;
            window.setInterval(function(){ if(time == 0) window.location.reload(); else { document.getElementById("cont").innerHTML = time;time--; } },1000);
        </script>
    </body>
</html>
