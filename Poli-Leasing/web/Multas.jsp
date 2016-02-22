<%-- 
    Document   : ListaUsu
    Created on : 23/07/2013, 10:15:12 PM
    Author     : ADA
--%>
<%@page import="java.util.Date"%>
<%@page import="Clases.Utilidades"%>
<%@page import="Clases.Multas"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Encabezado.jsp"></jsp:include>
        <title>Poli-leasing</title>
        <script>
            $(document).ready(function(){
                
                $("#capa").load('ListaMultas.jsp');
                    
                $("#Nuevo").click(function(){
                    return ValidarTodo();
                });
                $("#Consultar").click(function(){
                    return ValidarMulta();
                });
                $("#Modificar").click(function(){
                    return ValidarTodo();
                });
                $("#Borrar").click(function(){
                    if(ValidarMulta()){
                        $("<div></div>").html("¿Esta seguro de Eliminar el inmueble?").
                            dialog({title:"Confirmación",modal:true,buttons:[
                                {
                                    text:"Si",
                                    click:function(){
                                        $(this).dialog("close");
                                        $.post("BorraMulta", {codigo: $("#Codigo").val()},function(data) {
                                            $("#Codigo").val("");
                                            $("#Valor").val("");
                                            $("#Fecha").val(""); 
                                            $("#Descripcion").val(""); 
                                            $("Mensaje").val(""); 
                                        }); 
                                        
                                    }
                                },
                                {
                                    text:"No",
                                    click:function(){
                                        $(this).dialog("close");
                                    }
                                }
                            ] 
                        });     
                    }
                    return false;
                });
            });
                
            function ValidarTodo(){
                if(ValidarMulta()){
                    if(ValidarValor()){
                        return ValidarDescripcion();
                        
                    }
                }
                return false;
            }
   
            function ValidarMulta(){
                if($("#Codigo").val()== ""){
                    $("<div></div>").html("Debe insertar un codigo de factura").
                        dialog({title:"Error en la entrada de datos",modal:true,buttons:[
                            {
                                text:"Ok",
                                click:function(){
                                    $(this).dialog("close");   
                                }
                            }
                        ]
                    });
                    return false;
                }
                return true;
            }
            
            function ValidarDescripcion(){
                if($("#Descripcion").val()== ""){
                    $("<div></div>").html("Debe insertar una direccion de inmueble").
                        dialog({title:"Error en la entrada de datos",modal:true,buttons:[
                            {
                                text:"Ok",
                                click:function(){
                                    $(this).dialog("close");   
                                }
                            }
                        ]
                    });
                    return false;
                }
                return true;
            }
            
            function ValidarValor(){
                if($("#Valor").val()== ""){
                    $("<div></div>").html("Debe insertar el numero de habitaciones inmueble").
                        dialog({title:"Error en la entrada de datos",modal:true,buttons:[
                            {
                                text:"Ok",
                                click:function(){
                                    $(this).dialog("close");   
                                }
                            }
                        ]
                    });
                    return false;
                }
                return true;
            }
                               
            function soloLetras(e){
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = "0123456789.";
                especiales = [8,37,39,46];

                tecla_especial = false
                for(var i in especiales){
                    if(key == especiales[i]){
                        tecla_especial = true;
                        break;
                    }
                }

                if(letras.indexOf(tecla)==-1 && !tecla_especial){
                    return false;
                }
            }
            
            
        </script>
    </head>
    <body>
        <%  //validar seguridad
            HttpSession sesion = request.getSession();
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");
            if (miusua == null) {
        %> 
        <jsp:forward page="login.jsp"></jsp:forward>
        <%            }
            if (!miusua.getTipodeusuario().equals("Administrador")) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <% }
            Datos misdatos = new Datos();
            //mensajes del sistema
            String Mensaje = "";

            boolean Consultar = false;
            boolean Nuevo = false;
            boolean Modificar = false;
            boolean Limpiar = false;

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

            //valor como fue llamado el formulario
            String Codigo =misdatos.getConseMulta();
            String Fecha = Utilidades.formatDate(new Date());
            String Valor = "";
            String Descripcion = "";

            if (request.getParameter("Codigo") != null) {
                Codigo = request.getParameter("Codigo");
            }
            if (request.getParameter("Fecha") != null) {
                Fecha = request.getParameter("Fecha");
            }
            if (request.getParameter("Valor") != null) {
                Valor = request.getParameter("Valor");
            }
            if (request.getParameter("Descripcion") != null) {
                Descripcion = request.getParameter("Descripcion");
            }
            // si preciona boton consultar
            if (Consultar) {
                if (Codigo == "") {
                    Mensaje = "Debe ingesar el<br/> El codigo de la multa";
                } else {
                    misdatos = new Datos();
                    Multas mimul = misdatos.getMulta(Codigo);
                    if (mimul == null) {
                        Codigo = "";
                        Fecha = "";
                        Valor = "";
                        Descripcion = "";
                        Mensaje = "Multa no existe";
                    } else {
                        Codigo = mimul.getCodigo();
                        Fecha = Utilidades.formatDate(mimul.getFecha());
                        Valor = mimul.getValor();
                        Descripcion = mimul.getDescripcion();
                        Mensaje = "Multa consultado";
                    }
                    misdatos.CerrarConexion();
                }
            }
            
            //boton Limpiar
            if (Limpiar) {
                Codigo = "";
                Fecha = "";
                Valor = "";
                Descripcion = "";
                Mensaje = "";
            }
            //Boton Nuevo
            if (Nuevo) {
                if (Utilidades.stringToInt(Valor) <= 0) {
                    Mensaje = "Debe ingresar un valor mayor que cero";
                } else {
                   
                    misdatos = new Datos();
                    Multas mimul = misdatos.getMulta(Codigo);
                    if (mimul != null) {
                        Mensaje = "Multa ya existe";
                    } else {
                        mimul = new Multas(
                                Codigo,
                                new Date(),
                                Valor,
                                Descripcion);
                        misdatos.NewMulta(mimul);
                        Mensaje = "Multa Ingresada<br/> Exitosamente";
                    }
                    misdatos.CerrarConexion();
                }
            }
            // si Modificar
            if (Modificar) {
                if (Utilidades.stringToInt(Valor) <= 0) {
                    Mensaje = "Debe ingresar un <br/> valor mayor que cero";
                } else {
                    misdatos = new Datos();
                    Multas mimul = misdatos.getMulta(Codigo);
                    if (mimul == null) {
                        Mensaje = "Multa no existe";
                    } else {
                        mimul = new Multas(
                                Codigo,
                                Utilidades.stringToDate(Fecha),
                                Valor,
                                Descripcion);
                        misdatos.UpdateMulta(mimul);
                        Mensaje = "Multa Modificada<br/> Exitosamente";
                    }
                    misdatos.CerrarConexion();
                }
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
                </div>
            </center>
            <br/>
            <center><h1>Multas</h1></center>
            <br/>
            <br/>
            <form name="Multas" id="Multas" action="Multas.jsp" method="POST">
                <table border="0" style="width: 45%; margin-left: auto; margin-right: auto; empty-cells: hide; border-spacing: 10px 10px;">
                    <tbody>
                        <tr>
                            <td>Codigo de la Multa*:</td>
                            <td><input type="text" name="Codigo" id="Codigo" value="<%=Codigo%>" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Fecha:</td>
                            <td><input type="text" name="Fecha" id="Fecha" value="<%=Fecha%>" size="20" disabled="disabled" /></td>
                        </tr>
                        <tr>

                            <td>Valor*:</td>
                            <td><input type="text" name="Valor" id="Valor" value="<%=Valor%>" size="20" onkeypress="return soloLetras(event)"/></td>
                        </tr>
                    <td>Descripcion*:</td>
                    <td>
                        <textarea rows="4" cols="20" name="Descripcion" id="Descripcion"><%=Descripcion%></textarea>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2">* Campos Obligatorios</td>
                        <td><div class="div"><h4><%=Mensaje%></h4></div></td>
                    </tr>
                    <tr>
                        <td colspan="6"><center><div id="capa" style="width: 320px; height: 200px; overflow-x: hidden;"></div></center>
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
            </center>
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
    </body>
</html>