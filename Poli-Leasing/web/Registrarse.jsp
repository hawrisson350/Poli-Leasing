<%-- 
    Document   : Usuarios
    Created on : 10/07/2013, 06:59:37 PM
    Author     : ADA
--%>

<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.*"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Import.jsp"%>
        <title>Poli-leasing</title>
        <script>
             var Correo = false;
             var usuario = false;
             
            $(document).ready(function() {
     
            $("#IdUsuario").on('keyup', function(){
                var existe;
                $.post("VeriUsu", {campo:"idusuario", valor:$("#IdUsuario").val()}, function(data) {
                    existe = jQuery.trim(data);
                    if (existe == "no Existe"){
                        $("#vernomusu").removeAttr('class');
                        $("#vernomusu").addClass("light-green accent-1");
                        $("#vernomusu").html("Nombre de usuario disponible");
                        $(this).removeClass("invalid");
                        $(this).addClass("valid");
                        usuario = true;
                    }else{
                        $("#vernomusu").removeAttr('class');
                        $("#vernomusu").html("Nombre de usuario no disponible");
                        $("#vernomusu").addClass("red lighten-4");
                        $(this).addClass("invalid");
                        usuario = false;
                    }
                    if($("#IdUsuario").val() == "" || $("#IdUsuario").length < 1){
                        $("#vernomusu").removeAttr('class');
                        $("#vernomusu").html("");
                    }
                });
                return false;
            });
            
            $("#Registrarse").submit(function() {
                    
                    if ($("#Confirmacion").val() !== $("#Clave").val()) {
                        $('#modal1').openModal();
                        return false;
                    }
                    
                    if (!Correo) {
                        $('#modal2').openModal();
                        return false;
                    }
                    
                    if (!usuario) {
                        $('#modal3').openModal();
                        return false;
                    }
                    
                });
                
            $("#correo").on('keyup', function(){
                var existe;
                $.post("VeriUsu", {campo:"correo", valor:$("#correo").val()}, function(data) {
                    existe = jQuery.trim(data);
                    if (existe == "no Existe"){
                        $("#vernomusuc").removeAttr('class');
                        $("#vernomusuc").addClass("light-green accent-1");
                        $("#vernomusuc").html("Correo disponible");
                        $(this).removeClass("invalid");
                        $(this).addClass("valid");
                        Correo = true;
                    }else{
                        $("#vernomusuc").removeAttr('class');
                        $("#vernomusuc").html("Correo ya se encuentra registrado");
                        $("#vernomusuc").addClass("red lighten-4");
                        $(this).addClass("invalid");
                        Correo = false;
                    }
                    if($("#correo").val() == "" || $("#correo").length < 1){
                        $("#vernomusuc").removeAttr('class');
                        $("#vernomusuc").html("");
                    }
                });
                return false;
            });
            
            $("input[type=text]").keydown(function (e){
                if($(this).val().length > 19 && e.keyCode !== 8 && e.keyCode !== 13 && e.keyCode !== 9){
                    return false;
                }
                return true;
            });
            
            $("input[type=password]").keydown(function (e){
                if($(this).val().length > 19 && e.keyCode !== 8 && e.keyCode !== 13 && e.keyCode !== 9){
                    return false;
                }
                return true;
            });
            
            $("input[type=email]").keydown(function (e){
                if($(this).val().length > 40 && e.keyCode !== 8 && e.keyCode !== 13 && e.keyCode !== 9){
                    return false;
                }
                return true;
            });
            
                $("#Clave").on('keyup', function(){
                    if($(this).val().length >= 1){
                        $("#paswlength").html("Minimo 8 caracteres.");
                        $("#paswlength").addClass("red lighten-4");
                        $(this).addClass("invalid");
                    }
                    if($(this).val().length >= 8){
                        $("#paswlength").html("");
                        $(this).removeClass("invalid");
                        $(this).addClass("valid");
                    }
                }).keyup();
                
                
                $("#Confirmacion").on('keyup', function(){
                    if($(this).val().length === ($("#Clave").val().length) && $(this).val() === ($("#Clave").val()) && ($("#Clave").val()) !== ""){
                        $("#confir").html("");
                        $(this).removeClass("invalid");
                        $(this).addClass("valid");
                    }else{
                        if( $(this).val() !== ($("#Clave").val()) || 8 <= ($("#Clave").val().length) ){
                            $("#confir").html("Clave y confirmación deben ser iguales");
                            $("#confir").addClass("red lighten-4");
                            $(this).addClass("invalid");
                        }
                    }
                }).keyup();
                
                $("#Foto").change(function() {
                    mostrarImagen(this);
                });
            });
            function soloLetras(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = "1234567890";
                especiales = [8, 37, 39, 46];
                tecla_especial = true;
                /// for (var i in especiales) {
                    /// if (key == especiales[i]) {
                       /// tecla_especial = true;
                       /// break;
                    /// }
                /// }

                if (!(letras.indexOf(tecla) == -1) && !tecla_especial) {
                    return false;
                }
            }
 
            function mostrarImagen(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#imgfoto').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            
        </script>
    </head>
    <body>
        <%  Datos misdatos = new Datos();
            //mensajes del sistema
            String Mensaje = "";
            boolean Nuevo = false;
            int a=0;

            if (request.getParameter("Nuevo") != null) {
                Nuevo = true;
            }
            //valor como fue llamado el formulario
            String Clave = "";
            String Confirmacion = "";
            String Perfil = "Invitado";
            String Foto = (String) application.getAttribute("Foto");
            
            String dir = "C:\\Users\\hawrisson.avendano\\Documents\\superArrenda\\Poli-Leasing\\web\\images\\Usuarios\\";

            if (application.getAttribute("Foto") != null) {
                Foto = (String) application.getAttribute("Foto");
            }
        %>
        <%@include file="Includes/header.jsp" %>
    <main>
        <div class="row" style="">
            <div class="col s12 m12 l8 left-align">
                <div class="col s12 m12 l12">
                    <div class="card indigo lighten-5">
                        <div class="row">
                            <h2 class="center-align">Registrese</h2>
                            <form name="Registrarse" id="Registrarse" enctype="multipart/form-data" action="Registrarse" method="POST">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejem: Andres15+" name="IdUsuario" id="IdUsuario" type="text" class="validate flow-text" required>
                                            <label for="idusuario" class="input-field label"><h6>Nombre de usuario * : </h6></label>
                                            <span id="vernomusu"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m12 l6">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: Andres Felipe" type="text" name="Nombres" id="Nombres"   class="validate flow-text" required onkeypress="return soloLetras(event)">
                                            <label for="Nombres" class="input-field label"><h6>Nombres *:</h6></label>
                                        </div>
                                    </div>
                                
                                    <div class="input-field col s12 m12 l6">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: Casas Estrada" type="text" name="Apellidos" id="Apellidos"  class="validate flow-text" required onkeypress="return soloLetras(event)">
                                            <label for="Apellidos" class="input-field label"><h6>Apellidos*:</h6></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: andres98@e-mail.com" type="email" name="correo" id="correo"  class="validate flow-text" required>
                                            <label for="correo" class="input-field label"><h6>Correo*:</h6></label>
                                            <span id="vernomusuc"></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="row">
                                    <div class="input-field col s12">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: y74@Qw9s" type="text" name="Perfil" disabled value="<%=Perfil%>" size="20" class="validate flow-text" required>
                                            <label for="Perfil" class="input-field label"><h6>Perfil*:</h6></label>
                                        </div>
                                    </div>
                                </div> -->
                                <div class="row">
                                    <div class="input-field col s12 m12 l6">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: y74@Qw9s" name="Clave" id="Clave" value="<%=Clave%>" type="password"  class="validate flow-text" required>
                                            <label for="idusuario" class="input-field label"><h6>Clave*:</h6></label>
                                            <span id="paswlength"></span>
                                        </div>
                                    </div>
                                            
                                    <div class="input-field col s12 m12 l6">
                                        <div class="input-field col s12">
                                            <input placeholder="Ejemplo: y74@Qw9s" type="password" name="Confirmacion" id="Confirmacion" value="<%=Clave%>"  class="validate flow-text" required>
                                            <label for="Confirmacion" class="input-field label"><h6>Confirmacion*:</h6></label>
                                            <span id="confir"></span>
                                        </div>
                                    </div>
                                </div>            
                                <div class="row">
                                    <div style="margin: 0px 5%;">
                                        <span>* Campos Obligatorios</span>
                                        <h3><%=Mensaje%></h3>
                                    </div>
                                </div>
                                <center>   
                                    <div class=" col s12 m12 l12" style="margin:10px 0px;">
                                        <button type="submit" value="Nuevo" id="Nuevo" name="Nuevo" class="indigo darken-4">
                                            <a class="waves-effect waves-light btn indigo darken-4"><i class="medium mdi-action-done"></i>Registrar</a>
                                        </button>
                                    </div>
                                </center>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m12 l4">
                <div class="card indigo lighten-5">
                    <div class="card-content">
                        <center>
                            <%  if (Foto == null) {
                                    Foto = "";
                                }

                                if (Foto.equals("")) {
                            %>
                            <img class="responsive-img circle" src="images/nofoto.jpg" id="imgfoto" style="max-width: 350px; max-height:300px; margin: 15px 15px;" alt="Foto a seleccionar">
                            <% } else {%>
                            <img class="responsive-img circle" src="<%=Foto%>" id="imgfoto" style="max-width: 300px; max-height:300px; margin: 15px 15px;" alt="Foto a seleccionar">
                            <% }%>
                        </center>
                        <div class="file-field input-field">
                            <div class="btn indigo darken-4">
                                <i class="medium mdi-action-perm-media"></i>
                                <span>Foto</span>
                                <input type="file" name="Foto" id="Foto" value="<%=Foto%>">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" value="" placeholder="Selecciona tu foto" type="text">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>                    
        </div>
    </main>
    <%@include file="Includes/footer.jsp" %>
    <div id="modal1" class="modal pink lighten-5">
        <div class="modal-content">
            <h4>Error</h4>
            <p>Clave y confirmacion no concuerdan. Por favor verifique sus datos.</p>
        </div>
        <div class="modal-footer pink lighten-5">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
        </div>
    </div>
    
    <div id="modal2" class="modal pink lighten-5">
        <div class="modal-content">
            <h4>Error</h4>
            <p>El correo ingresado ya se encuentra registrado.</p>
        </div>
        <div class="modal-footer pink lighten-5">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
        </div>
    </div>
    
    <div id="modal3" class="modal pink lighten-5">
        <div class="modal-content">
            <h4>Error</h4>
            <p>El nombre de usuario ingresado ya se encuentra registradoooooooooooo.</p>
        </div>
        <div class="modal-footer pink lighten-5">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
        </div>
    </div>
    
</body>
</html>
