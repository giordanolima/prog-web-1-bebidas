<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar nova marca</h1>
        <form method="POST" action="cad_marca.jsp">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
