<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Reportes"%>
<%@page import="Clases.Utilidades"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
            <title>Poli-Leasing</title
        </head>
        <body>
        <%  //validar seguridad
            HttpSession sesion = request.getSession();
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");
            if (miusua == null) {
        %> 
        <jsp:forward page="login.jsp"></jsp:forward>
        <%            }

            String Mensaje = "";

            boolean Generar = false;

            if (request.getParameter("Generar") != null) {
                Generar = true;
            }

            //valor como fue llamado el formulario
            String Estrato = "";
            String Estado = "";
            String Barrio = "";
            String dir="";

            if (request.getParameter("Estrato") != null) {
                Estrato = request.getParameter("Estrato");
            }
            if (request.getParameter("Estado") != null) {
                Estado = request.getParameter("Estado");
            }
            if (request.getParameter("Barrio") != null) {
                Barrio = request.getParameter("Barrio");
            }
            if (Generar) {
                
                String sql = "Select * from inmueble ";
                Datos misdatos = new Datos();
                ResultSet rs = misdatos.getResutset(sql);
                dir = Reportes.Reportes(rs, miusua.getIdusuario(),Estado,Estrato,Barrio);
                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + "/Reportes.pdf");
                misdatos.CerrarConexion();
            }
            String Foto = miusua.getFoto();
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
                        &numsp;Bienvenido Administrador@
                        &numsp;<%= miusua.getNombre() + "<br/> &numsp;" + miusua.getApellido()%>
                    </div>
                    <div style="text-align: left; background: linear-gradient(rgb(125,125,125)50%,rgb(53,53,53));width: 110px; height:20px;padding: 5px; margin: 0px 50px 0px 10px;">
                        &numsp;<a href="Infousuario.jsp">Editar cuenta</a>
                    </div>
                </div>
            </div>

            <!-- Menu -->
            <center>
                <div style="background: linear-gradient(rgb(0,0,0)50%,rgb(100,100,240));width:100% ;height:50px;">
                    <%if(miusua.getTipodeusuario().equals("Administrador")){ %>
                    <div id="header" style="width:800px">
                        <ul class="navi">
                            <li><a href="#">Inmuebles</a>
                                <ul>
                                    <li><a href="Inmuebles.jsp">Administrar Inmuebles</a></li>
                                    <li><a href="ReportesInmuebles.jsp">Generar reporte</a></li>
                                </ul>
                            </li>
                            <li><a href="Usuarios.jsp">Usuarios</a></li>
                            <li><a href="Arrendatarios.jsp">Arrendatarios</a>
                            </li>
                            <li><a href="Pagos.jsp">Pagos</a></li>     
                            <li><a href="Propietarios.jsp">Propietarios</a>
                            </li>
                            <li><a href="Multas.jsp">Multas</a></li>
                            <li><a href="#">Ayuda</a>
                                <ul>
                                    <li><a href="javascript:Acerca()">Acerca de...</a></li>
                                    <li><a href="images/GUIA DE USUARIO.pdf">Guia de Usuario</a></li>
                                </ul>
                            </li>
                            <li><a href="login.jsp">Salir</a></li> 
                        </ul>
                    </div>
                    <% }else{ %>
                        <div id="header" style="width:800px">
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
                    <% } %>
                </div>
            </center>
            <center>
                <br/>
                <h1>Reporte de Inmuebles</h1>
                <br/>
                <form name="ReportesInmuebles" action="ReportesInmuebles.jsp">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>Estrato</td>
                                <td><input type="text" id="Estrato" name="Estrato" value="<%=Estrato%>" size="20" /></td>
                            </tr>
                            <tr>
                            <td>Estado*:</td>
                            <td><select name="Estado" id="Estado">
                                    <option value="" <%=(Estado.equals("") ? "selected" : "")%>>Seleccionar estado</option>
                                    <option value="Libre"<%=(Estado.equals("Libre") ? "selected" : "")%>>Libre</option>
                                    <option value="Ocupado"<%=(Estado.equals("Ocupado") ? "selected" : "")%>>Ocupado</option>
                                    <option value="En reparaciones"<%=(Estado.equals("En reparaciones") ? "selected" : "")%>>En reparaciones</option>
                                </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Barrio</td>
                                <td><input type="text" id="Barrio" name="Barrio" value="<%=Barrio%>" size="20" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" value="Generar" name="Generar" id="Generar" /></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </center>           
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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