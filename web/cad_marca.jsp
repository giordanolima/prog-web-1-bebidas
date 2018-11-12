<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%

// Buscando os dados vindo do formulário
String nome = request.getParameter("nome");

// Instanciando um novo objeto da classe Marcas
Marcas marca = new Marcas();
marca.setNome(nome);

// Instanciar um novo objeto de MarcasDAO para executar a consulta
// dentro do Banco de Dados
MarcasDAO dao = new MarcasDAO();
dao.inserirMarca(marca);

response.sendRedirect("marcas.jsp");

%>