<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@include file="check_login.jsp" %>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    MarcasDAO dao = new MarcasDAO();
    Marcas obj = dao.getById(id);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar marca</h1>
        <form method="POST" action="edit_marca.jsp">
            <input type="hidden" name="id" value="<%= obj.getId() %>" />
            <div>
                <label>Nome:</label>
                <input type="text" name="nome" value="<%= obj.getNome() %>" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
