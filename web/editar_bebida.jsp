<%@page import="TADSBD.Bebidas.Bebidas"%>
<%@page import="TADSBD.Bebidas.BebidasDAO"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    BebidasDAO dao = new BebidasDAO();
    Bebidas obj = dao.getById(id);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar bebida</h1>
        <form method="POST" action="edit_bebida.jsp">
            <input type="hidden" name="id" value="<%= obj.getId() %>" />
            <div>
                <label>Nome:</label>
                <input type="text" name="nome" value="<%= obj.getNome() %>" />
            </div>
            <div>
                <label>Categoria:</label>
                <input type="text" name="categoria" value="<%= obj.getCategoria() %>" />
            </div>
            <div>
                <label>Valor:</label>
                <input type="text" name="valor" value="<%= obj.getValor() %>" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
