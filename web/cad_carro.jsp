<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@page import="TADSBD.Carros.Carros"%>
<%
    
int marca_id = Integer.parseInt(request.getParameter("marca"));
String modelo = request.getParameter("modelo");
int portas = Integer.parseInt(request.getParameter("portas"));
float motor = Float.parseFloat(request.getParameter("motor"));

MarcasDAO marcas_dao = new MarcasDAO();
Marcas marca = marcas_dao.getById(marca_id);

Carros carro = new Carros();
carro.setMarca(marca);
carro.setModelo(modelo);
carro.setPortas(portas);
carro.setMotor(motor);

CarrosDAO dao = new CarrosDAO();
dao.inserirCarro(carro);

response.sendRedirect("carros.jsp");

%>