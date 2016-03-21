package com.scrummasters.milgols.model;

import com.google.api.client.json.GenericJson;
import com.google.api.client.util.Key;

/**
 * Created by asus on 20/03/2016.
 */
public class Promocao extends GenericJson{

    @Key("_id")
    private String id;
    @Key
    private long idpromo;
    @Key
    private String nome;
    @Key
    private String descricao;
    @Key
    private double lng;
    @Key
    private double lat;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getIdpromo() {
        return idpromo;
    }

    public void setIdpromo(long idpromo) {
        this.idpromo = idpromo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }
}
