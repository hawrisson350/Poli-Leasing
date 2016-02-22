package Clases;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Reportes {

    public static String Reportes(ResultSet rs, String usu, String estado, String estrato, String barrio) {
        int i;
        Document documento = new Document();
        try {
            String archivo = "C:\\Users\\pc\\Desktop\\ArrendamientosContratos\\Reportes.pdf";
            File fichero = new File(archivo);
            if (!fichero.exists()) {
                PdfWriter.getInstance(documento, new FileOutputStream(archivo));
            } else {
                for(i=0;i<100;i++){
                    archivo = "C:\\Users\\pc\\Desktop\\ArrendamientosContratos\\Reportes"+i+".pdf";
                    File fich = new File(archivo);
                     if (!fich.exists()) {
                        PdfWriter.getInstance(documento, new FileOutputStream(archivo));
                        i=10;
                     }
                }
            }
            documento.open();
            //titulo
            String texto = " ----Reporte Inmuebles----";
            Paragraph parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n";
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            //leer registro
            boolean hayregistros = rs.next();
            PdfPTable table;
            int con = 1;
            int ocu = 0;
            int rep = 0;
            //ciclo de recorrido
            if (!estado.equals("")) {
                while (hayregistros) {
                    if (estado == rs.getString("estado")) {
                        texto = "Inmueble Numero: " + con;
                        parrafo = new Paragraph(texto);
                        documento.add(parrafo);

                        table = new PdfPTable(2);

                        table.addCell("idinmueble");
                        table.addCell(rs.getString("idinmueble"));
                        table.addCell("direccion");
                        table.addCell(rs.getString("direccion"));
                        table.addCell("barrio");
                        table.addCell(rs.getString("barrio"));
                        table.addCell("nhabitaciones");
                        table.addCell(rs.getString("nhabitaciones"));
                        table.addCell("piso");
                        table.addCell(rs.getString("piso"));
                        table.addCell("estado");
                        table.addCell(rs.getString("estado"));
                        table.addCell("descripcion");
                        table.addCell(rs.getString("descripcion"));
                        table.addCell("estrato");
                        table.addCell(rs.getString("estrato"));
                        table.addCell("ciudad");
                        table.addCell(rs.getString("ciudad"));
                        table.addCell("precio");
                        table.addCell("" + rs.getInt("precio"));
                        texto = "\n";
                        parrafo = new Paragraph(texto);
                        documento.add(parrafo);

                        parrafo = new Paragraph();
                        parrafo.add(table);
                        documento.add(parrafo);
                    }
                    con++;
                    if (rs.getString("estado").equals("Ocupado")) {
                        ocu = ocu + 1;
                    }
                    if (rs.getString("estado").equals("En reparaciones")) {
                        rep = rep + 1;
                    }
                    hayregistros = rs.next();
                }
            } else {
                while (hayregistros) {
                    texto = "Inmueble Numero: " + con;
                    parrafo = new Paragraph(texto);
                    documento.add(parrafo);

                    table = new PdfPTable(2);

                    table.addCell("idinmueble");
                    table.addCell(rs.getString("idinmueble"));
                    table.addCell("direccion");
                    table.addCell(rs.getString("direccion"));
                    table.addCell("barrio");
                    table.addCell(rs.getString("barrio"));
                    table.addCell("nhabitaciones");
                    table.addCell(rs.getString("nhabitaciones"));
                    table.addCell("piso");
                    table.addCell(rs.getString("piso"));
                    table.addCell("estado");
                    table.addCell(rs.getString("estado"));
                    table.addCell("descripcion");
                    table.addCell(rs.getString("descripcion"));
                    table.addCell("estrato");
                    table.addCell(rs.getString("estrato"));
                    table.addCell("ciudad");
                    table.addCell(rs.getString("ciudad"));
                    table.addCell("precio");
                    table.addCell("" + rs.getInt("precio"));
                    texto = "\n";
                    parrafo = new Paragraph(texto);
                    documento.add(parrafo);

                    parrafo = new Paragraph();
                    parrafo.add(table);
                    documento.add(parrafo);
                    hayregistros = rs.next();

                    con++;
                    /*if (rs.getString("estado").equals("Ocupado")) {
                        ocu = ocu + 1;
                    } 
                    if (rs.getString("estado").equals("En reparaciones")) {
                        rep = rep + 1;
                    }*/
                }
            }

            con = con - 1;
            texto = "\n" + "El total de inmuebles es: " + con;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n" + "Inmueble No disponibles: " + ocu;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n" + "Inmueble En reparaciones: " + rep;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            archivo = "\\Reportes.pdf";
            documento.close();
            return archivo;
        } catch (Exception ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
            return (ex + "");
        } finally {
            documento.close();
        }
    }

    public static void ReportesPagos(ResultSet rs, String usu) {
        Document documento = new Document();
        try {

            String archivo = "F:\\ArrendamientosContratos\\web\\images\\Reportes" + usu + ".pdf";
            PdfWriter.getInstance(documento, new FileOutputStream(archivo));
            documento.open();
            //titulo
            String texto = "Reporte Pagosssss";
            Paragraph parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n";
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            //leer registro
            boolean hayregistros = rs.next();
            PdfPTable table;
            int con = 1;
            int ocu = 0;
            int rep = 0;
            //ciclo de recorrido
            while (hayregistros) {

                texto = "Inmueble Numero: " + con;
                parrafo = new Paragraph(texto);
                documento.add(parrafo);

                table = new PdfPTable(2);

                table.addCell("idinmueble");
                table.addCell(rs.getString("idinmueble"));
                table.addCell("direccion");
                table.addCell(rs.getString("direccion"));
                table.addCell("barrio");
                table.addCell(rs.getString("barrio"));
                table.addCell("nhabitaciones");
                table.addCell(rs.getString("nhabitaciones"));
                table.addCell("piso");
                table.addCell(rs.getString("piso"));
                table.addCell("estado");
                table.addCell(rs.getString("estado"));
                table.addCell("descripcion");
                table.addCell(rs.getString("descripcion"));
                table.addCell("estrato");
                table.addCell(rs.getString("estrato"));
                table.addCell("ciudad");
                table.addCell(rs.getString("ciudad"));
                table.addCell("precio");
                table.addCell("" + rs.getInt("precio"));
                texto = "\n";
                parrafo = new Paragraph(texto);
                documento.add(parrafo);

                parrafo = new Paragraph();
                parrafo.add(table);
                documento.add(parrafo);

                con++;
                if (rs.getString("estado").equals("Ocupado")) {
                    ocu = ocu + 1;
                }
                if (rs.getString("estado").equals("En reparaciones")) {
                    rep = rep + 1;
                }
                hayregistros = rs.next();
            }
            con = con - 1;
            texto = "\n" + "El total de inmuebles es: " + con;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n" + "Inmueble No disponibles: " + ocu;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n" + "Inmueble En reparaciones: " + rep;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

        } catch (Exception ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            documento.close();
        }

    }

    public static void ReportesContra(ResultSet rs, String usu) {
        Document documento = new Document();
        try {
            int p = 1;
            String archivo = "G:\\ArrendamientosContratos\\web\\images\\Contra" + p + ".pdf";
            PdfWriter.getInstance(documento, new FileOutputStream(archivo));
            documento.open();
            //titulo
            String texto = "contrato";
            Paragraph parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = "\n";
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            texto = usu;
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            boolean hayregistros = rs.next();
            PdfPTable table;

            while (hayregistros) {

                parrafo = new Paragraph(texto);
                documento.add(parrafo);

                table = new PdfPTable(2);

                table.addCell("codigo");
                table.addCell(rs.getString("codigo"));
                hayregistros = rs.next();
            }
            //leer registro
            /*boolean hayregistros = rs.next();
             miinmu.getIdinmueble()
             PdfPTable table;
             int con = 1;
             int ocu = 0;
             int rep = 0;
             //ciclo de recorrido
             while (hayregistros) {

             texto = "Inmueble Numero: " + con;
             parrafo = new Paragraph(texto);
             documento.add(parrafo);

             table = new PdfPTable(2);

             table.addCell("idinmueble");
             table.addCell(rs.getString("idinmueble"));
             table.addCell("direccion");
             table.addCell(rs.getString("direccion"));
             table.addCell("barrio");
             table.addCell(rs.getString("barrio"));
             table.addCell("nhabitaciones");
             table.addCell(rs.getString("nhabitaciones"));
             table.addCell("piso");
             table.addCell(rs.getString("piso"));
             table.addCell("estado");
             table.addCell(rs.getString("estado"));
             table.addCell("descripcion");
             table.addCell(rs.getString("descripcion"));
             table.addCell("estrato");
             table.addCell(rs.getString("estrato"));
             table.addCell("ciudad");
             table.addCell(rs.getString("ciudad"));
             table.addCell("precio");
             table.addCell("" + rs.getInt("precio"));
             texto = "\n";
             parrafo = new Paragraph(texto);
             documento.add(parrafo);

             parrafo = new Paragraph();
             parrafo.add(table);
             documento.add(parrafo);

             con++;
             if (rs.getString("estado").equals("Ocupado")) {
             ocu = ocu + 1;
             }
             if (rs.getString("estado").equals("En reparaciones")) {
             rep = rep + 1;
             }
             hayregistros = rs.next();
             }
             con=con-1;
             texto = "\n"+"El total de inmuebles es: " + con;
             parrafo = new Paragraph(texto);
             documento.add(parrafo);
                    
             texto = "\n"+"Inmueble No disponibles: " + ocu;
             parrafo = new Paragraph(texto);
             documento.add(parrafo);
                    
             texto = "\n"+"Inmueble En reparaciones: " + rep;
             parrafo = new Paragraph(texto);
             documento.add(parrafo);*/
            p++;
        } catch (Exception ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            documento.close();
        }

    }
    public boolean validar(String nombre){
 return true;
    
}}
