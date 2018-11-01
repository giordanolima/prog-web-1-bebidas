<%@page import="TADSBD.Utils"%>
<%@page import="TADSBD.Usuarios.UsuariosDAO"%>
<%@page import="TADSBD.Usuarios.Usuarios"%>
<%
    
String nome = request.getParameter("nome");
String email = request.getParameter("email");
String senha = Utils.md5(request.getParameter("senha"));

Usuarios usuario = new Usuarios();
usuario.setNome(nome);
usuario.setEmail(email);
usuario.setSenha(senha);

UsuariosDAO dao = new UsuariosDAO();
dao.inserirUsuario(usuario);

response.sendRedirect("index.jsp");

%>