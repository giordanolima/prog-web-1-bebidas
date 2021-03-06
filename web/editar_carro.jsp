<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="java.util.List"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page import="TADSBD.Carros.Carros"%>
<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@include file="check_login.jsp" %>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    CarrosDAO dao = new CarrosDAO();
    Carros obj = dao.getById(id);
    
    MarcasDAO marcasdao = new MarcasDAO();
    List<Marcas> marcas = marcasdao.buscarMarcas();

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
                <select name="marca">
                    
                    <% for( Marcas marca : marcas ) { %>
                    
                    <option value="<%= marca.getId() %>"
                            <% if(marca.getId() == obj.getMarca().getId()) { %>
                            selected
                            <% } %>
                            >
                        
                        <%= marca.getNome() %>
                    </option>
                    
                    <% } %>
                    
                </select>
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
