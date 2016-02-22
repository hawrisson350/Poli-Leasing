<%-- 
    Document   : ContraArrenda
    Created on : 21/09/2013, 07:25:28 PM
    Author     : ADA
--%>

<%@page import="Clases.Reportes"%>
<%@page import="Clases.DetallePagotmp"%>
<%@page import="Clases.Inmuebles"%>
<%@page import="Clases.Utilidades"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poli-Leasing</title>
        <jsp:include page="Encabezado.jsp"></jsp:include>
            <script>
                $(document).ready(function() {

                    $("#Adicionar").click(function() {
                        return ValidarTodo();
                    });

                });


                function ValidarTodo() {
                    if (ValidarArrendat()) {
                        if (ValidarInmueble()) {
                            if (ValidarAbono()) {
                                if (ValidarReferencia()) {
                                    return ValidarBanco();
                                }
                            }
                        }
                    }
                    return false;
                }

                function ValidarInmueble() {
                    if ($("#inmueble").val() == "") {
                        $("<div></div>").html("Debe insertar un inmueble").
                                dialog({title: "Error en la entrada de datos", modal: true, buttons: [
                                        {
                                            text: "Ok",
                                            click: function() {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                        return false;
                    }
                    return true;
                }

                function ValidarAbono() {
                    if ($("#Abono").val() == "") {
                        $("<div></div>").html("Debe insertar un abono").
                                dialog({title: "Error en la entrada de datos", modal: true, buttons: [
                                        {
                                            text: "Ok",
                                            click: function() {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                        return false;
                    }
                    return true;
                }

                function ValidarArrendat() {
                    if ($("#arrendat").val() == "") {
                        $("<div></div>").html("Debe insertar el Arrendatario").
                                dialog({title: "Error en la entrada de datos", modal: true, buttons: [
                                        {
                                            text: "Ok",
                                            click: function() {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                        return false;
                    }
                    return true;
                }

                function ValidarBanco() {
                    if ($("#banco").val() == "") {
                        $("<div></div>").html("Debe insertar en nombre del banco").
                                dialog({title: "Error en la entrada de datos", modal: true, buttons: [
                                        {
                                            text: "Ok",
                                            click: function() {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                        return false;
                    }
                    return true;
                }

                function ValidarReferencia() {
                    if ($("#referencia").val() == "") {
                        $("<div></div>").html("Debe insertar el numero de referencia").
                                dialog({title: "Error en la entrada de datos", modal: true, buttons: [
                                        {
                                            text: "Ok",
                                            click: function() {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                        return false;
                    }
                    return true;
                }

                function soloLetras(e) {
                    key = e.keyCode || e.which;
                    tecla = String.fromCharCode(key).toLowerCase();
                    letras = "0123456789.";
                    especiales = [8, 37, 39, 46];

                    tecla_especial = false
                    for (var i in especiales) {
                        if (key == especiales[i]) {
                            tecla_especial = true;
                            break;
                        }
                    }

                    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                        return false;
                    }
                }
            </script>
        </head>
        <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");
            if (miusua == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <% }
            //mensajes del sistema
            String Mensaje = "";
            //Coneccion a la base de datos
            Datos misdatos = new Datos();
            ResultSet arren = misdatos.getArrendatarios();
            ResultSet inmu = misdatos.getInmuebles();

            // Validar formulario
            boolean Adicionar = false;
            boolean Grabar = false;

            if (request.getParameter("Adicionar") != null) {
                Adicionar = true;
            }
            if (request.getParameter("Grabar") != null) {
                Grabar = true;
            }

            String inmueble = "";
            String arrendat;
            if (miusua.getTipodeusuario().equals("Arrendatario")) {
                arrendat = miusua.getIdusuario();
            } else {
                arrendat = "";
            }
            String fecha = Utilidades.formatDate(new Date());
            String Descripcion = "";
            String Abono = "";
            String banco = "";
            String referencia = "";

            if (request.getParameter("inmueble") != null) {
                inmueble = request.getParameter("inmueble");
            }
            if (request.getParameter("arrendat") != null) {
                arrendat = request.getParameter("arrendat");
            }
            if (request.getParameter("fecha") != null) {
                fecha = request.getParameter("fecha");
            }
            if (request.getParameter("Descripcion") != null) {
                Descripcion = request.getParameter("Descripcion");
            }
            if (request.getParameter("Abono") != null) {
                Abono = request.getParameter("Abono");
            }
            if (request.getParameter("banco") != null) {
                banco = request.getParameter("banco");
            }
            if (request.getParameter("referencia") != null) {
                referencia = request.getParameter("referencia");
            }

            //adicionar
            if (Adicionar) {
                if (inmueble.equals("")) {
                    Mensaje = "Debe ingresar el inmueble";
                } else if (Abono.equals("")) {
                    Mensaje = "Debe ingresar el abono";
                } else if (!miusua.getTipodeusuario().equals("Arrendatario")) {
                    if (arrendat.equals("")) {
                        Mensaje = "Debe ingresar el Arrendatario";
                    }
                } else if (Utilidades.stringToInt(Abono) <= 0) {
                    Mensaje = "Debe ingresar un<br/>valor mayor a cero";
                } else if (banco == "") {
                    Mensaje = "Debe ingresar el<br/>nombre del banco ";
                } else if (referencia == "") {
                    Mensaje = "Debe ingresar<br/>el numero de referencia";
                } else {

                    //nuevo detalle
                    DetallePagotmp mideta = new DetallePagotmp(
                            new Date(),
                            inmueble,
                            arrendat,
                            misdatos.getPrecio(inmueble),
                            Descripcion,
                            Utilidades.stringToInt(Abono),
                            banco,
                            referencia);
                    //adicionar detalle
                    misdatos.newDetalleFactura(mideta);
                    //inicializar variables
                    inmueble = "";
                    arrendat = "";
                    fecha = Utilidades.formatDate(new Date());
                    Descripcion = "";
                    Abono = "";
                    banco = "";
                    referencia = "";
                    Mensaje = "Ingresado Exitosamente";
                }
            }

            if (Grabar) {
                String sql = "Select * from detallepagotmp where IdActor='" + miusua.getIdusuario() + "' ";
                ResultSet rs = misdatos.getResutset(sql);
                Reportes.ReportesPagos(rs, miusua.getIdusuario());
                misdatos.CerrarConexion();
        %>
        <jsp:forward page="images/Reportes.pdf"></jsp:forward>    
        <%
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
                    <img src= "<%= "images/" + Foto%>" width="100" height="100" style="float:left"/>
                    <div style="text-align: left; height:50px;padding: 5px;">
                        &numsp;Bienvenido Administrador@
                        &numsp;<%= miusua.getNombre() + "<br/> &numsp;" + miusua.getApellido()%>
                    </div>
                    <div style="text-align: left; background: linear-gradient(rgb(125,125,125)50%,rgb(53,53,53));width: 110px; height:20px;padding: 5px; margin: 0px 50px 0px 10px;">
                        &numsp;<a href="Infousuario.jsp">Editar cuenta</a>
                    </div>
                </div>
            </div>
            <div style="background: linear-gradient(rgb(0,0,0)50%,rgb(100,100,240));width:100% ;height:50px;">
                <!-- Menu -->
                <center>
                    <%if (miusua.getTipodeusuario().equals("Administrador")) { %>
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
                    <% } else { %>
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
                    <% }%>
            </div>
        </center>
        <center>
            <h1>Pagos</h1>
            <form name="Pagos" id="Pagos" action="Pagos.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Fecha*:</td>
                            <td><input type="text" name="fecha" id="fecha" value="<%=fecha%>" size="15" disabled="disabled" /></td>
                            <td colspan="3"><div class="div" ><h4><%=Mensaje%></h4></div></td> 
                        </tr>
                        <tr>
                            <td>Arrendatario*:</td>
                            <td colspan="3">
                                <%if (miusua.getTipodeusuario().equals("Arrendatario")) {
                                %>
                                <input type="text" name="arrendat" id="arrendat" value="<%=miusua.getIdusuario()%>" size="20" disabled=disabled />
                                <%
                                } else {
                                %>
                                <select name="arrendat" id="arrendat">
                                    <option value="">Seleccione un Arrendatario</option>
                                    <% while (arren.next()) {%>
                                    <option value="<%= arren.getString("idarrendatario")%>"
                                            <%= (arren.getString("idarrendatario").equals(arrendat) ? "selected" : "")%> >
                                        <%= arren.getString("nombre") + " " + arren.getString("apellido")%> 
                                    </option>
                                    <% }%>
                                </select>
                                <% }%>
                            </td>

                        </tr>
                        <tr>
                            <td>Inmueble*:</td>
                            <td colspan="3">
                                <select name="inmueble" id="inmueble">
                                    <option value="">Seleccione un inmueble</option>
                                    <%
                                        while (inmu.next()) {
                                    %>
                                    <option value = "<%= inmu.getString("idinmueble")%> " <%= (inmu.getString("idinmueble").equals(inmueble) ? "selected" : "")%> > <%= inmu.getString("descripcion")%> </option>
                                    <% }%>
                                    <option value = "" > <%= miusua.getNombre()%> </option>
                                    <option value="2">02659</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Abono*:</td>
                            <td><input type="text" name="Abono" id="Abono" value="" size="20" onkeypress="return soloLetras(event)" /></td>
                        </tr>
                        <tr>
                            <td>Nombre del banco*:</td>
                            <td colspan="3">
                                <select name="banco" id="banco">
                                    <option value="">Seleccione el banco</option>
                                    <option value = "BBVA">BBVA </option>
                                    <option value = "Bancolombia" >Bancolombia</option>
                                    <option value= "Banco de Bogota">Banco de Bogota</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Numero de referencia*:</td>
                            <td colspan="3">
                                <input type="text" name="referencia" id="referencia" value="" size="20" onkeypress="return soloLetras(event)" />
                            </td>
                        </tr>
                        <tr>
                            <td>Descripcion*:</td>
                            <td><textarea name="Descripcion" id="Descripcion"></textarea></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Enviar pago" name="Adicionar" id="Adicionar" /></td>
                            <td><input type="submit" value="Grabar factura" name="Grabar" id="Grabar" /></td>
                        </tr>
                    </tbody>
                </table>

                <table border="1">
                    <thead>
                        <tr><th colspan="7"><center>Pagos realizados</center></th></tr>
                    <tr>
                        <th>Id inmueble</th>
                        <th>Actor</th>
                        <th>Descripción</th>
                        <th>Nombre del banco</th>
                        <th>Numero de refencia</th>
                        <th>Valor</th>
                        <th>Abono</th>
                    </tr>
                    </thead>
                    <tbody>
                        <% if(miusua.getTipodeusuario().equals("")){
                            ResultSet detalle = misdatos.getDetallePagotmp(miusua.getIdusuario());
                            while (detalle.next()) {
                        %>
                        <tr>
                            <td align="right"> <%=detalle.getString("idInmueble")%> </td>
                            <td align="right"><%=detalle.getString("idActor")%></td>
                            <td align="right"><%=detalle.getString("descripcion")%></td>
                            <td align="right"> <%=detalle.getString("nombreBanco")%> </td>
                            <td align="right"><%=detalle.getString("referen")%></td>
                            <td align="right"><%=detalle.getString("precio")%></td>
                            <td align="right"><%=detalle.getString("total")%></td>
                        </tr>
                        <% }}else{
                            ResultSet detalle = misdatos.getDetallePagotmpp();
                            while (detalle.next()) {
                        %>
                        <tr>
                            <td align="right"> <%=detalle.getString("idInmueble")%> </td>
                            <td align="right"><%=detalle.getString("idActor")%></td>
                            <td align="right"><%=detalle.getString("descripcion")%></td>
                            <td align="right"> <%=detalle.getString("nombreBanco")%> </td>
                            <td align="right"><%=detalle.getString("referen")%></td>
                            <td align="right"><%=detalle.getString("precio")%></td>
                            <td align="right"><%=detalle.getString("total")%></td>
                        </tr>
                        <% }} %>
                        <tr>
                            <td colspan="6" align="right">Total abonado</td>
                            <td align="right"><%=misdatos.getTotalSaldo(miusua.getIdusuario())%></td>
                        </tr>
                    </tbody>
                </table>

            </form>
            <% //cierre conexion
                misdatos.CerrarConexion();
            %>
        </center>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

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

    </center>
</div>
</body>
</html>
