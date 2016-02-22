<%-- 
    Document   : MenuAdmin
    Created on : 8/05/2013, 10:31:00 PM
    Author     : ADA
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
        <jsp:include page="Jspslider.jsp"></jsp:include> 
            <title>Poli-Leasing</title>
        </head>
        <body>  
        <%
            HttpSession sesion = request.getSession();
            Usuario miusu = (Usuario) sesion.getAttribute("usuario");
            if (miusu == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%            }
            String Foto = miusu.getFoto();
            if (Foto == null) {
                Foto = "";
            }
            if (Foto == "") {
                Foto = "nofoto.jpg";
            }
        %>
        <div id="base">
            <a href="Infousuario.jsp"><div align="right" style="width:100%; height:101px; background: linear-gradient(rgb(125,125,125)50%,rgb(125,125,125));"> 
                <img src="images/poli.png"  style="float:left;margin-left:30%;"/>
                <div align="right" style="background: linear-gradient(rgb(125,125,125)50%,rgb(125,125,125)); width:350px; height:100px; /*box-shadow: 0 0 15px white; border:1px solid white;*/">
                    <img src= "<%= "images/" + Foto%>" width="100" height="100" style="float:left"/>
                    <br/>
                    <br/>
                    <div style="text-align: left">
                        &numsp;Bienvenido Vendedor@ 
                        <br/>
                        &numsp;<%= miusu.getNombre() + " " + miusu.getApellido()%>
                    </div>
                </div>
            </div>
            </a>
            <div style="background: linear-gradient(rgb(125,125,125)50%,rgb(53,53,53));width:99.9% ;height:50px;">
                <div id="header">
                    <ul class="navi">
                        <li><a href="Inmuebles.jsp">Inmuebles</a></li>
                        <li><a href="Arrendatarios.jsp">Arrendatarios</a></li>
                        <li><a href="#">Pagos</a></li>     
                        <li><a href="#">Contratos</a></li>
                        <li><a href="#">Propietarios</a></li>
                        <li><a href="login.jsp">Salir</a></li> 
                    </ul>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <!--Inicio de slider-->

            <br/>
            <br/>
            <br/>  
            <center>
                <h3>
                    <br/>Hawrisson Avendaño
                    <br/>Cristian Machado
                    <br/>Luis Adrian Giraldo
                    <br/>Mateo Pulgarin
                    <br/>Copiright &copy;
                    <br/>Derechos reservados de autor
                </h3>
            </center>
            <br/><br/><br/><br/><br/><br/>

        </div>
    </body>
</html>
