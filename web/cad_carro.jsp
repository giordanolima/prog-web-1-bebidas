<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@page import="TADSBD.Carros.Carros"%>
<%
    
String marca = request.getParameter("marca");
String modelo = request.getParameter("modelo");
int portas = Integer.parseInt(request.getParameter("portas"));
float motor = Float.parseFloat(request.getParameter("motor"));

Carros carro = new Carros();
carro.setMarca(marca);
carro.setModelo(modelo);
carro.setPortas(portas);
carro.setMotor(motor);

CarrosDAO dao = new CarrosDAO();
dao.inserirCarro(carro);

response.sendRedirect("carros.jsp");

%>