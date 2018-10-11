<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TADSBD</title>
    </head>
    <body>
        <h1>TADSBD</h1>
        
        <h2>Login</h2>
        <form action="login.jsp" method="POST">
            <div>
                <label for="email">E-mail:</label> 
                <input type="email" name="email" id="email" />
            </div>
            <div>
                <label for="senha">Senha:</label> 
                <input type="password" name="senha" id="senha" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
