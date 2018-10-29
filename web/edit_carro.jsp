<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@page import="TADSBD.Carros.Carros"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    String marca = request.getParameter("marca");
    String modelo = request.getParameter("modelo");
    float motor = Float.parseFloat(request.getParameter("motor"));
    int portas = Integer.parseInt(request.getParameter("portas"));
    
    Carros carro = new Carros();
    carro.setId(id);
    carro.setMarca(marca);
    carro.setModelo(modelo);
    carro.setMotor(motor);
    carro.setPortas(portas);
    
    CarrosDAO dao = new CarrosDAO();
    dao.editarCarro(carro);
    
    response.sendRedirect("carros.jsp");
    

%>