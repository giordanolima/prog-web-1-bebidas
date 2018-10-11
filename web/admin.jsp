<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TADSBD</title>
    </head>
    <body>
        <h1>TADSBD</h1>
        
        <h2>Painel administrativo</h2>
        <p>
            <strong>Usuário logado: </strong>
            <%= usuario %>
        </p>
        <p>
            <a href="bebidas.jsp">Bebidas</a>
        </p>
        <a href="logout.jsp">Sair</a>
    </body>
</html>
