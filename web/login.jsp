<%@page import="TADSBD.Utils"%>
<%@page import="TADSBD.Usuarios.Usuarios"%>
<%@page import="TADSBD.Usuarios.UsuariosDAO"%>
<%
    String email = request.getParameter("email");
    String senha = Utils.md5(request.getParameter("senha"));
    
    UsuariosDAO dao = new UsuariosDAO();
    Usuarios user = dao.login(email, senha);
  
    if(user != null) {
        session.setAttribute("usuario", user);
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }

%>