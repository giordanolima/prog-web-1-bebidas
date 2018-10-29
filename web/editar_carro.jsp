<%@page import="TADSBD.Carros.Carros"%>
<%@page import="TADSBD.Carros.CarrosDAO"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    CarrosDAO dao = new CarrosDAO();
    Carros obj = dao.getById(id);

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
        <form method="POST" action="edit_carro.jsp">
            <input type="hidden" name="id" value="<%= obj.getId() %>" />
            <div>
                <label>Marca:</label>
                <input type="text" name="marca" value="<%= obj.getMarca() %>" />
            </div>
            <div>
                <label>Modelo:</label>
                <input type="text" name="modelo" value="<%= obj.getModelo() %>" />
            </div>
            <div>
                <label>Portas:</label>
                <input type="text" name="portas" value="<%= obj.getPortas() %>" />
            </div>
            <div>
                <label>Motor:</label>
                <input type="text" name="motor" value="<%= obj.getMotor() %>" />
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </body>
</html>
