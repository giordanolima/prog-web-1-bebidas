<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <input type="text" name="marca" />
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
