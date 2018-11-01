<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar nova bebida</h1>
        <form method="POST" action="cad_bebida.jsp">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome" />
            </div>
            <div>
                <label>Categoria:</label>
                <input type="text" name="categoria" />
            </div>
            <div>
                <label>Valor:</label>
                <input type="text" name="valor" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
