package com.scrummasters.milgols.model;

import java.util.Date;

/**
 * Created by tiago on 25/09/15.
 */
public class Gol {

    private Long id;
    private Date data;
    private String descricao;


    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
