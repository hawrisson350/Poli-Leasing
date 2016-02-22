/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;


public class Usuario {
    private String idusuario;
    private String nombre;
    private String apellido;
    private String clave;
    private String tipodeusuario;
    private String foto;
    private String correo;
    private String Estado;

    public Usuario() {
    }
    
    
    
    public Usuario(String idusuario, String nombre, String apellido,
            String clave,String tipodeusuario, String foto,String correo,String Estado) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.clave = clave;
        this.tipodeusuario = tipodeusuario;
        this.foto = foto;
        this.correo = correo;
        this.Estado = Estado;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getTipodeusuario() {
        return tipodeusuario;
    }

    public void setTipodeusuario(String tipodeusuario) {
        this.tipodeusuario = tipodeusuario;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
}
