<%@page import="TADSBD.Bebidas.Bebidas"%>
<%@page import="TADSBD.Bebidas.BebidasDAO"%>
<%

// Buscando os dados vindo do formulário
String nome = request.getParameter("nome");
String categoria = request.getParameter("categoria");
float valor = Float.parseFloat(request.getParameter("valor"));

// Instanciando um novo objeto da classe Bebidas
Bebidas bebida = new Bebidas();
bebida.setNome(nome);
bebida.setCategoria(categoria);
bebida.setValor(valor);

// Instanciar um novo objeto de BebidasDAO para executar a consulta
// dentro do Banco de Dados
BebidasDAO dao = new BebidasDAO();
dao.inserirBebida(bebida);

response.sendRedirect("bebidas.jsp");

%>