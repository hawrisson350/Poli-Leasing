package Clases;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilidades {

    public static String formatDate(Date fecha) {
        if (fecha == null) {
            fecha = new Date();
        }
        SimpleDateFormat formatodetexto = new SimpleDateFormat("dd-MM-yy HH:mm:SS");
        return formatodetexto.format(fecha);
    }

    public static Date stringToDate(String fecha) {
        SimpleDateFormat formatoDeltexto = new SimpleDateFormat("dd-MM-yy HH:mm:SS");
        Date aux = null;
        try {
            aux = formatoDeltexto.parse(fecha);
        } catch (Exception ex) {
        }
        return aux;
    }

    public static boolean isNumeric(String Cadena) {

        try {
            Integer.parseInt(Cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    public static int stringToInt(String Cadena) {
        int aux = 0;
        try {
            aux = Integer.parseInt(Cadena);
            return aux;
        } catch (NumberFormatException nfe) {
            return aux;
        }
    }

    public static String hideEmail(String hide) {
        String l = hide;
        String u = "";

        for (int i = 0; i < 3; i++) {
            u = u + l.charAt(i) + "";
        }

        for (int i = 3; i < l.length(); i++) {
            if (l.charAt(i) != '@') {
                u = u + "*";
            } else {
                u = u + l.substring(i);
                break;
            }
        }
        return (u);
    }

    public static String getExtensionFile(String filename) {
        if (filename == null || filename.equals("")) {
            return "vacio";
        } else {
            int index = filename.lastIndexOf('.');
            if (index == -1) {
                return "";
            } else {
                return filename.substring(index);
            }
        }
    }
}
