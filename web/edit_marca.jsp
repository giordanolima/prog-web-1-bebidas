<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page import="TADSBD.Marcas.Marcas"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    
    Marcas marca = new Marcas();
    marca.setId(id);
    marca.setNome(nome);
    
    MarcasDAO dao = new MarcasDAO();
    dao.editarMarca(marca);
    
    response.sendRedirect("marcas.jsp");
    

%>