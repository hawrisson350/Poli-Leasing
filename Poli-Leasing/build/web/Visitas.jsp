<%-- 
    Document   : Propietarios
    Created on : 20/05/2014, 08:45:14 PM
    Author     : Hawrisson Avendaño
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Visitas"%>
<%@page import="Clases.LDLCRC"%>
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

                    $("#capa").load('ListaUsu.jsp');

                    $("#Nuevo").click(function() {
                        return ValidarTodo();
                    });
                    $("#Consultar").click(function() {
                        return ValidarUsu();
                    });
                    $("#Modificar").click(function() {
                        return ValidarTodo();
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

                function ValidarSalir(pag) {
                    $("<div></div>").html("¿Antes de Salir Desea Guardar?").
                            dialog({title: "Confirmación", modal: true, buttons: [
                                    {
                                        text: "Si",
                                        click: function() {
                                            var submitBtn = document.getElementById('Guardar');
                                            submitBtn.click();
                                            Guardado();
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
                                            $(this).dialog("close");
                                        }
                                    }
                                ]
                            });
                    return false;
                }
                function Guardado() {
                    $("<div></div>").html("Guardado.").
                            dialog({title: "Confirmación", modal: false, buttons: [
                                    {
                                        text: "Aceptar",
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
            LDLCRC lista = new LDLCRC();
            Datos misdatos = new Datos();
            Visitas RC=lista.getCabeza();
            ResultSet inmu = misdatos.getInmuebles();
            //los botones del CRUD
            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Borrar = false;
            boolean Listar = false;
            boolean Modificar = false;
            boolean Limpiar = false;
            boolean Guardar = false;

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
            String codigo = "";
            String inmueble = "";
            String documento = "";
            String nombre = "";
            String apellido = "";
            String direccion = "";
            String telfijo = "";
            String telcel = "";
            String correo = "";
            String fecha = "";
            String horaini = "";
            String horafin = "";
            String observa = "";
            String Mensaje = "";//El mensaje mostrado despues dee cada operación 

            if (request.getParameter("codigo") != null) {
                codigo = request.getParameter("codigo");
            }
            if (request.getParameter("inmueble") != null) {
                inmueble = request.getParameter("inmueble");
            }
            if (request.getParameter("documento") != null) {
                documento = request.getParameter("documento");
            }
            if (request.getParameter("nombre") != null) {
                nombre = request.getParameter("nombre");
            }
            if (request.getParameter("apellido") != null) {
                apellido = request.getParameter("apellido");
            }
            if (request.getParameter("direccion") != null) {
                direccion = request.getParameter("direccion");
            }
            if (request.getParameter("telfijo") != null) {
                telfijo = request.getParameter("telfijo");
            }
            if (request.getParameter("telcel") != null) {
                telcel = request.getParameter("telcel");
            }
            if (request.getParameter("correo") != null) {
                correo = request.getParameter("correo");
            }
            if (request.getParameter("fecha") != null) {
                fecha = request.getParameter("fecha");
            }
            if (request.getParameter("horaini") != null) {
                horaini = request.getParameter("horaini");
            }
            if (request.getParameter("horafin") != null) {
                horafin = request.getParameter("horafin");
            }
            if (request.getParameter("observa") != null) {
                observa = request.getParameter("observa");
            }

            ////LISTAS////////
            //cargar lista con lo que hay en la base de datos
            if (RC==null||RC.LD == RC) {
                RC = lista.RC();
                misdatos.getVisitas(RC);
                Listar = true;
            }

            if (Consultar) {
                Visitas P;
                P = lista.Buscar(codigo, RC);
                lista.ImprimirLista(RC);
                if (P != null && !P.getEsta().equals("BORRAR")) {
                    codigo = P.getCodigo();
                    inmueble=P.getIdinmueble();
                    documento=P.getDocumento();
                    nombre = P.getNombre();
                    apellido = P.getApellido();
                    direccion = P.getDireccion();
                    telfijo = P.getTelfijo();
                    telcel = P.getTelcel();
                    correo = P.getCorreo();
                    fecha=P.getFecha();
                    horaini=P.getHoraini();
                    horafin=P.getHorafin();
                    observa=P.getObserva();
                    Mensaje="Visita consultada";
                } else {
                    Mensaje = "Visita no existe";
                }
            }
                if (Nuevo) {
                    Visitas N;
                    N = lista.Insertar(
                            codigo,
                            inmueble,
                            documento,
                            nombre,
                            apellido,
                            direccion,
                            telfijo,
                            telcel,
                            correo,
                            fecha,
                            horaini,
                            horafin,
                            observa,
                            RC);
                    lista.ImprimirLista(RC);
                    Mensaje = "Usuario Ingresado<br/> Exitosamente";
                }

                if (Modificar) {
                    Visitas M;
                    M = lista.Buscar(codigo, RC);
                    lista.Modificar(
                            M,
                            inmueble,
                            documento,
                            nombre,
                            apellido,
                            direccion,
                            telfijo,
                            telcel,
                            correo,
                            fecha,
                            horaini,
                            horafin,
                            observa);
                }

                if (Borrar) {
                    if (lista.EliminarLogico(codigo, RC)) {
                        System.out.println("Se elimino exitosamente el registro");
                        lista.ImprimirLista(RC);
                    } else {
                        Mensaje = "No se encontro el dato.";
                    }
                }

                if (Limpiar) {
                    codigo = "";
                    nombre = "";
                    apellido = "";
                    direccion = "";
                    telfijo = "";
                    telcel = "";
                    correo = "";
                }

                String Foto = miusua.getFoto(); //Trae la Foto del usuario
                if (Foto == null) {//valida  si no hay foto
                    Foto = ""; // Asigna a la foto "" si esta vacia
                }
                if (Foto.equals("")) {// valida si esta vacia y le asigna no foto
                    Foto = "nofoto.jpg";
                }

                if (Guardar) {
                 lista.GuardarLDLCRC(lista);
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
            <center><h1>Visitas</h1></center>
            <br/>
            <form name="visitas" id="visitas" action="Visitas.jsp" method="POST">
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 10px 10px;" >
                    <tbody>
                        <tr>
                            <td>Codigo de la visita*: </td>
                            <td><input type="text" name="codigo" value="<%=codigo%>" size="20" /></td>
                            <td>Inmueble*:</td>
                            <td colspan="">
                                <select name="inmueble" id="inmueble">
                                    <option value="">Seleccione un inmueble</option>
                                    <%
                                        while (inmu.next()) {
                                    %>
                                    <option value = "<%= inmu.getString("idinmueble")%> " <%= (inmu.getString("idinmueble").equals(inmueble) ? "selected" : "")%> > <%= inmu.getString("idinmueble")%> </option>
                                    <% }%>
                                </select>
                            </td>
                            <td>Identificación del visitante*: </td>
                            <td><input type="text" name="documento" value="<%=documento%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Nombre*: </td>
                            <td><input type="text" name="nombre" value="<%=nombre%>" size="20" /></td>
                            <td>Apellido*: </td>
                            <td><input type="text" name="apellido" value="<%=apellido%>" size="20" /></td>
                            <td>Dirección*: </td>
                            <td><input type="text" name="direccion" value="<%=direccion%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Teléfono fijo*: </td>
                            <td><input type="text" name="telfijo" value="<%=telfijo%>" size="20" /></td>
                            <td>Telefono Celular*: </td>
                            <td><input type="text" name="telcel" value="<%=telcel%>" size="20" /></td>
                            <td>Correo*: </td>
                            <td><input type="text" name="correo" value="<%=correo%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Fecha*: </td>
                            <td><input type="text" id="datepicker" name="fecha" value="<%=fecha%>" size="20" /></td>
                            <td>Hora de inicio*: </td>
                            <td><input type="text" name="horaini" value="<%=horaini%>" size="20" /></td>
                            <td>Hora de finalización*: </td>
                            <td><input type="text" name="horafin" value="<%=horafin%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Observaciones*:</td>
                            <td><textarea name="observa" id="observa"><%=observa%></textarea></td>
                            <td><div class="div"><h4><%=Mensaje%></h4></div></td>
                        </tr>
                        <tr><td>* Campos Obligatorios</td></tr>
                        <tr>
                    <center>
                        <td colspan="4">

                        </td>
                    </center>
                    </tr>
                    </tbody>
                </table>
                <br/>
                <input type="submit" name="Guardar" value="Guardar" class="boto" id="Guardar" style="">
                <center>   
                    <jsp:include page="Botones.jsp"></jsp:include>
                    </center>

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
