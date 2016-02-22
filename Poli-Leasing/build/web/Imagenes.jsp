<%-- 
    Document   : Usuarios
    Created on : 10/07/2013, 06:59:37 PM
    Author     : ADA
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Imagen"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Inmuebles"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
            <title>Poli-leasing</title>
            <script>

                $(document).ready(function() {
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
                    ValidarInmu();
                    
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
        <jsp:forward page="login.jsp"></jsp:forward>
        <%            }
            if (!miusua.getTipodeusuario().equals("Administrador")) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%  }
            Datos misdatos = new Datos();
            //mensajes del sistema
            String Mensaje = "";
            ResultSet inmu = misdatos.getInmuebles();
            
            List<Inmuebles> LP = misdatos.ListaInmueble();
            boolean Filtrar = false;
            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Modificar = false;
            boolean Limpiar = false;
            boolean Imagene = true;

            if (request.getParameter("Imagen") != null) {
                Imagene = true;
            }

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
            String Imagen = "";
            

            if (request.getParameter("IdInmueble") != null) {
                IdInmueble = request.getParameter("IdInmueble");
            }
            if (request.getParameter("Imagen") != null) {
                Imagen = request.getParameter("Imagen");
            }
            

            // si preciona boton consultar
            if (Consultar) {
                
                    misdatos = new Datos();
                    Imagen miima = misdatos.getImagen(IdInmueble);
                    if (miima == null) {
                        IdInmueble = "";
                        Imagen = "";
                        
                    } else {
                        IdInmueble = miima.getInmueble();
                        Imagen = miima.getImagen();
                        
                    }
                    misdatos.CerrarConexion();
                
            }
            //boton Limpiar
            if (Limpiar) {
                IdInmueble = "";
                Imagen = "";

            }
            //Boton Nuevo
            if (Nuevo) {
                misdatos = new Datos();
                    Imagen miima = misdatos.getImagen(IdInmueble);
                    if (miima != null) {
                    Mensaje = "inmueble ya existe";
                } else {
                    miima = new Imagen(
                            IdInmueble,
                            Imagen);
                    misdatos.NewImagen(miima);
                    Mensaje = "El inmueble ha sido ingresado";
                    }
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
                            <li><a href="#">Propietarios</a>
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
            <form name="Imagenes" id="Imagenes" action="Imagenes.jsp" method="POST">
                <%if (Imagene) {%>
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 6px 6px;">
                    <tbody>
                        <tr> 
                            <td>

                                <select name="IdInmueble" id="IdInmueble">
                                        <option value="">Seleccione un inmueble</option>
                                        <%
                                            while (inmu.next()) {
                                        %>
                                        <option value = "<%= inmu.getString("idinmueble")%> " <%= (inmu.getString("idinmueble").equals(IdInmueble) ? "selected" : "")%> > <%= inmu.getString("descripcion")%> </option>
                                        <% }%>
                                        <option value = "" > <%= miusua.getNombre()%> </option>
                                        <option value="2">02659</option>
                                    </select>
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
                        <input type="file" name="Imagen" id="Imagen" value="<%=Imagen%>" />
                        
                                </center>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br/>
                <%Imagene=false;
                }%>
                <center>   
                    <jsp:include page="Botones.jsp"></jsp:include>
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
</body>
</html>
