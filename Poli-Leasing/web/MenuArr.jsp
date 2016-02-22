<%-- 
    Document   : MenuArr
    Created on : 27/07/2013, 09:15:17 PM
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
        <script>
            $(document).ready(function() {
                    $("#div").html("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>")
                });
            </script>
    </head>
    <body>  
        <%
            HttpSession sesion = request.getSession();
            Usuario miusu = (Usuario) sesion.getAttribute("usuario");
            if (miusu == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <% }
            String Foto = miusu.getFoto();
            if (Foto == null) {
                Foto = "";
            }
            if (Foto.equals("")) {
                Foto = "nofoto.jpg";
            }
        %>
        <div id="base">  
            <div align="right" style="width:100%; height:110px; background:rgb(0,0,0);"> 
                <img src="images/lol.png"  style="height:100px ; float:left;margin-left:30%;"/>
                <div align="right" style="background:rgb(0,0,0); width:300px; height:100px; /*box-shadow: 0 0 15px white; border:1px solid white;*/">
                    <img src= "<%= "images/" + Foto%>" width="90" height="100" style="float:left"/>
                    <div style="text-align: left; height:50px;padding: 5px;">
                        &numsp;Bienvenido Arrendatari@
                        &numsp;<%= miusu.getNombre() + "<br/> &numsp;" + miusu.getApellido()%>
                    </div>
                    <div style="text-align: left; background: linear-gradient(rgb(125,125,125)50%,rgb(53,53,53));width: 110px; height:20px;padding: 5px; margin: 0px 50px 0px 10px;">
                        &numsp;<a href="Infousuario.jsp">Editar cuenta</a>
                    </div>
                </div>
            </div>

            <!-- Menu -->
            <center>
                <div style="background: linear-gradient(rgb(0,0,0)50%,rgb(100,100,240));width:100% ;height:50px;">
                    <div id="header" style="width:500px">
                        <ul class="navi">
                            <li><a href="#">Inmuebles</a>
                                <ul>
                                    <li><a href="ListaInmu_1.jsp">Administrar Inmuebles</a></li>
                                    <li><a href="ReportesInmuebles.jsp">Generar reporte</a></li>
                                </ul>
                            </li>
                            <li><a href="Pagos.jsp">Pagos</a></li>
                            <li><a href="#">Ayuda</a>
                                <ul>
                                    <li><a href="javascript:Acerca()">Acerca de...</a></li>
                                    <li><a href="images/GUIA DE USUARIO.pdf">Guia de Usuario</a></li>
                                </ul>
                            </li>
                            <li><a href="login.jsp">Salir</a></li> 
                        </ul>
                    </div>
                </div>
            </center>
            <center>
            <div id="div" style="text-align:left;width: 60%;"></div>
            </center>
            <center>
                <div id="footer">
                    <h3>Poli-Leasing
                        <br/>Hawrisson Avendaño
                        <br/>Cristian Machado
                        <br/>Copiright &copy;
                        <br/>Derechos reservados de autor
                    </h3>
                </div>
            </center>
        </div>
    </body>
</html>
