<%@page import="TADSBD.Marcas.Marcas"%>
<%@page import="TADSBD.Marcas.MarcasDAO"%>
<%@page import="TADSBD.Carros.CarrosDAO"%>
<%@page import="TADSBD.Carros.Carros"%>
<%
  
    int id = Integer.parseInt(request.getParameter("id"));
    int marca_id = Integer.parseInt(request.getParameter("marca"));
    String modelo = request.getParameter("modelo");
    float motor = Float.parseFloat(request.getParameter("motor"));
    int portas = Integer.parseInt(request.getParameter("portas"));
    
    MarcasDAO marcas_dao = new MarcasDAO();
    Marcas marca = marcas_dao.getById(marca_id);
    
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