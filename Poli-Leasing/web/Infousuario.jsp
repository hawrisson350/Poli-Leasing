<%-- 
    Document   : Usuarios
    Created on : 10/07/2013, 06:59:37 PM
    Author     : ADA
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
            <title>Poli-leasing</title>
            <script>
                $(document).ready(function() {

                    $("#Error").click(function() {
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
                    });
                    $("#Consultar").click(function() {
                        return ValidarUsu();
                    });
                    $("#Modificar").click(function() {
                        return ValidarTodo();
                    });
                    $("#Borrar").click(function() {
                        if (ValidarUsu()) {
                            $("<div></div>").html("¿Esta seguro de eliminar el Usuario?").
                                    dialog({title: "Confirmación", modal: true, buttons: [
                                            {
                                                text: "Si",
                                                click: function() {
                                                    $(this).dialog("close");
                                                    $.post("BorrarUsu", {idusuario: $("#IdUsuario").val()}, function(data) {
                                                        $("#IdUsuario").val("");
                                                        $("#Nombres").val("");
                                                        $("#Apellidos").val("");
                                                        $("#Confirmacion").val("");
                                                        $("#Clave").val("");
                                                        $("#Perfil").val("");
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
                    if (ValidarUsu()) {
                        if (ValidarNombres()) {
                            if (ValidarApellidos()) {
                                if (ValidarClave()) {
                                    if (ValidarConf()) {
                                        if (ValidarClaveyConf()) {
                                            return ValidarPerfil();
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                }

                function ValidarUsu() {
                    if ($("#IdUsuario").val() == "") {
                        $("<div></div>").html("Debe insertar una identificación de usuario").
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

                function ValidarNombres() {
                    if ($("#Nombres").val() == "") {
                        $("<div></div>").html("Debe insertar un Nombre(s) de usuario").
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
                function ValidarApellidos() {
                    if ($("#Apellidos").val() == "") {
                        $("<div></div>").html("Debe insertar un Apellido(s) de usuario").
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
                function ValidarClave() {
                    if ($("#Clave").val() == "") {
                        $("<div></div>").html("Debe insertar una clave de usuario").
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
                function ValidarConf() {
                    if ($("#Confirmacion").val() == "") {
                        $("<div></div>").html("Debe insertar la confirmación de la clave").
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
                function ValidarClaveyConf() {
                    if ($("#Clave").val() != $("#Confirmacion").val()) {
                        $("<div></div>").html("La clave y su confirmacion no concuerdan").
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
                function ValidarPerfil() {
                    if ($("#Perfil").val() == "null") {
                        $("<div></div>").html("Debe insertar la el perfil de usuario").
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

                function des() {
                    valor.disabled = this.value != '', campo.disabled = this.value != '', Filtrar.disabled = this.value != '';
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
            Datos misdatos = new Datos();
            //mensajes del sistema
            String Mensaje = "";
            boolean Modificar = false;
            boolean Consultar = true;

            if (request.getParameter("Modificar") != null) {
                Modificar = true;
            }

            //valor como fue llamado el formulario
            String IdUsuario = miusua.getIdusuario();
            String Nombres = "";
            String Apellidos = "";
            String Clave = "";
            String Confirmacion = "";
            String Perfil = miusua.getTipodeusuario();
            String Foto = "";

            if (request.getParameter("IdUsuario") != null) {
                IdUsuario = request.getParameter("IdUsuario");
            }
            if (request.getParameter("Nombres") != null) {
                Nombres = request.getParameter("Nombres");
            }
            if (request.getParameter("Apellidos") != null) {
                Apellidos = request.getParameter("Apellidos");
            }
            if (request.getParameter("Clave") != null) {
                Clave = request.getParameter("Clave");
            }
            if (request.getParameter("Confirmacion") != null) {
                Confirmacion = request.getParameter("Confirmacion");
            }
            if (request.getParameter("Perfil") != null) {
                Perfil = request.getParameter("Perfil");
            }
            if (request.getParameter("Foto") != null) {
                Foto = request.getParameter("Foto");
            }

            if (Consultar) {
                misdatos = new Datos();
                Usuario miusu = misdatos.getUsuario(IdUsuario);
                if (miusu == null) {
                    IdUsuario = "";
                    Nombres = "";
                    Apellidos = "";
                    Confirmacion = "";
                    Clave = "";
                    Perfil = "";
                    Foto = "";
                    Mensaje = "usuario no existe";
                } else {
                    IdUsuario = miusu.getIdusuario();
                    Nombres = miusu.getNombre();
                    Apellidos = miusu.getApellido();
                    Confirmacion = miusu.getClave();
                    Clave = miusu.getClave();
                    Perfil = miusu.getTipodeusuario();
                    Foto = miusu.getFoto();
                }
                misdatos.CerrarConexion();
                Consultar = false;
            }

            // si Modificar
            if (Modificar) {
                Datos misDatos = new Datos();
                Usuario miusu = misDatos.getUsuario(IdUsuario);
                if (miusu == null) {
                    Mensaje = "Usuario no existe";
                } else {
                    miusu = new Usuario(
                            IdUsuario,
                            Nombres,
                            Apellidos,
                            Clave,
                            Perfil,
                            Foto);
                    misDatos.UpdateUsuario(miusu);
                    Mensaje = "Usuario Modificado<br/> Exitosamente";
                }
                misDatos.CerrarConexion();
            }

            String Foto1 = miusua.getFoto();
            if (Foto1 == null) {
                Foto1 = "";
            }
            if (Foto1.equals("")) {
                Foto1 = "nofoto.jpg";
            }

        %>
        <div id="base">  
            <div align="right" style="width:100%; height:110px; background:rgb(0,0,0);"> 
                <img src="images/lol.png"  style="height:100px ; float:left;margin-left:30%;"/>
                <div align="right" style="background:rgb(0,0,0); width:300px; height:100px; /*box-shadow: 0 0 15px white; border:1px solid white;*/">
                    <img src= "<%= "images/" + Foto1%>" width="90" height="100" style="float:left"/>
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
                                    <li><a href="javascript:ValidarSalir('Inmuebles.jsp')">Administrar Inmuebles</a></li>
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
                            <li><a href="javascript:ValidarSalir('login.jsp')">Salir</a></li> 
                        </ul>
                    </div>
                </div>
            </center>
            <center>
                <h1>Perfil</h1>
            </center>
            <br/>
            <form name="usuarios" id="usuarios" action="Infousuario.jsp" method="POST">
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 10px 10px;">
                    <tbody>
                        <tr>
                            <td>Identificación de Usuario*:</td>
                            <td><input type="text" name="IdUsuario" id="IdUsuario" value="<%= miusua.getIdusuario()%>" size="20" onkeyup="return des(event)" disabled/></td>

                            <td>Clave*:</td>
                            <td><input type="password" name="Clave" id="Clave" value="<%=Clave%>" size="20" onkeyup="return des(event)" /></td>

                            <td rowspan="3">Foto:</td>
                            <td rowspan="3">
                    <center>
                        <%
                            if (Foto == null) {
                                Foto = "";
                            }
                            if (Foto.equals("")) {
                        %>
                        <img src="images/nofoto.jpg" width="140" height="150" alt="Foto a seleccionar"/>
                        <% } else {%>
                        <img src="<%="images/" + Foto%>" width="140" height="150" alt="Foto a seleccionar"/>
                        <% }%>
                        <input type="file" name="Foto" id="Foto" value="<%=Foto%>" style="width:130px;" />
                    </center>         
                    </td>

                    </tr>  
                    <tr>
                        <td>Nombres*:</td>
                        <td><input type="text" name="Nombres" id="Nombres" value="<%=Nombres%>" size="20" onkeyup="return des(event)"/></td>

                        <td>Confirmacion de clave*:</td>
                        <td><input type="password" name="Confirmacion" id="Confirmacion" value="<%=Clave%>" size="20" onkeyup="return des(event)"/></td>

                    </tr>
                    <tr>
                        <td>Apellidos*:</td>
                        <td><input type="text" name="Apellidos" id="Apellidos" value="<%=Apellidos%>" size="20" onkeyup="return des(event)"/></td>

                        <td>Perfil*:</td>
                        <td><input type="text" name="Apellidos" id="Apellidos" value="<%=miusua.getTipodeusuario()%>" size="20" onkeyup="return des(event)"/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">* Campos Obligatorios</td>
                        <td><div class="div"><h4><%=Mensaje%></h4></div></td> 
                    </tr>
                    </tbody>
                </table>

                <br/>
                <center>   
                    <input type="submit" value="Modificar" name="Modificar" class="boto" id="Modificar" /> 
                </center>
            </form>
            <br/>
            <br/>
            <center>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


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
        <% }%>
    </body>
</html>
