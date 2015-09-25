package com.scrummasters.milgols.model;

import java.util.Date;

/**
 * Created by tiago on 25/09/15.
 */
public class Gol {

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

}
