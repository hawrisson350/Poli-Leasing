
package Clases;

import java.util.Date;


public class Multas {
    private String codigo;
    private Date fecha;
    private String valor;
    private String descripcion;

    public Multas(String codigo, Date fecha, String valor, String descripcion) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.valor = valor;
        this.descripcion = descripcion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
