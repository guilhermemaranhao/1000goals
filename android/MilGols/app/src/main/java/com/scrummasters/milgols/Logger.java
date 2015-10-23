package com.scrummasters.milgols;

/**
 * Created by tiago on 25/09/15.
 */

import android.util.Log;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public final class Logger{

    private static final String logDirectoryPath = "/sdcard/milgols/";
    private static final String logFilePath = "/sdcard/milgols/milgols.txt";
    private static FileWriter logFileWriter;
    private static final String LOGGER_TAG = "Logger.java";
    private static final String ERROR_TAG = "E";
    private static final String INFORMATION_TAG = "I";
    private static final String WARNING_TAG = "W";
    private static final String DEBUG_TAG = "D";

    public Logger()
    {
        createDirectoryLogFileInSdcardIfDoesntExist();
    }

    public static void createDirectoryLogFileInSdcardIfDoesntExist()
    {
        File directory = new File(logDirectoryPath);
        if( ! directory.exists() )
        {
            directory.mkdirs();
        }
    }

    private static boolean openLogFileWriter()
    {
        createDirectoryLogFileInSdcardIfDoesntExist();
        boolean fileOpenedToWrite = false;
        try{
            logFileWriter = new FileWriter(logFilePath,true);
            fileOpenedToWrite = true;
        }catch(IOException e){
            Log.e(LOGGER_TAG, "IOException in openLogFileWriter()");
            e.printStackTrace();
        }
        return fileOpenedToWrite;
    }

    private static boolean closeLogFileWriter()
    {
        boolean fileClosed = false;
        try
        {
            logFileWriter.flush();
            logFileWriter.close();
            fileClosed = true;
        } catch (Exception e) {
            Log.e(LOGGER_TAG, "IOException in closeLogFileWriter()");
            e.printStackTrace();
        }
        return fileClosed;

    }

    private static boolean writeInLogFile(String level, String tag, String msg )
    {
        boolean writed = false;
        String currentTime = Calendar.getInstance().getTime().toString();
        if( openLogFileWriter() )
        {
            try{
                logFileWriter.append(level);
                logFileWriter.append(':');
                logFileWriter.append('\t');
                logFileWriter.append(currentTime);
                logFileWriter.append(':');
                logFileWriter.append('\t');
                logFileWriter.append(tag);
                logFileWriter.append(':');
                logFileWriter.append('\t');
                logFileWriter.append(msg);
                logFileWriter.append('\n');
                writed = closeLogFileWriter();
            }catch(IOException e)
            {
                closeLogFileWriter();
                writed = false;
            }
        }
        return writed;
    }

    //Log information
    public static void i (String tag, String msg)
    {
        Log.i(tag, "#################" + msg);
        writeInLogFile(INFORMATION_TAG, tag, msg);
    }

    //Log debug
    public static void d (String tag, String msg)
    {
        Log.d(tag, "#################" + msg);
        writeInLogFile(DEBUG_TAG, tag, msg);
    }

    //Log error
    public static void e (String tag, String msg)
    {
        Log.e(tag, "#################" + msg);
        writeInLogFile(ERROR_TAG, tag, msg);
    }

    //Log warning
    public static void w(String tag, String msg)
    {
        Log.w(tag, "#################" + msg);
        writeInLogFile(WARNING_TAG, tag, msg);
    }

}
