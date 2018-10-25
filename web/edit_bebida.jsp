<%@page import="TADSBD.Bebidas.BebidasDAO"%>
<%@page import="TADSBD.Bebidas.Bebidas"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String categoria = request.getParameter("categoria");
    float valor = Float.parseFloat(request.getParameter("valor"));
    
    Bebidas bebida = new Bebidas();
    bebida.setId(id);
    bebida.setNome(nome);
    bebida.setCategoria(categoria);
    bebida.setValor(valor);
    
    BebidasDAO dao = new BebidasDAO();
    dao.editarBebida(bebida);
    
    response.sendRedirect("bebidas.jsp");
    

%>