<%@page import="TADSBD.Usuarios.Usuarios"%>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>