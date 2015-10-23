package com.scrummasters.milgols;

/**
 * Created by tiago on 09/10/15.
 */

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.*;

/**
 * Created by tiago on 09/02/15.
 */
public class MilGolsService extends Service{
    private Looper mServiceLooper;
    private ServiceHandler mServiceHandler;
    public static final String SERVICE_TAG = "MilGolsService.java";
    private static final int SERVICE_SYNC_TIME = 10000;
    private static AccelerometerListener accelerometerListener;
    private SensorManager sensorManager;

    // Handler that receives messages from the thread
    private final class ServiceHandler extends android.os.Handler {
        public ServiceHandler(Looper looper) {
            super(looper);
            Logger.d(SERVICE_TAG, "ServiceHandler constructor");
        }

        @Override
        public void handleMessage(Message msg) {
            Logger.d(SERVICE_TAG, "handleMessage initializing task loop");
            while (!Thread.currentThread().isInterrupted()) {
                synchronized (this) {
                    try {

                    }catch (Exception e) {
                        Logger.e(SERVICE_TAG, "Error while doing the operation after some seconds" + e.toString());
                    }
                }
            }
            // Stop the service using the startId, so that we don't stop
            // the service in the middle of handling another job
            stopSelf(msg.arg1);
        }
    }

    @Override
    public void onCreate() {
        // Start up the thread running the service.  Note that we create a
        // separate thread because the service normally runs in the process's
        // main thread, which we don't want to block.  We also make it
        // background priority so CPU-intensive work will not disrupt our UI.
        Logger.d(SERVICE_TAG, "onCreate starting thread service");
        HandlerThread thread = new HandlerThread("ServiceStartArguments",
                android.os.Process.THREAD_PRIORITY_BACKGROUND);
        thread.start();
        startAccelerometerListener();
        // Get the HandlerThread's Looper and use it for our Handler
        mServiceLooper = thread.getLooper();
        mServiceHandler = new ServiceHandler(mServiceLooper);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Logger.d(SERVICE_TAG, "onStartCommand service starting");

        // For each start request, send a message to start a job and deliver the
        // start ID so we know which request we're stopping when we finish the job
        Message msg = mServiceHandler.obtainMessage();
        msg.arg1 = startId;
        mServiceHandler.sendMessage(msg);
        // If we get killed, after returning from here, restart
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent)
    {
        // We don't provide binding, so return null
//        Logger.d(MOBMARK_SERVICE_TAG, "onBind We don't provide binding, so return null");
        return null;
    }

//    @Override
//    public IBinder onBind(Intent intent) {
//        return new ISyncAndTradeService.Stub() {
//
//            @Override
//            public boolean startTradeEngine() throws RemoteException {
//                return false;
//            }
//        };
//    }

    @Override
    public void onDestroy()
    {
        if( sensorManager != null) {
            sensorManager.unregisterListener(accelerometerListener);
        }
        stopSelf();
        Logger.d(SERVICE_TAG, "service done");
    }

    public void startAccelerometerListener()
    {
        try {
            accelerometerListener = new AccelerometerListener(getApplicationContext(), 0.00f, SensorManager.GRAVITY_EARTH, SensorManager.GRAVITY_EARTH);
            sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
            sensorManager.registerListener(accelerometerListener, sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER), SensorManager.SENSOR_DELAY_GAME);
        }catch (Exception e){
            Logger.d(SERVICE_TAG, "Error onStartAccellerometerListener: " + e.getMessage());
        }
    }


}

