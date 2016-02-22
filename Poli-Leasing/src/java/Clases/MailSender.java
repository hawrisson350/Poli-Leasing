
package Clases;

/**
 * Por seguridad gmail bloquea los correos que se envian desde aplicaciones no seguras
 * antes de enviar un correo por favor desactivar esta opcion en el siguiente link
 * https://www.google.com/settings/security/lesssecureapps
 * @author hawrisson.avendano
 */
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSender {
    public String mail(String correo,String usuario,String clave){
        try{
            String text="<p style="+"font-family:arial;font-size:18px;color:#aeaeae"+">Usted ha pedido desde la aplicación Poli-leasing que le recordemos su contraseña"
                    +"<br><b>Usuario:</b> "+usuario
                    +"<br><b>Contarseña:</b> "+clave
                    +"<br>Por favor no responder a este correo."
                    +"<br>Muchas gracias.</p>";
            
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "hawrisson350@gmail.com");
            props.setProperty("mail.smtp.auth", "true");

            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("yo@yo.com"));
            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(correo));
            message.setSubject("Petición de contraseña - Poli-Leasing");
            message.setText(text, "utf-8", "html");

            // Lo enviamos.
            Transport t = session.getTransport("smtp");
            t.connect("hawrisson350@gmail.com", "shineeb1a4");
            t.sendMessage(message, message.getAllRecipients());

            // Cierre.
            t.close();
            ///Utilidades uti=new Utilidades();
            ///String email=uti.hideEmail(correo);
            return "Se ha enviado el correo por favor verifiquelo e ingrese nuevamente.";
        }
        catch (Exception e){
            e.printStackTrace();
            return "A ocurrido un error en el envio del correo";
        }
    }
}