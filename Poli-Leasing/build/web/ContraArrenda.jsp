<%-- 
    Document   : ContraArrenda
    Created on : 23-oct-2013, 8:15:35
    Author     : USUARIO
--%>

<%@page import="Clases.Reportes"%>
<%@page import="Clases.Inmuebles"%>
<%@page import="Clases.Arrendatarios"%>
<%@page import="Clases.ContraArrenda"%>
<%@page import="java.util.Date"%>
<%@page import="Clases.Utilidades"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
        String arrendat = "";
        String fecha = Utilidades.formatDate(new Date());
        String Descripcion = "";
        String Abono = "";
        String fechaMax = Utilidades.formatDate(new Date());
        String Codigo = misdatos.getConse();

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
        if (request.getParameter("fechaMax") != null) {
            fechaMax = request.getParameter("fechaMax");
        }
        if (request.getParameter("Codigo") != null) {
            Codigo = request.getParameter("Codigo");
        }

        String Idarrendatario = "";
        String Nombre = "";
        String Apellido = "";
        String Direccion = "";
        String Telfijo = "";
        String Telcel = "";
        String Email = "";
        String Profesion = "";
        String Hijos = "";

        if (request.getParameter("Idarrendatario") != null) {
            Idarrendatario = request.getParameter("Idarrendatario");
        }
        if (request.getParameter("Nombre") != null) {
            Nombre = request.getParameter("Nombre");
        }
        if (request.getParameter("Apellido") != null) {
            Apellido = request.getParameter("Apellido");
        }
        if (request.getParameter("Direccion") != null) {
            Direccion = request.getParameter("Direccion");
        }
        if (request.getParameter("Telfijo") != null) {
            Telfijo = request.getParameter("Telfijo");
        }
        if (request.getParameter("Telcel") != null) {
            Telcel = request.getParameter("Telcel");
        }
        if (request.getParameter("Email") != null) {
            Email = request.getParameter("Email");
        }
        if (request.getParameter("Profesion") != null) {
            Profesion = request.getParameter("Profesion");
        }
        if (request.getParameter("Hijos") != null) {
            Hijos = request.getParameter("Hijos");
        }

        //adicionar
        if (Adicionar) {
            if (inmueble.equals("")) {
                Mensaje = "Debe ingresar el inmueble";
            } else if (Abono.equals("")) {
                Mensaje = "Debe ingresar el abono";
            } else if (arrendat.equals("")) {
                Mensaje = "Debe ingresar el Arrendatario";
            } else if (Utilidades.stringToInt(Abono) <= 0) {
                Mensaje = "Debe ingresar un<br/>valor mayor a cero";
            } else {
                //nuevo detalle
                ContraArrenda micona = new ContraArrenda(
                        Codigo,
                        inmueble,
                        arrendat,
                        new Date(),
                        Descripcion,
                        Utilidades.stringToInt(Abono),
                        new Date());
                //adicionar detalle
                misdatos.newContratoArrenda(micona);
                //inicializar variables
                inmueble = "";
                arrendat = "";
                fecha = Utilidades.formatDate(new Date());
                Descripcion = "";
                Abono = "";
                Mensaje = "Ingresado Exitosamente";

            }
        }

        boolean ver = false;

        if (request.getParameter("ver") != null) {
            ver = true;
        }

        if (ver) {
            if (arrendat.equals("")) {
                Mensaje = "Ingrese el arrendatario";
                Idarrendatario = "";
                Nombre = "";
                Apellido = "";
                Direccion = "";
                Telfijo = "";
                Telcel = "";
                Email = "";
                Profesion = "";
                Hijos = "";
            } else {
                misdatos = new Datos();
                Arrendatarios miarren = misdatos.getArrendatario(arrendat);

                Idarrendatario = miarren.getIdarrendatario();
                Nombre = miarren.getNombre();
                Apellido = miarren.getApellido();
                Direccion = miarren.getDireccion();
                Telfijo = miarren.getTelfijo();
                Telcel = miarren.getTelcel();
                Email = miarren.getEmail();
                Profesion = miarren.getProfesion();
                Hijos = miarren.getHijos();
            }
        }
        /////// inmujeblesssssssss
        boolean verI = false;

        if (request.getParameter("verI") != null) {
            verI = true;
        }

        //valor como fue llamado el formulario
        String IdInmueble = "";
        String DireccionI = "";
        String Imagen = "";
        String Barrio = "";
        String Nhabitaciones = "";
        String Piso = "";
        String Estado = "";
        String DescripcionI = "";
        String Estrato = "";
        String Ciudad = "";
        String Precio = "";
        String valor = "";

        if (request.getParameter("IdInmueble") != null) {
            IdInmueble = request.getParameter("IdInmueble");
        }
        if (request.getParameter("DireccionI") != null) {
            DireccionI = request.getParameter("DireccionI");
        }
        if (request.getParameter("Imagen") != null) {
            Imagen = request.getParameter("Imagen");
        }
        if (request.getParameter("Barrio") != null) {
            Barrio = request.getParameter("Barrio");
        }
        if (request.getParameter("Nhabitaciones") != null) {
            Nhabitaciones = request.getParameter("Nhabitaciones");
        }
        if (request.getParameter("Piso") != null) {
            Piso = request.getParameter("Piso");
        }
        if (request.getParameter("Estado") != null) {
            Estado = request.getParameter("Estado");
        }
        if (request.getParameter("DescripcionI") != null) {
            DescripcionI = request.getParameter("DescripcionI");
        }
        if (request.getParameter("Estrato") != null) {
            Estrato = request.getParameter("Estrato");
        }
        if (request.getParameter("Ciudad") != null) {
            Ciudad = request.getParameter("Ciudad");
        }
        if (request.getParameter("Precio") != null) {
            Precio = request.getParameter("Precio");
        }
        if (request.getParameter("valor") != null) {
            valor = request.getParameter("valor");
        }

        // si preciona boton consultar
        if (verI) {
            if (inmueble == "") {
                Mensaje = "Debe ingesar el<br/> Id de Inmueble";
            } else {
                misdatos = new Datos();
                Inmuebles miinmu = misdatos.getInmueble(inmueble);
                if (miinmu == null) {
                    IdInmueble = "";
                    Direccion = "";
                    Imagen = "";
                    Barrio = "";
                    Nhabitaciones = "";
                    Piso = "";
                    Estado = "";
                    Descripcion = "";
                    Estrato = "";
                    Ciudad = "";
                    Precio = "";
                    Mensaje = "Ingrese el arrendatario";
                } else {
                    IdInmueble = miinmu.getIdinmueble();
                    DireccionI = miinmu.getDireccion();
                    Imagen = miinmu.getImagen();
                    Barrio = miinmu.getBarrio();
                    Nhabitaciones = miinmu.getNhabitaciones();
                    Piso = miinmu.getPiso();
                    Estado = miinmu.getEstado();
                    DescripcionI = miinmu.getDescripcion();
                    Estrato = miinmu.getEstrato();
                    Ciudad = miinmu.getCiudad();
                    Precio = "" + miinmu.getPrecio();
                }
                misdatos.CerrarConexion();
            }
        }
        if (Grabar) {
               String sql="SELECT * FROM contraarrenda";
                misdatos = new Datos();
                ResultSet rs = misdatos.getResutset(sql);
                Reportes.ReportesContra(rs,miusua.getIdusuario());
                misdatos.CerrarConexion();
                
            %>
            <jsp:forward page="images/"></jsp:forward>    
            <%
                }
            %>
    %>
    <div class="midiv">
        <center>
            <h1>Contratos</h1>
            <form name="contraarren" id="contraarren" action="ContraArrenda.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Numero de contrato*:</td>
                            <td><input type="text" name="Codigo" id="Codigo" value="<%=Codigo%>" size="20" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td>Fecha*:</td>
                            <td><input type="text" name="fecha" id="fecha" value="<%=fecha%>" size="10" disabled="disabled" /></td>
                            <td colspan="3"><div class="div" ><h4><%=Mensaje%></h4></div></td> 
                        </tr>
                        <tr>
                            <td>Fecha Max*:</td>
                            <td><input type="text" name="fecha" id="fechaMax" value="<%=fechaMax%>" size="10" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td>Arrendatario*:</td>
                            <td colspan="4">
                                <select name="arrendat" id="arrendat">
                                    <option value="">Seleccione un Arrendatario</option>
                                    <% while (arren.next()) {%>
                                    <option value="<%= arren.getString("idarrendatario")%>"
                                            <%= (arren.getString("idarrendatario").equals(arrendat) ? "selected" : "")%> >
                                        <%= arren.getString("nombre") + " " + arren.getString("apellido")%> 
                                    </option>
                                    <% }%>
                                </select>
                                <input type="submit" value="ver" name="ver" id="ver" /> 
                            </td> 
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Arrendatario</legend>
                                    <table border="0" style="padding: 0px;" >
                                        <tr> 
                                            <td  style="padding: 0px;">Identificacion:</td>  <td  style="padding: 0px;"><input type="text" name="Idarrendatario" class="file" id="Idarrendatario" value="<%=Idarrendatario%>" disabled /><br/> </td>
                                            <td  style="padding: 0px;">Apellido:</td>  <td  style="padding: 0px;"><input type="text" name="Apellido" class="file" id="Apellido" value="<%=Apellido%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Dirección:</td> <td  style="padding: 0px;"> <input type="text" class="file" name="Direccion" id="Direccion" value="<%=Direccion%>" disabled /> <br/> </td> 
                                            <td  style="padding: 0px;">Nombre:</td> <td style="padding: 0px;"><input type="text" name="Nombre" class="file" id="Nombre" value="<%=Nombre%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Telefono:</td> <td style="padding: 0px;"><input type="text" name="Telfijo" class="file" id="Telfijo" value="<%=Telfijo%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">Celular:</td> <td style="padding: 0px;"><input type="text" class="file" name="Telcel" id="Telcel" value="<%=Telcel%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Email:</td> <td style="padding: 0px;"><input type="text" name="Email" class="file" id="Email" value="<%=Email%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">Profesión:</td> <td style="padding: 0px;"><input type="text" name="Profesion" class="file" id="Profesion" value="<%=Profesion%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Hijos:</td> <td style="padding: 0px;"><input type="text" class="file" name="Hijos" id="Hijos" value="<%=Hijos%>" disabled /><br/> </td> 
                                    </table>
                                </fieldset>
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
                                <input type="submit" value="ver" name="verI" id="verI" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                                  <!--  String IdInmueble = "";
                                                    String DireccionI = "";
                                                    String Imagen = "";
                                                    String Barrio = "";
                                                    String Nhabitaciones = "";
                                                    String Piso = "";
                                                    String Estado = "";
                                                    String DescripcionI = "";
                                                    String Estrato = "";
                                                    String Ciudad = "";
                                                    String Precio = "";
                                                    String valor = "";-->
                                <fieldset>
                                    <legend>Inmueble</legend>
                                    <table border="0" style="padding: 0px;" >
                                        <tr> 
                                            <td  style="padding: 0px;">Identificacion:</td>  <td  style="padding: 0px;"><input type="text" name="IdInmueble" class="file" id="IdInmueble" value="<%=IdInmueble%>" disabled /><br/> </td>
                                            <td  style="padding: 0px;">DireccionI:</td>  <td  style="padding: 0px;"><input type="text" name="DireccionI" class="file" id="DireccionI" value="<%=DireccionI%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Imagen:</td> <td  style="padding: 0px;"> <input type="text" class="file" name="Imagen" id="Imagen" value="<%=Imagen%>" disabled /> <br/> </td> 
                                            <td  style="padding: 0px;">Barrio:</td> <td style="padding: 0px;"><input type="text" name="Barrio" class="file" id="Barrio" value="<%=Barrio%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Nhabitaciones:</td> <td style="padding: 0px;"><input type="text" name="Nhabitaciones" class="file" id="Nhabitaciones" value="<%=Nhabitaciones%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">Piso:</td> <td style="padding: 0px;"><input type="text" class="file" name="Piso" id="Piso" value="<%=Piso%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Estado:</td> <td style="padding: 0px;"><input type="text" name="Estado" class="file" id="Estado" value="<%=Estado%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">DescripcionI:</td> <td style="padding: 0px;"><input type="text" name="DescripcionI" class="file" id="DescripcionI" value="<%=DescripcionI%>" disabled /><br/> </td> </tr>
                                        <tr> 
                                            <td  style="padding: 0px;">Estrato:</td> <td style="padding: 0px;"><input type="text" class="file" name="Estrato" id="Estrato" value="<%=Estrato%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">Ciudad:</td> <td style="padding: 0px;"><input type="text" class="file" name="Ciudad" id="Ciudad" value="<%=Ciudad%>" disabled /><br/> </td> </tr>
                                         <tr> 
                                            <td  style="padding: 0px;">Precio:</td> <td style="padding: 0px;"><input type="text" class="file" name="Precio" id="Precio" value="<%=Precio%>" disabled /><br/> </td> 
                                            <td  style="padding: 0px;">valor:</td> <td style="padding: 0px;"><input type="text" class="file" name="valor" id="valor" value="<%=valor%>" disabled /><br/> </td> </tr>
                                    </table>
                                </fieldset>
                            </td>

                        </tr>
                        <tr>
                            <td>Valor * mes*:</td>
                            <td><input type="text" name="Abono" id="Abono" value="" size="20" onkeypress="return soloLetras(event)" /></td>
                        </tr>
                        <tr>
                            <td>Descripcion*:</td>
                            <td><textarea name="Descripcion" id="Descripcion"></textarea></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Generar" name="Adicionar" id="Adicionar" /></td>
                            <td><input type="submit" value="Imprimir" name="Grabar" id="Grabar" /></td>
                        </tr>
                    </tbody>
                </table>
              <center>
                    <div class="div">
                        <a href="javascript:history.back(1)"><img src="images/atras.png" width="70" height="50" style="float:left">Regresar a la pagina anterior</a>
                    </div>
                    <br/>
                <%
                    Usuario miusu = (Usuario) sesion.getAttribute("usuario");
                    if (miusu.getTipodeusuario().equals("Administrador")) {
                %>
                <div class="div">
                    <a href="MenuAdmin.jsp"><img src="images/casa-icon.png" width="70" height="50" style="float:left">Regresar al Menu Principal</a>
                </div>
                <% } else if (miusu.getTipodeusuario().equals("Vendedor")) {%>
                <div class="div">
                    <a href="MenuVende.jsp"><img src="images/casa-icon.png" width="70" height="50" style="float:left">Regresar al Menu Principal</a>
                </div>
                <% }%>
                <br/>
            </center> 
                <% //cierre conexion
                    misdatos.CerrarConexion();
                %>
            </html>
                
                
                
