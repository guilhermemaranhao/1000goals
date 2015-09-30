package com.scrummasters.milgols.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.scrummasters.milgols.Logger;
import com.scrummasters.milgols.model.Estilo;
import com.scrummasters.milgols.model.Gol;

/**
 * Created by tiago on 30/09/15.
 */
public class EstiloDAO extends SQLiteOpenHelper{
    private static final String DATABASE_NAME = "milgols";
    private static final String DATABASE_TABLE = "estilo";
    private static final int DATABASE_VERSION = 1;
    private static final String ESTILO_DAO_TAG = "EstiloDAO.java";
    private static final String ESTILO_DAO_ON_CREATE_SQL = "CREATE TABLE "+ DATABASE_TABLE + " id INTEGER PRIMARY KEY AUTOINCREMENT, descricao TEXT);";

    public EstiloDAO(Context context)
    {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }


    @Override
    public void onCreate(SQLiteDatabase db) {

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }

    public long save( Estilo estilo ){
        long golId = -1;
        try{
            ContentValues map = new ContentValues();
            map.put("descricao", estilo.getDescricao() );
            golId = getWritableDatabase().insert(DATABASE_TABLE, null, map);
//            map.put("sincronized", 0);
        }catch (SQLException e) {
            Logger.e(ESTILO_DAO_TAG, "save ERROR " + e.toString());
        }
        close();
        return  golId;
    }
}
