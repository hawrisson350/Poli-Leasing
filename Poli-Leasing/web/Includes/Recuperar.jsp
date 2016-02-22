<%-- 
    Document   : index
    Created on : 8/05/2013, 08:49:22 PM
    Author     :    Hawrisson
--%>

<%@page import="Clases.MailSender"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Datos"%>
<%@include file="Import.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    MailSender ms= new MailSender();
    Datos misdatos = new Datos();

    boolean Enviar = false;

    if (request.getParameter("Enviar") != null) {
        Enviar = true;
    }
    String Correo = "";
    String Mensaje = "";

    if (request.getParameter("Correo") != null) {
        Correo = request.getParameter("Correo");
    }
    if (Enviar) {
        misdatos = new Datos();
        Usuario miusu = misdatos.getUsuarioParametros("correo",Correo);
        if (miusu == null) {
            Mensaje = "Usuario no existe, verifique sus datos.";
        } else {
            Mensaje=ms.mail(miusu.getCorreo(),miusu.getIdusuario(),miusu.getClave());
        }
        misdatos.CerrarConexion();
    }
%>

<div class="row">
    <form name="Recuperar" id="Recuperar" method="POST" class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <div class="input-field col s12">
                    <input placeholder="Correo" name="Correo" value="<%=Correo%>" id="Correo" type="email" size="15" class="validate flow-text" required>
                    <label for="Correo" class="input-field label"><h6>Correo</h6></label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" col s12 m12 l12" style="margin:10px 0px;">
                <button type="submit" value="Enviar" name="Enviar" id="Enviar" class="indigo darken-4">
                    <a class="waves-effect waves-light btn indigo darken-4" onclick="modal()">Enviar</a>
                </button>
            </div>
        </div>
        <div class="row">
            <div class=" col s12 m12 l12" style="margin:10px 0px;">
                <p><%=Mensaje%></p>
            </div>
        </div>
    </form>
</div>
