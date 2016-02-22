
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
        String lu = "C:\\Users\\hawrisson.avendano\\Documents\\superArrenda\\Poli-Leasing\\web\\images\\Usuarios";
        DiskFileItemFactory fac = new DiskFileItemFactory();
        fac.setSizeThreshold(1024);
        fac.setRepository(new File(lu));
        ServletFileUpload up = new ServletFileUpload(fac);
        String nom="";
        try {
            List<FileItem> partes = up.parseRequest(request);
            for (FileItem item : partes) {
                if(item.getName() != null){
                    File file = new File(lu,item.getName());
                    item.write(file);
                    nom=item.getName();
                }
            }
            application.setAttribute("Foto",nom);
            out.write("Errror ");
            response.sendRedirect("Registrarse.jsp");
            
        } catch (FileUploadException ex) {
            out.write("Errror al subir el archivo :o " + ex.getMessage());
        }

%>
