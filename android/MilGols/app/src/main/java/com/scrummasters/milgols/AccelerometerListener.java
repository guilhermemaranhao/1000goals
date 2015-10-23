package com.scrummasters.milgols;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.TaskStackBuilder;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.widget.ThemedSpinnerAdapter;
import android.util.Log;
import android.util.TypedValue;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Toast;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by tiago on 09/10/15.
 */
public class AccelerometerListener implements SensorEventListener{

    private float accel; // acceleration apart from gravity
    private float accelCurrent; // current acceleration including gravity
    private float accelLast; // last acceleration including gravity
    private Context context;
    private static long firstShakeTime;
    private static long nowShakeTime;
    private static long lastCompleteShakeTime;
    Calendar calendar = Calendar.getInstance();

    public AccelerometerListener(Context context, float accel, float accelCurrent, float accelLast )
    {
        this.context = context;
        this.accel = accel;
        this.accelCurrent = accelCurrent;
        this.accelLast = accelLast;
    }

    public void onSensorChanged(SensorEvent se) {
        float x = se.values[0];
        float y = se.values[1];
        float z = se.values[2];
        accelLast = accelCurrent;
        accelCurrent = (float) Math.sqrt((double) (x*x + y*y + z*z));
        float delta = accelCurrent - accelLast;
        accel = accel * 0.9f + delta; // perform low-cut filter
        if (accel > 12) {
//            Toast toast = Toast.makeText(context, "Device has shaken.", Toast.LENGTH_SHORT);
//            toast.show();
            nowShakeTime = new Date().getTime();
            if(firstShakeTime == 0 )
            {
                firstShakeTime = nowShakeTime;
            }else{
                if( (nowShakeTime - firstShakeTime) > 9000  )
                {
                    firstShakeTime = nowShakeTime;
                    return;
                }

                if( (nowShakeTime - firstShakeTime) > 3000 && (nowShakeTime - lastCompleteShakeTime) > 7000 )
                {
//                    Toast toast = Toast.makeText(context, "Device has shaken.", Toast.LENGTH_SHORT);
//                    toast.show();
                    sendNotification();
                    calendar.setTimeInMillis(nowShakeTime);
                    Logger.d("ACC", "Shaked " + calendar.getTime().toString());
                    lastCompleteShakeTime = nowShakeTime;
                    firstShakeTime = 0;
                }
            }
        }
    }

    public void onAccuracyChanged(Sensor sensor, int accuracy)
    {

    }


    private void sendNotification()
    {
        Notification.Builder builder = new Notification.Builder(context);
        builder.setSmallIcon(R.drawable.ball_2_64);
//        TypedValue typedValue = new TypedValue();
//        context.getTheme().resolveAttribute(R.attr.colorPrimary, typedValue, true);
        int color = 0xff9800;
        builder.setColor(color);
        builder.setContentTitle("Gol Marcado!!");
        builder.setContentText("Parabens artilheiro, você marcou um gol!!");

        Intent resultIntent = new Intent(context, MainActivity.class);
        TaskStackBuilder stackBuilder = TaskStackBuilder.create(context);
        stackBuilder.addParentStack(MainActivity.class);
        stackBuilder.addNextIntent(resultIntent);

        PendingIntent pendingIntent = stackBuilder.getPendingIntent(0, PendingIntent.FLAG_UPDATE_CURRENT);
        builder.setContentIntent(pendingIntent);

        NotificationManager notificationManager =
                (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

        notificationManager.notify(123, builder.build());

    }
}