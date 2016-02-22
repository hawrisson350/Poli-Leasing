<%-- 
    Document   : Propietarios
    Created on : 20/05/2014, 08:45:14 PM
    Author     : Hawrisson Avendaño
--%>

<%@page import="Clases.Propietario"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.LSL"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    $("#Modificar").click(function() {
                        return ValidarTodo();
                    });
                });
                function ValidarTodo() {
                    if (ValidarUsu()) {
                        if (ValidarUsuTam()) {
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
                    }
                    return false;
                }


                function ValidarUsu() {
                    if ($("#idpropietario").val() == "") {
                        $("<div></div>").html("Debe insertar una identificación de propietario").
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

                function ValidarUsuTam() {
                    var Text= $("#idpropietario").val();
                    if (Text.length < 6 || Text.length > 13) {
                        $("<div></div>").html("Debe insertar un número identificación valido.").
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
                    if ($("#nombre").val() == "") {
                        $("<div></div>").html("Debe insertar un nombre(s) de propietario").
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
                    if ($("#apellido").val() == "") {
                        $("<div></div>").html("Debe insertar un Apellido(s) de propietario").
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
                    if ($("#email").val() == "") {
                        $("<div></div>").html("Debe insertar un email de propietario").
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
                    if ($("#telfijo").val() == "") {
                        $("<div></div>").html("Debe insertar un telefono fijo de propietario").
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
                    if ($("#telcel").val() == "") {
                        $("<div></div>").html("Debe insertar un telefono celular de propietario").
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
                    $("<div></div>").html("¿Antes de Salir Desea Guardar?").
                            dialog({title: "Confirmación", modal: true, buttons: [
                                    {
                                        text: "Si",
                                        click: function() {
                                            var submitBtn = document.getElementById('Guardar');
                                            submitBtn.click();
                                            Guardado(pag);
                                            $(this).dialog("close");
                                        }
                                    },
                                    {
                                        text: "No",
                                        click: function() {
                                            Salir(pag);
                                            $(this).dialog("close");
                                        }
                                    },
                                    {
                                        text: "Cancelar",
                                        click: function() {
                                            $(this).dialog("close");
                                        }
                                    }
                                ]
                            });
                    return false;
                }
                function Salir(pag) {
                    $("<div></div>").html("Saliendo.").
                            dialog({title: "Confirmación", modal: true, buttons: [
                                    {
                                        text: "Aceptar",
                                        click: function() {
                                            location.href = pag;
                                        }
                                    },
                                    {
                                        text: "Cancelar",
                                        click: function() {
                                            location.href = pag;
                                        }
                                    }
                                ]
                            });
                    return false;
                }
                function Guardado(pag) {
                    $("<div></div>").html("Guardado.").
                            dialog({title: "Confirmación", modal: false, buttons: [
                                    {
                                        text: "Aceptar",
                                        click: function() {
                                            location.href = pag;
                                        }
                                    }
                                ]
                            });
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

                function sololetras(e) {
                    key = e.keyCode || e.which;
                    tecla = String.fromCharCode(key).toLowerCase();
                    letras = "qwertyuiopasdfghjklñzxcvbnm";
                    especiales = [8, 32 , 37, 39, 46];

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
            HttpSession sesion = request.getSession();// trae le sesion
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");//trae el tipo de usuario logueado
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
        } else {// declaracion de las variables a usar
            LSL lista = new LSL();
            Datos misdatos = new Datos();
            Propietario c = lista.getCabeza(), l = null;
            //los botones del CRUD
            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Borrar = false;
            boolean Listar = false;
            boolean Modificar = false;
            boolean Limpiar = false;
            boolean Guardar = false;
            //Guardar el pripietario actual
            Propietario A = null;

            //validar si seleccionaron algun boton del formulario
            //si lo seleccionan la variable toma el valos de true
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
            if (request.getParameter("Guardar") != null) {
                Guardar = true;
            }

            //declaracion de los campos del formulario:
            //idpropietario``nombre``apellido``direccion``telfijo``telcel``e-mail`
            String idpropietario = "";
            String nombre = "";
            String apellido = "";
            String telfijo = "";
            String telcel = "";
            String email = "";
            String Mensaje = "";//El mensaje mostrado despues dee cada operación 

            if (request.getParameter("idpropietario") != null) {
                idpropietario = request.getParameter("idpropietario");
            }
            if (request.getParameter("nombre") != null) {
                nombre = request.getParameter("nombre");
            }
            if (request.getParameter("apellido") != null) {
                apellido = request.getParameter("apellido");
            }
            if (request.getParameter("apellido") != null) {
                apellido = request.getParameter("apellido");
            }
            if (request.getParameter("telfijo") != null) {
                telfijo = request.getParameter("telfijo");
            }
            if (request.getParameter("telcel") != null) {
                telcel = request.getParameter("telcel");
            }
            if (request.getParameter("email") != null) {
                email = request.getParameter("email");
            }

            ////LISTAS////////
            //cargar lista con lo que hay en la base de datos
            if (c == null) {
                c = misdatos.getPropietarios();
                //lista.ImprimirLista(c);
                Listar = true;
            }
            l = c;

            if (request.getParameter("accion") != null) {
                Consultar = true;
                idpropietario = request.getParameter("accion");
            }

            if (Consultar) {
                Propietario P;
                P = lista.Buscar(idpropietario, c);
                //lista.ImprimirLista(c);
                if (P != null && !P.getEsta().equals("BORRAR")) {
                    idpropietario = P.getIdpropietario();
                    nombre = P.getNombre();
                    apellido = P.getApellido();
                    telfijo = P.getTelfijo();
                    telcel = P.getTelcel();
                    email = P.getEmail();
                    A = P;
                } else {
                    Mensaje = "Propietario no existe";
                }
            }

            if (Nuevo) {
                Propietario P;
                P = lista.Buscar(idpropietario, c);
                if (P != null) {
                    Mensaje = "Usuario ya existe";
                } else {
                    l = lista.Insertar(idpropietario,
                            nombre,
                            apellido,
                            telfijo,
                            telcel,
                            email, c);
                    //lista.ImprimirLista(c);
                    Mensaje = "Usuario Ingresado<br/> Exitosamente";

                }
            }

            if (Modificar) {
                Propietario P;
                P = lista.Buscar(idpropietario, c);
                if (P == null) {
                    Mensaje = "No existe propietario con ese documento.";
                } else {
                    lista.Modificar(P,
                            nombre,
                            apellido,
                            telfijo,
                            telcel,
                            email);
                }
            }

            if (Borrar) {
                if (lista.EliminarLogico(idpropietario, c)) {
                    Mensaje = "Se elimino exitosamente el registro";
                    //lista.ImprimirLista(c);
                } else {
                    Mensaje = "No se encontro el dato.";
                }
            }

            if (Limpiar) {
                idpropietario = "";
                nombre = "";
                apellido = "";
                telfijo = "";
                telcel = "";
                email = "";
            }

            String Foto = miusua.getFoto(); //Trae la Foto del usuario
            if (Foto == null) {//valida  si no hay foto
                Foto = ""; // Asigna a la foto "" si esta vacia
            }
            if (Foto.equals("")) {// valida si esta vacia y le asigna no foto
                Foto = "nofoto.jpg";
            }

            if (Guardar) {
                lista.GuardarLSL(lista);
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
                        &numsp;<a href="javascript:ValidarSalir('Infousuario.jsp')">Editar cuenta</a>
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
                                    <li><a href="javascript:ValidarSalir('ReportesInmuebles.jsp')">Generar reporte</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:ValidarSalir('Usuarios.jsp')">Usuarios</a></li>
                            <li><a href="#">Arrendatarios</a>
                                <ul>
                                    <li><a href="javascript:ValidarSalir('Arrendatarios.jsp')">Administrar arrendatarios</a></li>
                                    <li><a href="javascript:ValidarSalir('ContraArrenda.jsp')">Contratos arrendatarios</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:ValidarSalir('Pagos.jsp')">Pagos</a></li>     
                            <li><a href="#">Propietarios</a>
                                <ul>
                                    <li><a href="#">Administrar propietarios</a></li>
                                    <li><a href="#">Contratos propietarios</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:ValidarSalir('Multas.jsp')">Multas</a></li>
                            <li><a href="javascript:ValidarSalir('images/GUIA DE USUARIO.pdf')">Ayuda</a></li>
                            <li><a href="javascript:ValidarSalir('login.jsp')">Salir</a></li> 
                        </ul>
                    </div>
                </div>
            </center>
            <center><h1>Propietarios</h1></center>
            <br/>
            <form name="propietarios" id="propietarios" action="Propietarios.jsp" method="POST">
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 10px 10px;" >
                    <tbody>
                        <tr>
                            <td>Identificación del Propietario*: </td>
                            <td><input type="text" name="idpropietario" id="idpropietario" value="<%=idpropietario%>" size="20" required/></td>
                            <td>Nombre*: </td>
                            <td><input type="text" name="nombre" id="nombre" value="<%=nombre%>" size="20" onkeypress="return sololetras(event)" required/></td>
                        </tr>
                        <tr>
                            <td>Apellido*: </td>
                            <td><input type="text" name="apellido" id="apellido" value="<%=apellido%>" size="20" onkeypress="return sololetras(event)" required/></td>
                            <td>Email*: </td>
                            <td><input type="email" name="email" id="email" value="<%=email%>" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>Teléfono fijo*: </td>
                            <td><input type="text" name="telfijo" id="telfijo" value="<%=telfijo%>" size="20" onkeypress="return soloNumeros(event)"required/></td>
                            <td>Telefono Celular*: </td>
                            <td><input type="text" name="telcel" id="telcel" value="<%=telcel%>" size="20" onkeypress="return soloNumeros(event)" required/></td>
                        </tr>
                        <tr>
                            <td>* Campos Obligatorios</td>
                            <td><div class="div"><h4><%=Mensaje%></h4></div></td>
                        <tr>

                            <td colspan="4">
                                <div style="width: 650px; height: 200px; overflow-x: hidden;">
                                    <center>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Id propietario</th>
                                                    <th>Nombre</th>
                                                    <th>Apelido</th>
                                                    <th>Telefono fijo</th>
                                                    <th>Telefono Celular</th>
                                                    <th>Email</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <%
                                                while (l != null) {
                                                    if (!l.getEsta().equals("BORRAR")) {
                                            %>
                                            <tr>
                                                <td><%= l.getIdpropietario()%></td>
                                                <td><%= l.getNombre()%></td>
                                                <td><%= l.getApellido()%></td>
                                                <td><%= l.getTelfijo()%></td>
                                                <td><%= l.getTelcel()%></td>
                                                <td><%= l.getEmail()%></td>
                                                <td><a href="Propietarios.jsp?accion=<%=l.getIdpropietario()%>">Ver-mas.</a></td>
                                            </tr>
                                            <%          }
                                                    l = l.getLiga();
                                                }
                                            %>
                                        </table>
                                    </center>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br/>

                <center>   
                    <input type="submit" value="Guardar" name="Nuevo" class="boto" id="Nuevo" /> 
                    <input type="submit" value="Borrar" name="Borrar" class="boto" id="Borrar" /> 
                    <input type="submit" value="Modificar" name="Modificar" class="boto" id="Modificar" /> 
                    <input type="submit" value="Limpiar" name="Limpiar"  class="boto"id="Limpiar" /> 
                </center>
                <br/>
                <input type="submit" name="Guardar" value="Guardar todo" class="boto" id="Guardar" style="">
            </form>
            <br/><br/><br/><br/>
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
        <% }
            }%>
    </body>
</html>
