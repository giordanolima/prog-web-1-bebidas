<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%
// excluir_marca.jsp
int id = Integer.parseInt(request.getParameter("id"));

MarcasDAO dao = new MarcasDAO();
dao.excluirMarca(id);

response.sendRedirect("marcas.jsp");

%>