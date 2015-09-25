package com.scrummasters.milgols.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.scrummasters.milgols.model.Gol;
import com.scrummasters.milgols.Logger;

/**
 * Created by tiago on 25/09/15.
 */
public class GolDAO extends SQLiteOpenHelper{

    private static final String DATABASE_NAME = "milgols";
    private static final String DATABASE_TABLE = "gol";
    private static final int DATABASE_VERSION = 1;
    private static final String GOL_DAO_TAG = "GolDAO.java";
    private static final String GOL_DAO_ON_CREATE_SQL = "CREATE TABLE "+ DATABASE_TABLE + " id INTEGER PRIMARY KEY AUTOINCREMENT, timemilliseconds INTEGER, descricao TEXT);";

   public GolDAO(Context context)
   {
       super(context, DATABASE_NAME, null, DATABASE_VERSION);
   }


    @Override
    public void onCreate(SQLiteDatabase db) {

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }

    public long save( Gol gol ){
        long golId = -1;
        try{
            ContentValues map = new ContentValues();
            map.put("timemilliseconds", gol.getData().toString());
            map.put("descricao", gol.getDescricao() );
            golId = getWritableDatabase().insert(DATABASE_TABLE, null, map);
//            map.put("sincronized", 0);
        }catch (SQLException e) {
            Logger.e(GOL_DAO_TAG, "save ERROR " + e.toString());
        }
        close();
        return  golId;
    }
}
