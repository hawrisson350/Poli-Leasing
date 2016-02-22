/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Clases.Datos;
import Clases.Usuario;
import Clases.Utilidades;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author hawrisson.avendano
 */
@WebServlet(name = "Registrarse", urlPatterns = {"/Registrarse"})
public class Registrarse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            Utilidades uti = new Utilidades();
            String lu = "C:\\Users\\pc\\Desktop\\poli-leasign ultiiii\\Versiones\\11-1-2016\\superArrenda\\Poli-Leasing\\web\\images\\Usuarios";
            DiskFileItemFactory fac = new DiskFileItemFactory();
            fac.setSizeThreshold(1024);
            fac.setRepository(new File(lu));
            ServletFileUpload up = new ServletFileUpload(fac);
            String nom = "";
            
            String IdUsuario = "";
            String Nombres = "";
            String Apellidos = "";
            String Clave = "";
            String Confirmacion = "";
            String Perfil = "Invitado";
            String correo = "";
            String estado = "";
            
            try {
                List<FileItem> partes = up.parseRequest(request);
                for (FileItem item : partes) {
                    
                    if (item.getFieldName().equals("IdUsuario")) {
                        IdUsuario=item.getString();
                    }
                    if (item.getFieldName().equals("Nombres")) {
                        Nombres=item.getString();
                    }
                    if (item.getFieldName().equals("Apellidos")) {
                        Apellidos=item.getString();
                    }
                    if (item.getFieldName().equals("Clave")) {
                        Clave=item.getString();
                    }
                    if (item.getFieldName().equals("correo")) {
                        correo=item.getString();
                    }
                    if (item.getFieldName().equals("Foto")) {
                        if(!item.getName().equals("")){
                            nom=IdUsuario+uti.getExtensionFile(lu+item.getName());
                            File file = new File(lu,nom);
                            item.write(file);
                        }else{
                            nom="nofoto.jpg";
                        }
                    }
                }
                
                Datos misDatos = new Datos();
                Usuario miusu = misDatos.getUsuario(IdUsuario);
                if (miusu != null) {
                    out.write("Usuario ya existe");
                } else {
                    
                    miusu = new Usuario(
                            IdUsuario,
                            Nombres,
                            Apellidos,
                            Clave,
                            Perfil,
                            nom,
                            correo,
                            estado);
                    misDatos.NewUsuario(miusu);
                }
                
                
                request.getSession().setAttribute("Foto",nom); 
                
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", misDatos.getUsuario(IdUsuario));
                
                response.sendRedirect("MenuInvi.jsp");
                misDatos.CerrarConexion();
            } catch (FileUploadException ex) {
                out.write("Errror al subir el archivo :o " + ex.getMessage());
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Registrarse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Registrarse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
