<%-- 
    Document   : Usuarios
    Created on : 10/07/2013, 06:59:37 PM
    Author     : ADA
--%>

<%@page import="Clases.LSL"%>
<%@page import="Clases.Propietario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Inmuebles"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
            <title>Poli-leasing</title>
            <style type="text/css">
                #tab tbody tr:hover {
                    background-color: #3D3D3D;
                }
            </style>
            <script>
                $(document).ready(function() {

                    $("#capa").load('ListaInmu.jsp');

                    $("#Nuevo").click(function() {
                        return ValidarTodo();
                    });
                    $("#Consultar").click(function() {
                        return ValidarInmu();
                    });
                    $("#Modificar").click(function() {
                        return ValidarTodo();
                    });
                    $("#Borrar").click(function() {
                        if (ValidarInmu()) {
                            $("<div></div>").html("¿Esta seguro de Eliminar el inmueble?").
                                    dialog({title: "Confirmación", modal: true, buttons: [
                                            {
                                                text: "Si",
                                                click: function() {
                                                    $(this).dialog("close");
                                                    $.post("BorrarInmu", {idinmueble: $("#IdInmueble").val()}, function(data) {
                                                        $("#IdInmueble").val("");
                                                        $("#Direccion").val("");
                                                        $("#Imagen").val("");
                                                        $("#Barrio").val("");
                                                        $("#Nhabitaciones").val("");
                                                        $("#Piso").val("");
                                                        $("#Estado").val("");
                                                        $("#Descripcion").val("");
                                                        $("#Estrato").val("");
                                                        $("#Ciudad").val("");
                                                        $("#Precio").val("");
                                                        $("Mensaje").val("");
                                                    });

                                                }
                                            },
                                            {
                                                text: "No",
                                                click: function() {
                                                    $(this).dialog("close");
                                                }
                                            }
                                        ]
                                    });
                        }
                        return false;
                    });
                });

                function ValidarTodo() {
                    if (ValidarDireccion()) {
                        if (ValidarDescripcion()) {
                            if (ValidarBarrio()) {
                                if (ValidarNhabitaciones()) {
                                    if (ValidarPiso()) {
                                        if (ValidarEstado()) {
                                            return ValidarTodo1();
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                }

                function ValidarTodo1() {
                    if (ValidarEstrato()) {
                        if (ValidarCiudad()) {
                            if (ValidarPrecio()) {
                                if (ValidarBano()) {
                                    if (ValidarEncha()) {
                                        if (ValidarCoci()) {
                                            if (ValidaTipo()) {
                                                if (ValidarArea()) {
                                                    return ValidarGara();
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                }

                function ValidarInmu() {
                    if ($("#IdInmueble").val() == "") {
                        $("<div></div>").html("Debe insertar una identificación de Inmueble").
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

                function ValidarDireccion() {
                    if ($("#Direccion").val() == "") {
                        $("<div></div>").html("Debe insertar una direccion de inmueble").
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

                function ValidarBarrio() {
                    if ($("#Barrio").val() == "") {
                        $("<div></div>").html("Debe el barrio del inmueble").
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

                function ValidarNhabitaciones() {
                    if ($("#Nhabitaciones").val() == "") {
                        $("<div></div>").html("Debe insertar el numero de habitaciones inmueble").
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

                function ValidarPiso() {
                    if ($("#Piso").val() == "") {
                        $("<div></div>").html("Debe insertar el piso del inmueble").
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

                function ValidarEstado() {
                    if ($("#Estado").val() == "null") {
                        $("<div></div>").html("Debe insertar el estado del inmueble").
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

                function ValidarDescripcion() {
                    if ($("#Descripcion").val() == "") {
                        $("<div></div>").html("Debe insertar la descripcion del inmueble").
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

                function ValidarEstrato() {
                    if ($("#Estrato").val() == "null") {
                        $("<div></div>").html("Debe insertar el estrato del inmueble").
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

                function ValidarCiudad() {
                    if ($("#Ciudad").val() == "null") {
                        $("<div></div>").html("Debe insertar la ciudad del inmueble").
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

                function ValidarPrecio() {
                    if ($("#Precio").val() == "null") {
                        $("<div></div>").html("Debe insertar el precio del inmueble").
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

                function ValidarBano() {
                    if ($("#Bano").val() == "null") {
                        $("<div></div>").html("Debe insertar el numero de baños del inmueble").
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

                function ValidarEncha() {
                    if ($("#Enchapado").val() == "null") {
                        $("<div></div>").html("Debe indicar si el inmueble esta enchapado o no").
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

                function ValidarCoci() {
                    if ($("#Cocina").val() == "null") {
                        $("<div></div>").html("Debe insertar la cocina del inmueble").
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

                function ValidaTipo() {
                    if ($("#Tipo").val() == "null") {
                        $("<div></div>").html("Debe insertar el tipo del inmueble").
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

                function ValidarArea() {
                    if ($("#Area").val() == "null") {
                        $("<div></div>").html("Debe insertar el area del inmueble").
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

                function ValidarGara() {
                    if ($("#Garajes").val() == "null") {
                        $("<div></div>").html("Debe insertar la cantidad de garajes del inmueble").
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

                function ValidarInmu1() {
                    location.href = 'Imagenes.jsp';
                    return false;
                }

                function soloNumeros(e) {
                    key = e.keyCode || e.which;
                    tecla = String.fromCharCode(key).toLowerCase();
                    letras = "0123456789";
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

                function ValidarSalir(pag) {
                    $("<div></div>").html("¿Realmente Desea Salir?").
                            dialog({title: "Confirmación", modal: true, buttons: [
                                    {
                                        text: "Si",
                                        click: function() {
                                            location.href = pag;
                                        }
                                    },
                                    {
                                        text: "No",
                                        click: function() {
                                            $(this).dialog("close");
                                        }
                                    }
                                ]
                            });
                    return false;
                }

            </script>
        </head>
        <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");
            if (miusua == null) {
        %>
        <script>
            $(document).ready(function() {
                $("<div></div>").html("Por favor ingrese al sistema.").
                        dialog({title: "Error", modal: true, buttons: [
                                {
                                    text: "Aceptar",
                                    click: function() {
                                        location.href = "login.jsp";
                                    }
                                }
                            ]
                        });
                return false;
            });
        </script>
        <%
        } else {
            if (!miusua.getTipodeusuario().equals("Administrador")) {
        %>
        <script>
            $(document).ready(function() {
                $("<div></div>").html("Por favor ingrese al sistema.").
                        dialog({title: "Error", modal: true, buttons: [
                                {
                                    text: "Aceptar",
                                    click: function() {
                                        location.href = "login.jsp";
                                    }
                                }
                            ]
                        });
                return false;
            });
        </script>
        <%
        } else {
            Datos misdatos = new Datos();
            //mensajes del sistema
            String Mensaje = "";

            List<Inmuebles> LP = misdatos.ListaInmueble();
            LSL lista = new LSL();
            Propietario pro=lista.getCabeza(),c=null;
            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Modificar = false;
            boolean Limpiar = false;
            boolean Filtrar = false;
            /*boolean Imagene = false;
            
             if (request.getParameter("Imagen") != null) {
             Imagene = true;
             }*/

            if (request.getParameter("Consultar") != null) {
                Consultar = true;
            }
            if (request.getParameter("Nuevo") != null) {
                Nuevo = true;
            }
            if (request.getParameter("Modificar") != null) {
                Modificar = true;
            }
            if (request.getParameter("Limpiar") != null) {
                Limpiar = true;
            }
            if (request.getParameter("Filtrar") != null) {
                Filtrar = true;
            }

            //valor como fue llamado el formulario
            String IdInmueble = "";
            String Direccion = "";
            String Imagen = "";
            String Barrio = "";
            String Nhabitaciones = "";
            String Piso = "";
            String Estado = "";
            String Descripcion = "";
            String Estrato = "";
            String Ciudad = "";
            String Precio = "";
            String valor = "";
            String campo = "";
            String Bano = "";
            String Enchapado = "";
            String Cocina = "";
            String Tipo = "";
            String Area = "";
            String Garajes = "";

            if (request.getParameter("IdInmueble") != null) {
                IdInmueble = request.getParameter("IdInmueble");
            }
            if (request.getParameter("Direccion") != null) {
                Direccion = request.getParameter("Direccion");
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
            if (request.getParameter("Descripcion") != null) {
                Descripcion = request.getParameter("Descripcion");
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
            if (request.getParameter("campo") != null) {
                campo = request.getParameter("campo");
            }
            if (request.getParameter("Bano") != null) {
                Bano = request.getParameter("Bano");
            }
            if (request.getParameter("Enchapado") != null) {
                Enchapado = request.getParameter("Enchapado");
            }
            if (request.getParameter("Cocina") != null) {
                Cocina = request.getParameter("Cocina");
            }
            if (request.getParameter("Tipo") != null) {
                Tipo = request.getParameter("Tipo");
            }
            if (request.getParameter("Area") != null) {
                Area = request.getParameter("Area");
            }
            if (request.getParameter("Garajes") != null) {
                Garajes = request.getParameter("Garajes");
            }
            
            if (c == null) {
                c = misdatos.getPropietarios();
            }
            pro = c;

            if (Filtrar) {
                misdatos = new Datos();
                if (campo.equals("") && valor.equals("")) {
                    LP = misdatos.ListaInmueble();
                } else {
                    LP = misdatos.ListaInmuebles(campo, valor);
                }
                misdatos.CerrarConexion();
            }

            // si preciona boton consultar
            if (request.getParameter("accion") != null) {
                Consultar = true;
                IdInmueble = request.getParameter("accion");
            }
            if (Consultar) {
                if (IdInmueble == "") {
                    Mensaje = "Debe ingesar el<br/> Id de Inmueble";
                } else {
                    misdatos = new Datos();
                    Inmuebles miinmu = misdatos.getInmueble(IdInmueble);
                    if (miinmu == null) {
                        IdInmueble = misdatos.getConseInmueble();
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
                        Mensaje = "inmueble no existe";
                        Bano = "";
                        Enchapado = "";
                        Cocina = "";
                        Tipo = "";
                        Area = "";
                        Garajes = "";
                    } else {
                        IdInmueble = miinmu.getIdinmueble();
                        Direccion = miinmu.getDireccion();
                        Imagen = miinmu.getImagen();
                        Barrio = miinmu.getBarrio();
                        Nhabitaciones = miinmu.getNhabitaciones();
                        Piso = miinmu.getPiso();
                        Estado = miinmu.getEstado();
                        Descripcion = miinmu.getDescripcion();
                        Estrato = miinmu.getEstrato();
                        Ciudad = miinmu.getCiudad();
                        Precio = "" + miinmu.getPrecio();
                        Mensaje = "inmueble consultado";
                        Bano = miinmu.getBano();
                        Enchapado = miinmu.getEnchape();
                        Cocina = miinmu.getCocina();
                        Tipo = miinmu.getTipo();
                        Area = miinmu.getArea();
                        Garajes = miinmu.getGaraje();
                    }
                    misdatos.CerrarConexion();
                }
            }
            //boton Limpiar
            if (Limpiar) {
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
                Mensaje = "";
                Bano = "";
                Enchapado = "";
                Cocina = "";
                Tipo = "";
                Area = "";
                Garajes = "";
            }
            //Boton Nuevo
            if (Nuevo) {
                Datos misDatos = new Datos();
                Inmuebles miinmu = misDatos.getInmueble(IdInmueble);
                if (miinmu != null) {
                    Mensaje = "inmueble ya existe";
                } else {
                    miinmu = new Inmuebles(
                            misdatos.getConseInmueble(),
                            Direccion,
                            Imagen,
                            Barrio,
                            Nhabitaciones,
                            Piso,
                            Estado,
                            Descripcion,
                            Estrato,
                            Ciudad,
                            new Integer(Precio),
                            Bano,
                            Enchapado,
                            Cocina,
                            Tipo,
                            Area,
                            Garajes);
                    misDatos.NewInmueble(miinmu);
                    Mensaje = "El inmueble ha sido ingresado";
                }
                misDatos.CerrarConexion();
            }
            // si Modificar
            if (Modificar) {
                Datos misDatos = new Datos();
                Inmuebles miinmu = misDatos.getInmueble(IdInmueble);
                if (miinmu == null) {
                    Mensaje = "Inmueble no existe";
                } else {
                    miinmu = new Inmuebles(
                            miinmu.getIdinmueble(),
                            Direccion,
                            Imagen,
                            Barrio,
                            Nhabitaciones,
                            Piso,
                            Estado,
                            Descripcion,
                            Estrato,
                            Ciudad,
                            new Integer(Precio),
                            Bano,
                            Enchapado,
                            Cocina,
                            Tipo,
                            Area,
                            Garajes);
                    misDatos.UpdateInmueble(miinmu);
                    Mensaje = "Inmueble Modificado<br/> Exitosamente";
                }

                misDatos.CerrarConexion();
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
                    <div id="header" style="width:800px">
                        <ul class="navi">
                            <li><a href="#">Inmuebles</a>
                                <ul>
                                    <li><a href="Inmuebles.jsp">Administrar Inmuebles</a></li>
                                    <li><a href="ReportesInmuebles.jsp">Generar reporte</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:ValidarSalir('Usuarios.jsp')">Usuarios</a></li>
                            <li><a href="#">Arrendatarios</a>
                                <ul>
                                    <li><a href="Arrendatarios.jsp">Administrar arrendatarios</a></li>
                                    <li><a href="ContraArrenda.jsp">Contratos arrendatarios</a></li>
                                </ul>
                            </li>
                            <li><a href="Pagos.jsp">Pagos</a></li>     
                            <li><a href="Propietarios.jsp">Propietarios</a>
                                <ul>
                                    <li><a href="#">Administrar propietarios</a></li>
                                    <li><a href="#">Contratos propietarios</a></li>
                                </ul>
                            </li>
                            <li><a href="Multas.jsp">Multas</a></li>
                            <li><a href="images/GUIA DE USUARIO.pdf">Ayuda</a></li>
                            <li><a href="login.jsp">Salir</a></li> 
                        </ul>
                    </div>
                </div>
            </center>

            <center>
                <h1>Inmuebles</h1>
            </center>
            <br/>
            <form name="inmuebles" id="inmuebles" action="Inmuebles.jsp" method="POST">
                <table border="0" style="margin-left: auto; margin-right: auto; empty-cells: hide; text-align:left;">
                    <tbody>
                        <tr>
                            <td style="width: 50px">Identificación Inmueble*:</td>
                            <td style="width: 50px"><input type="text" name="IdInmueble" id="IdInmueble" value="<%=IdInmueble%>" size="20" disabled="disabled" /></td>

                            <td style="width: 50px">Dirección*:</td>
                            <td style="width: 50px"><input type="text" name="Direccion" id="Direccion" value="<%=Direccion%>" size="25" /></td>

                            <td>Tipo de Inmueble*:</td>
                            <td><select name="Tipo" id="Tipo">
                                    <option value="null" <%=(Tipo.equals("") ? "selected" : "")%>>Seleccionar Tipo</option>
                                    <option value="Casa"<%=(Tipo.equals("Casa") ? "selected" : "")%>>Casa</option>
                                    <option value="Finca"<%=(Tipo.equals("Finca") ? "selected" : "")%>>Finca</option>
                                    <option value="Local"<%=(Tipo.equals("Local") ? "selected" : "")%>>Local</option>
                                    <option value="Apartamento"<%=(Tipo.equals("Apartamento") ? "selected" : "")%>>Apartamento</option>
                                </select>
                            </td> 

                        </tr>
                        <tr>
                            <td>Barrio*:</td>
                            <td><input type="text" name="Barrio" id="Barrio" value="<%=Barrio%>" size="20" /></td>

                            <td>Número de<br/>habitaciones*:</td>
                            <td><input type="text" name="Nhabitaciones" id="Nhabitaciones" value="<%=Nhabitaciones%>" size="20" onkeypress="return soloNumeros(event)" /></td>

                            <td>Baños*:</td>
                            <td><select name="Bano" id="Bano">
                                    <option value="null" <%=(Bano.equals("") ? "selected" : "")%>>Seleccionar Cantidad</option>
                                    <option value="Ninguno"<%=(Bano.equals("Ninguno") ? "selected" : "")%>>Ninguno</option>
                                    <option value="1"<%=(Bano.equals("1") ? "selected" : "")%>>1</option>
                                    <option value="2"<%=(Bano.equals("2") ? "selected" : "")%>>2</option>
                                    <option value="3"<%=(Bano.equals("3") ? "selected" : "")%>>3</option>
                                    <option value="4"<%=(Bano.equals("4") ? "selected" : "")%>>4</option>
                                    <option value="Mas de 5"<%=(Bano.equals("Mas de 5") ? "selected" : "")%>>Mas de 5</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Piso*:</td>
                            <td><input type="text" name="Piso" id="Piso" value="<%=Piso%>" size="20" onkeypress="return soloNumeros(event)" /></td>

                            <td>Estado*:</td>
                            <td><select name="Estado" id="Estado">
                                    <option value="null" <%=(Estado.equals("") ? "selected" : "")%>>Seleccionar estado</option>
                                    <option value="Libre"<%=(Estado.equals("Libre") ? "selected" : "")%>>Libre</option>
                                    <option value="Ocupado"<%=(Estado.equals("Ocupado") ? "selected" : "")%>>Ocupado</option>
                                    <option value="En reparaciones"<%=(Estado.equals("En reparaciones") ? "selected" : "")%>>En reparaciones</option>
                                </select>
                            </td>

                            <td>Ciudad*:</td>
                            <td><select name="Ciudad" id="Ciudad" >
                                    <option value="null" <%=(Ciudad.equals("") ? "selected" : "")%>>Seleccionar Ciudad</option>
                                    <option value="Medellin"<%=(Ciudad.equals("Medellin") ? "selected" : "")%>>Medellin</option>
                                    <option value="Cali"<%=(Ciudad.equals("Cali") ? "selected" : "")%>>Cali</option>
                                    <option value="Bogota"<%=(Ciudad.equals("Bogota") ? "selected" : "")%>>Bogota</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Precio*:</td>
                            <td><input type="text" name="Precio" id="Precio" value="<%=Precio%>" size="20" onkeypress="return soloNumeros(event)" ></td>

                            <td>Propietario*:</td>
                            <td><select name="cocina" id="cocina">
                                    <option value="">Seleccione un Arrendatario</option>
                                    <% while (pro!=null) {%>
                                    <option value="<%= pro.getIdpropietario()%>"
                                            <%= (pro.getIdpropietario().equals(Cocina) ? "selected" : "")%> >
                                        <%= pro.getIdpropietario()%> 
                                    </option>
                                    <% pro=pro.getLiga(); }%>
                                </select>
                            </td>

                            <td>Estrato*:</td>
                            <td><select name="Estrato" id="Estrato">
                                    <option value="null" <%=(Estrato.equals("") ? "selected" : "")%>>Seleccionar Estrato</option>
                                    <option value="1"<%=(Estrato.equals("1") ? "selected" : "")%>>1</option>
                                    <option value="2"<%=(Estrato.equals("2") ? "selected" : "")%>>2</option>
                                    <option value="3"<%=(Estrato.equals("3") ? "selected" : "")%>>3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Garajes*:</td>
                            <td><select name="Garajes" id="Garajes">
                                    <option value="null" <%=(Garajes.equals("") ? "selected" : "")%>>Seleccionar Cantidad</option>
                                    <option value="Ninguno"<%=(Garajes.equals("Ninguno") ? "selected" : "")%>>Ninguno</option>
                                    <option value="1"<%=(Garajes.equals("1") ? "selected" : "")%>>1</option>
                                    <option value="2"<%=(Garajes.equals("2") ? "selected" : "")%>>2</option>
                                    <option value="3"<%=(Garajes.equals("3") ? "selected" : "")%>>3</option>
                                    <option value="4"<%=(Garajes.equals("4") ? "selected" : "")%>>4</option>
                                    <option value="Mas de 5"<%=(Garajes.equals("Mas de 5") ? "selected" : "")%>>Mas de 5</option>
                                </select>
                            </td>    

                            <td>Area*:</td>
                            <td><input type="text" name="Area" id="Area" value="<%=Area%>" size="15" onkeypress="return soloNumeros(event)" /> m<sup>2</sup></td>

                            <td>Enchapado*:</td>
                            <td><select name="Enchapado" id="Enchapado">
                                    <option value="null" <%=(Enchapado.equals("") ? "selected" : "")%>>Seleccionar Respuesta</option>
                                    <option value="Si"<%=(Enchapado.equals("Si") ? "selected" : "")%>>Si</option>
                                    <option value="No"<%=(Enchapado.equals("No") ? "selected" : "")%>>No</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>Descripcion*:</td>
                            <td>
                                <textarea name="Descripcion" id="Descripcion" style="overflow: hidden;" rows="5" cols="20"><%=Descripcion%></textarea>
                            </td>

                            <td rowspan="1">Imagen:</td>
                            <td rowspan="1" style="padding: 0px 0px">
                    <center>
                        <% if (Imagen == null) {
                                Imagen = "";
                            }
                            if (Imagen.equals("")) {
                        %>
                        <img src="images/nocasa.jpg" width="70" height="70" alt="Foto a seleccionar"/>
                        <% } else {%>
                        <img src="<%="images/" + Imagen%>" width="70" height="70" alt="Foto a seleccionar"/>
                        <% }%>
                        <br/>
                        <input type="file" name="Imagen" id="Imagen" value="<%=Imagen%>" style="width:130px;" />
                        <!--<input type="submit" value="Imagen" name="Imagen"  class="boto" id="Imagen" onclick="return ValidarInmu1()" /> --->
                    </center>
                    </td>

                    </tr>
                    <tr>
                        <td colspan="1">* Campos Obligatorios</td>
                        <td colspan="1"><div class="div" style><h4><%=Mensaje%></h4></div></td>
                    </tr>
                    <tr>
                        <td>Buscar:</td>
                        <td colspan="2"><input type="text" name="valor" id="valor" value="" size="40" onClick="cambiarDisplay('po')"/></td>
                        <td colspan="1"> <div class="div"><select name="campo" id="campo">
                                    <option value="">Seleccione campo</option>
                                    <option value="idinmueble">Identificacion inmueble</option>
                                    <option value="direccion">Direccion</option>
                                    <option value="barrio">Barrio</option>
                                    <option value="nhabitaciones">Numero de habitaciones</option>
                                    <option value="piso">Piso</option>
                                    <option value="estado">Estado</option>
                                    <option value="descripcion">Descripcion</option>
                                    <option value="estrato">Estrato</option>
                                    <option value="ciudad">Ciudad</option>
                                    <option value="imagen">Imagen</option>
                                    <option value="precio">Precio</option>
                                    <option value="bano">Baño</option>
                                    <option value="enchape">Enchapado</option>
                                    <option value="cocina">Cocina</option>
                                    <option value="tipo">Tipo</option>
                                    <option value="area">Area</option>
                                    <option value="garaje">Garaje</option>
                                </select></div>
                        </td> 
                        <td>
                            <input type="submit" value="Buscar" name="Filtrar" class="boto" id="Filtrar" />
                        </td>

                    </tr>
                    <tr>
                        <td colspan="6">
                    <center>
                        <div style="width: 720px; height: 200px; overflow-x: hidden;">
                            <%if (LP != null) {%> 
                            <table id="tab" border="5" style="width:660px; border: whitesmoke 5px groove;empty-cells: hide; border-spacing: 0px 0px; ">
                                <thead>
                                    <tr>
                                        <th>Id inmueble</th>
                                        <th>Direccion</th>
                                        <th>Barrio</th>
                                        <th>Estrato</th>
                                        <th>Ciudad</th>
                                        <th>Imagen</th>
                                        <th>Precio</th>
                                        <th>Tipo</th>
                                        <th>Area</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Inmuebles rs : LP) {
                                    %>
                                    <tr  id="po">

                                        <td><a href="Inmuebles.jsp?accion=<%=rs.getIdinmueble()%>"><%=rs.getIdinmueble()%></a></td>
                                        <td><%=rs.getDireccion()%></td>
                                        <td><%=rs.getBarrio()%></td>
                                        <td><%=rs.getEstrato()%></td>
                                        <td><%=rs.getCiudad()%></td>
                                        <td><img src="<%="images/" + rs.getImagen()%>" width="50" height="50" alt="no foto"/></td>
                                        <td><%=rs.getPrecio()%></td>
                                        <td><%=rs.getTipo()%></td>
                                        <td><%=rs.getArea()%>m<sup>2</sup></td>
                                        <td><a href="Inmuebles.jsp?accion=<%=rs.getIdinmueble()%>">Ver mas.</a></td>
                                    </tr>
                                    <% }//misdatos.CerrarConexion();%>
                                </tbody>
                            </table>
                            <%}%>
                        </div>
                    </center>
                    </td>                        
                    </tr>
                    </tbody>
                </table>
                <br/>
                <center>   
                    <input type="submit" value="Nuevo" name="Nuevo" class="boto" id="Nuevo" /> 
                    <input type="submit" value="Borrar" name="Borrar" class="boto" id="Borrar" /> 
                    <input type="submit" value="Modificar" name="Modificar" class="boto" id="Modificar" /> 
                    <input type="submit" value="Limpiar" name="Limpiar"  class="boto"id="Limpiar" /> 
                </center>
            </form>
            <br/>
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
    <% } } %>
</body>
</html>
