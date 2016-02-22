/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Hawrisson Avendaño
 */
package Clases;

public class Imagen {

    private String inmueble;
    private String imagen;
    
    public Imagen() {
    }
    
    
    public Imagen(String inmueble,String imagen) {
        this.inmueble = inmueble;
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getInmueble() {
        return inmueble;
    }

    public void setInmueble(String inmueble) {
        this.inmueble = inmueble;
    }

}
