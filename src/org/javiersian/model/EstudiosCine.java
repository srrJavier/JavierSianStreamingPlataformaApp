
package org.javiersian.model;

public class EstudiosCine {
    private int idSedeCentral;
    private String pais;
    private String nombreEstudio;

    public EstudiosCine() {
    }

    public EstudiosCine(int idSedeCentral, String pais, String nombreEstudio) {
        this.idSedeCentral = idSedeCentral;
        this.pais = pais;
        this.nombreEstudio = nombreEstudio;
    }

    public String getNombreEstudio() {
        return nombreEstudio;
    }

    public void setNombreEstudio(String nombreEstudio) {
        this.nombreEstudio = nombreEstudio;
    }

    public int getIdSedeCentral() {
        return idSedeCentral;
    }

    public void setIdSedeCentral(int idSedeCentral) {
        this.idSedeCentral = idSedeCentral;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
}
