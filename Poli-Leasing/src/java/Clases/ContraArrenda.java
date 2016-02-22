package Clases;

import java.util.Date;

public class ContraArrenda {

    private String codigo;
    private String inmueble;
    private String arrendat;
    private Date fecha;
    private String descripcion;
    private int valor;
    private Date fechaMax;

    public ContraArrenda(String codigo, String inmueble, String arrendat,
            Date fecha, String descripcion, int valor, Date fechaMax) {
        this.codigo = codigo;
        this.inmueble = inmueble;
        this.arrendat = arrendat;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.valor = valor;
        this.fechaMax = fechaMax;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getFechaMax() {
        return fechaMax;
    }

    public void setFechaMax(Date fechaMax) {
        this.fechaMax = fechaMax;
    }

    public String getArrendat() {
        return arrendat;
    }

    public void setArrendat(String arrendat) {
        this.arrendat = arrendat;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getInmueble() {
        return inmueble;
    }

    public void setInmueble(String inmueble) {
        this.inmueble = inmueble;
    }

}
