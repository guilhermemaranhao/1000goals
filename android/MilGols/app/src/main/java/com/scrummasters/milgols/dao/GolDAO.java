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
    private static final int DATABASE_VERSION = 7;
    private static final String GOL_DAO_TAG = "GolDAO.java";
    private static final String GOL_DAO_ON_CREATE_SQL = "CREATE TABLE gol (id INTEGER PRIMARY KEY AUTOINCREMENT, timemilliseconds INTEGER, descricao TEXT);";
    private static final String GOL_DAO_ON_UPDATE_SQL = "DROP TABLE IF EXISTS gol;";


   public GolDAO(Context context)
   {
       super(context, DATABASE_NAME, null, DATABASE_VERSION);
   }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.beginTransaction();
        try{
            db.execSQL(GOL_DAO_ON_CREATE_SQL);
            db.setTransactionSuccessful();
        }catch (SQLException e){
            Logger.e(GOL_DAO_TAG, "Error creating tables " + e.getMessage());
            throw e;
        }finally {
         db.endTransaction();
        }
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.beginTransaction();
        try{
            db.execSQL(GOL_DAO_ON_UPDATE_SQL);
            db.setTransactionSuccessful();
        }catch (SQLException e){
            Logger.e(GOL_DAO_TAG, "Error updating tables " + e.getMessage());
            throw e;
        }finally {
            db.endTransaction();
        }
        onCreate(db);
    }

    public long save( Gol gol ){
        long golId = -1;
        try{
            ContentValues map = new ContentValues();
            map.put("timemilliseconds", 0);
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
