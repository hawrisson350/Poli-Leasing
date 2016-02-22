<%-- 
    Document   : Arrendatarios
    Created on : 27/08/2013, 06:13:06 PM
    Author     : mateo
--%>

<%@page import="Clases.Arrendatarios"%>
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

                    $("#capa").load('ListaArren.jsp');

                    $("#Nuevo").click(function() {
                        return ValidarTodo();
                    });
                    $("#Consultar").click(function() {
                        return ValidarArren();
                    });
                    $("#Modificar").click(function() {
                        return ValidarTodo();
                    });
                    $("#Borrar").click(function() {
                        if (ValidarArren()) {
                            $("<div></div>").html("¿Esta seguro de Eliminar el inmueble?").
                                    dialog({title: "Confirmación", modal: true, buttons: [
                                            {
                                                text: "Si",
                                                click: function() {
                                                    $(this).dialog("close");
                                                    $.post("BorrarArrenda", {Idarrendatario: $("#Idarrendatario").val()}, function(data) {
                                                        $("#Idarrendatario").val("");
                                                        $("#Nombre").val("");
                                                        $("#Apellido").val("");
                                                        $("#Direccion").val("");
                                                        $("#Telfijo").val("");
                                                        $("#Telcel").val("");
                                                        $("#Email").val("");
                                                        $("#Profesion").val("");
                                                        $("Hijos").val("");
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
                    if (ValidarArren()) {
                        if (ValidarNombre()) {
                            if (ValidarApellido()) {
                                if (ValidarDireccion()) {
                                    if (ValidarTelfijo()) {
                                        if (ValidarTelcel()) {
                                            if (ValidarEmail()) {
                                                if (ValidarProfesion()) {
                                                    return ValidarHijos;
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


                function ValidarArren() {
                    if ($("#Idarrendatario").val() == "") {
                        $("<div></div>").html("Debe insertar una identificación del arrendatario").
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

                function ValidarNombre() {
                    if ($("#Nombre").val() == "") {
                        $("<div></div>").html("Debe insertar el nombre del arrendatario").
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

                function ValidarApellido() {
                    if ($("#Apellido").val() == "") {
                        $("<div></div>").html("Debe insertar el apellido del arrendatario").
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
                        $("<div></div>").html("Debe insertar la dirección del arrendatario").
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

                function ValidarTelfijo() {
                    if ($("#Telfijo").val() == "") {
                        $("<div></div>").html("Debe insertar numero de telefono del arrendario").
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

                function ValidarTelcel() {
                    if ($("#Telcel").val() == "null") {
                        $("<div></div>").html("Debe insertar numero del telefono celular del arrendario").
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

                function ValidarEmail() {
                    if ($("#Email").val() == "") {
                        $("<div></div>").html("Debe insertar el inmueble de el arrendatario").
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

                function ValidarProfesion() {
                    if ($("#Profesion").val() == "") {
                        $("<div></div>").html("Debe insertar la profecion del el arrendatario").
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

                function ValidarHijos() {
                    if ($("#Hijos").val() == "") {
                        $("<div></div>").html("Debe insertar el numero de hijos de el arrendatario").
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
                }
            }
            //mensajes del sistema
            String Mensaje = "";

            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Borrar = false;
            boolean Listar = false;
            boolean Modificar = false;
            boolean Limpiar = false;

            if (request.getParameter("Consultar") != null) {
                Consultar = true;
            }
            if (request.getParameter("Nuevo") != null) {
                Nuevo = true;
            }
            if (request.getParameter("Borrar") != null) {
                Borrar = true;
            }
            if (request.getParameter("Listar") != null) {
                Listar = true;
            }
            if (request.getParameter("Modificar") != null) {
                Modificar = true;
            }
            if (request.getParameter("Limpiar") != null) {
                Limpiar = true;
            }

            //valor como fue llamado el formulario
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
            // si preciona boton consultar
            if (Consultar) {
                Datos misdatos = new Datos();
                Arrendatarios miarren = misdatos.getArrendatario(Idarrendatario);
                if (miarren == null) {
                    Mensaje = "arrendatario no existe";
                } else {
                    Idarrendatario = miarren.getIdarrendatario();
                    Nombre = miarren.getNombre();
                    Apellido = miarren.getApellido();
                    Direccion = miarren.getDireccion();
                    Telfijo = miarren.getTelfijo();
                    Telcel = miarren.getTelcel();
                    Email = miarren.getEmail();
                    Profesion = miarren.getProfesion();
                    Hijos = miarren.getHijos();
                    Mensaje = "Arrendatario consultado";
                }
                misdatos.CerrarConexion();
            }

            //boton Limpiar
            if (Limpiar) {
                Idarrendatario = "";
                Nombre = "";
                Apellido = "";
                Direccion = "";
                Telfijo = "";
                Telcel = "";
                Email = "";
                Profesion = "";
                Hijos = "";
                Mensaje = "Limpiado";
            }
            //Boton Nuevo
            if (Nuevo) {

                Datos misDatos = new Datos();
                Arrendatarios miarren = misDatos.getArrendatario(Idarrendatario);
                if (miarren != null) {
                    Mensaje = "Arrendatario ya existe";
                } else {
                    miarren = new Arrendatarios(
                            Idarrendatario,
                            Nombre,
                            Apellido,
                            Direccion,
                            Telfijo,
                            Telcel,
                            Email,
                            Profesion,
                            Hijos);
                    misDatos.NewArrendatario(miarren);
                    Mensaje = "Arrendatario ingresado<br/> Exitosamente";
                }
                misDatos.CerrarConexion();
            }

            // si Modificar
            if (Modificar) {
                Datos misDatos = new Datos();
                Arrendatarios miarren = misDatos.getArrendatario(Idarrendatario);
                if (miarren == null) {
                    Mensaje = "arrendatario no existe";
                } else {
                    miarren = new Arrendatarios(
                            Idarrendatario,
                            Nombre,
                            Apellido,
                            Direccion,
                            Telfijo,
                            Telcel,
                            Email,
                            Profesion,
                            Hijos);
                    misDatos.UpdateArrendatario(miarren);
                    Mensaje = "Arrendatario Modificado<br/> Exitosamente";
                }
                misDatos.CerrarConexion();
            }

            //si listar
            if (Listar) {
        %>
        <jsp:forward page="ListaArren.jsp"></jsp:forward>
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
                                    <li><a href="Propietarios.jsp">Administrar propietarios</a></li>
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
            <center><h1>Arrendatarios</h1></center>
            <br/>
            <form name="arrendatarios" id="arrendatarios" action="Arrendatarios.jsp" method="POST">
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 10px 10px;">
                    <tbody>
                        <tr>
                            <td>Identificacion de arrendatario*:</td>
                            <td><input type="text" name="Idarrendatario" id="Idarrendatario" value="<%=Idarrendatario%>" size="20" /></td>

                            <td>Nombre *:</td>
                            <td><input type="text" name="Nombre" id="Nombre" value="<%=Nombre%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Apellido *:</td>
                            <td><input type="text" name="Apellido" id="Apellido" value="<%=Apellido%>" size="20" /></td>

                            <td>Direccion *:</td>
                            <td><input type="text" name="Direccion" id="Direccion" value="<%=Direccion%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Telefono fijo* :</td>
                            <td><input type="text" name="Telfijo" id="Telfijo" value="<%=Telfijo%>" size="20" onkeypress="return soloNumeros(event)" /></td>

                            <td>Telefono celular *:</td>
                            <td><input type="text" name="Telcel" id="Telcel" value="<%=Telcel%>" size="20" onkeypress="return soloNumeros(event)" /></td>
                        </tr>
                        <tr>
                            <td>Email *:</td>
                            <td><input type="text" name="Email" id="Email" value="<%=Email%>" size="20" /></td>

                            <td>Profesion *:</td>
                            <td>
                                <input type="text" name="Profesion" id="Profesion" value="<%=Profesion%>" size="30"/>
                            </td>
                        <tr>
                            <td>Hijos *:</td>
                            <td><input type="text" name="Hijos" id="Hijos" value="<%=Hijos%>" size="20" onkeypress="return soloNumeros(event)" /></td>
                        </tr>

                        <tr>
                            <td colspan="2">* Campos Obligatorios</td>
                            <td><div class="div"><h4><%=Mensaje%></h4></div></td>
                        </tr>
                        <tr>
                            <td colspan="6"><center><div id="capa" style="width: 700px; height: 200px; overflow-x: hidden;"></div></center>
                    </td>
                    </tr>
                    </tbody>
                </table>
                <br/>
                <br/>

                <center>   
                    <jsp:include page="Botones.jsp"></jsp:include>
                </center>
            </form>
            <br/>
            <br/>
            <center>

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
        </div>
    </body>
</html>
