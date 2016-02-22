<%-- 
    Document   : index
    Created on : 8/05/2013, 08:49:22 PM
    Author     :    Hawrisson
--%>

<%@page import="Clases.Datos"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Import.jsp"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="Import.jsp"%>
    <title>Poli-leasing</title>
    <script>
        $(document).ready(function () {
            $("#ValidarUsu").submit(function () {
                $.post("ValidarUsu", $("#ValidarUsu").serialize(), function (data) {
                    perfil = jQuery.trim(data);
                    if (perfil == "Administrador")
                        document.location.href = "MenuAdmin.jsp"
                    else if (perfil == "Vendedor")
                        document.location.href = "MenuVende.jsp"
                    else if (perfil == "Arrendatario")
                        document.location.href = "MenuArr.jsp"
                    else if (perfil == "Invitado")
                        document.location.href = "MenuInvi.jsp"
                    else
                        $('#modal1').openModal();
                });
                return false;
            });
        });

        function cl() {
            $("#olvi").fadeOut("slow");
        }

    </script>
    <%
        session.invalidate();
    %>
    <body>        
        <%@include file="Includes/header.jsp"%>
        <main>
            <div class="row">
                <div class="col s12 m12 l8">
                    <div class="col s12 m12 l12">
                        <div class="card indigo lighten-5">
                            <h2 class="center-align">Iniciar sesión</h2>
                            <form name="ValidarUsu" id="ValidarUsu" action="ValidarUsu" method="POST" class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <div class="input-field col s12">
                                            <input placeholder="Identificación" name="idusuario" id="idusuario" type="text" class="validate flow-text" required>
                                            <label for="idusuario" class="input-field label"><h6>Identificación</h6></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <div class="input-field col s12">
                                            <input placeholder="Contraseña" name="clave" id="clave" type="password" size="15" class="validate flow-text" required>
                                            <label for="clave" class="input-field label"><h6>Contraseña</h6></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col s12 m12 l6" style="margin:10px 0px;">
                                        <button type="submit" value="Ingresar" name="Ingresar" id="Ingresar" class="indigo darken-4">
                                            <a class="waves-effect waves-light btn indigo darken-4">Ingresar</a>
                                        </button>
                                    </div>
                                    <div class=" col s12 m12 l6" style="margin:10px 0px;">
                                        <button type="submit" value="Recuperar contraseña" id="cancelar" name="cancelar" class="indigo darken-4">
                                            <a href="login.jsp?accion=Recuperar.jsp" class="waves-effect waves-light btn indigo darken-4">Olvide mi contraseña</a>
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col s12 m12 l12" style="margin:10px 0px;">
                                        <span>O registrate <a href="Registrarse.jsp">aquí</a> es totalmente gratis.</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col s12 m12 l4" id="olvi">
                    <% if (request.getParameter("accion") != null) {
                            String rut = "Includes/" + request.getParameter("accion");
                    %>
                    <div class="card indigo lighten-5" >
                        <a href="#" id="quienclose" onclick="cl()">
                            <i class="material-icons right">close</i>
                        </a>
                        <div class="card-content">
                            <jsp:include page="<%=rut%>"/>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </main>
        <%@include file="Includes/footer.jsp" %>
        
        <div id="modal1" class="modal pink lighten-5">
            <div class="modal-content">
                <h4>Error</h4>
                <p>Usuario o contraseña incorrecto</p>
            </div>
            <div class="modal-footer pink lighten-5">
                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
            </div>
        </div>
        
    </body>
</html>
