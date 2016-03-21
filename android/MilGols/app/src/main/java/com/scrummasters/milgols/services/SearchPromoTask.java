package com.scrummasters.milgols.services;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.widget.Toast;


import com.kinvey.android.AsyncAppData;
import com.kinvey.android.Client;
import com.kinvey.android.callback.KinveyListCallback;
import com.kinvey.android.callback.KinveyUserCallback;
import com.kinvey.java.Query;
import com.kinvey.java.User;
import com.kinvey.java.core.KinveyClientCallback;
import com.kinvey.java.query.AbstractQuery;
import com.scrummasters.milgols.Logger;
import com.scrummasters.milgols.model.Promocao;


/**
 * Created by asus on 20/03/2016.
 */
public class SearchPromoTask implements Runnable {
        private Client client;

    private static final String TAG = "SearchPromoTask.java";
    private static final int REQUEST_BACK_END_SYNC_TIME = 15000;
    private Promocao promocao;
    private Context context;
    private boolean isInterrupted;

    public SearchPromoTask(Context context)
    {
        this.context = context;
    }

    public void run()
    {
        Logger.i(TAG, "THREAD START TO FIND PROMO BACK END");
        startBackEndClient();
//        sendPromocao();
        while (!isInterrupted) {
            try {
                if (isInternetConnected()) {
                    requestPromo();
                    Thread.sleep(REQUEST_BACK_END_SYNC_TIME);
                }
            } catch (Exception e) {
                Logger.e(TAG, e.toString());
            }
        }
    }

    private void startBackEndClient() {
        if (client == null) {
            Logger.i(TAG, "NEW CLIENT CREATED !!!!");
            client = new Client.Builder("kid_-kDGipopkZ", "521edfba53dd4b35b2ade8abbdc78dc5", context).build();
        }

        if (!client.user().isUserLoggedIn()) {
            client.user().login(new KinveyUserCallback() {
                @Override
                public void onFailure(Throwable error) {
                    Logger.e(TAG, "Login Failure " + error.toString());
                }

                @Override
                public void onSuccess(User result) {
                    Logger.i(TAG, "Logged in a new implicit user with id: " + result.getId());
                }
            });
        }
    }

    private void requestPromo() {
        try{
            AsyncAppData<Promocao> myBusDroidCollection = client.appData("promocao", Promocao.class);
            myBusDroidCollection.get( new KinveyListCallback<Promocao>() {
                @Override
                public void onSuccess(Promocao[] results) {
                    try {
                        if (results != null) {
                            Toast.makeText(context, "Promoções: " + results.length, Toast.LENGTH_SHORT).show();
                        }
                    } catch (Exception e) {
                        Toast.makeText(context, "Exception", Toast.LENGTH_SHORT).show();
                        Logger.e(TAG, "Erro ao receber e exibir kinvey object " + e.toString());
                    }
                }

                @Override
                public void onFailure(Throwable error) {
                    Logger.e(TAG, "SORT DESC LIMIT 1: failed to find " + error.getMessage());
                }
            });

        }catch (Exception e ){
            Logger.e(TAG, "Erro requestLastBackEndObject " + e.toString());
        }
    }

    private boolean isInternetConnected()
    {
        try {
            ConnectivityManager cm =
                    (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
            boolean isConnected = activeNetwork != null &&
                    activeNetwork.isConnectedOrConnecting();
            return isConnected;
        } catch (Exception e) {
            Logger.e(TAG, e.toString());
        }
        return false;
    }

    private void sendPromocao()
    {
        Promocao promocao = new Promocao();
        promocao.setNome("Queijo");
        promocao.setDescricao("Fresco de Minas");
        promocao.setLat(-16.691039);
        promocao.setLng(-49.240276);
        promocao.setIdpromo(12345L);

        AsyncAppData<Promocao> busDroidAsyncAppData = client.appData("promocao",Promocao.class);
        busDroidAsyncAppData.save(promocao, new KinveyClientCallback<Promocao>()
        {
            @Override
            public void onFailure(Throwable e) {
//                Logger.e(SEND_DATA_TO_BACK_END_TASK_TAG, "failed to save event data" + e.toString());
//                Logger.d(SEND_DATA_TO_BACK_END_TASK_TAG, "#### INSERTED UNSYNCRONIZED BD " + busdroidbd.insertUnsyncronized(busdroid));
            }

            @Override
            public void onSuccess(Promocao promocaoReturned)
            {
                Toast.makeText(context, "Promoção enviada: " + promocaoReturned.getId(), Toast.LENGTH_SHORT).show();
            }
        });
    }


    public void stopRunnable()
    {
        this.isInterrupted = true;
    }
}
