package com.scrummasters.milgols;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.TaskStackBuilder;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;
import android.support.v7.widget.Toolbar;

import com.scrummasters.milgols.dao.GolDAO;
import com.scrummasters.milgols.model.Gol;
import com.scrummasters.milgols.services.SearchPromoTask;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private ImageButton ballImageBtn;
    private Intent intentService;
    private static final String TAG = "MainActivity.java";
    private Toolbar toolbar;
    private TabLayout tabLayout;
    private ViewPager viewPager;
    private Runnable searchPromoRunnable;
    private Thread searchPromoThread;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
//        ballImageBtn = (ImageButton) findViewById(R.id.ball_image_btn);
//        ballImageBtn.setOnClickListener(this);

        toolbar = (Toolbar) findViewById(R.id.toolbar);
//        setSupportActionBar(toolbar);

        toolbar.setTitle(getResources().getString(R.string.app_name));
//        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
//        getSupportActionBar().setDisplayHomeAsUpEnabled(true);


        viewPager = (ViewPager) findViewById(R.id.viewpager);
        setupViewPager(viewPager);

        tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(viewPager);
//        startService();
        iniciarServicoDeBuscaDePromocao();
    }

//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.menu_main, menu);
//        return true;
//    }

//    @Override
//    public boolean onOptionsItemSelected(MenuItem item) {
//        // Handle action bar item clicks here. The action bar will
//        // automatically handle clicks on the Home/Up button, so long
//        // as you specify a parent activity in AndroidManifest.xml.
//        int id = item.getItemId();
//
//        //noinspection SimplifiableIfStatement
//        if (id == R.id.action_settings) {
//            return true;
//        }
//
//        return super.onOptionsItemSelected(item);
//    }



//    private void sendNotification()
//    {
//        Notification.Builder builder = new Notification.Builder(this);
//        builder.setSmallIcon(R.drawable.ball_2_64);
//        builder.setContentTitle("Gol Marcado!!");
//        builder.setContentText("Parabens artilheiro, você marcou um gol!!");
//        builder.setLights(getResources().getColor(R.color.orange), 5000, 15000 );
//
//        Intent resultIntent = new Intent(this, MainActivity.class);
//        TaskStackBuilder stackBuilder = TaskStackBuilder.create(this);
//        stackBuilder.addParentStack(MainActivity.class);
//        stackBuilder.addNextIntent(resultIntent);
//
//        PendingIntent pendingIntent = stackBuilder.getPendingIntent(0, PendingIntent.FLAG_UPDATE_CURRENT);
//        builder.setContentIntent(pendingIntent);
//
//        NotificationManager notificationManager =
//                (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//
//        notificationManager.notify(123, builder.build());
//
//    }


        // Method to start the service
        public void startService() {
            try{
                if( intentService == null ){
                    intentService = new Intent(getBaseContext(), MilGolsService.class);
                    startService( intentService );
                    Logger.d(TAG, "startService()");
                }

            }catch (Exception e){
                Logger.e(TAG, "Error startService()");
                Logger.e(TAG, e.toString());
            }
        }

    private void setupViewPager(ViewPager viewPager) {
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        adapter.addFragment(new InsertFragment(), getString(R.string.promo));
        adapter.addFragment(new InsertFragment(), getString(R.string.lojas));
        adapter.addFragment(new InsertFragment(), getString(R.string.favoritos));
        viewPager.setAdapter(adapter);
    }

    class ViewPagerAdapter extends FragmentPagerAdapter {
        private final List<Fragment> mFragmentList = new ArrayList<>();
        private final List<String> mFragmentTitleList = new ArrayList<>();

        public ViewPagerAdapter(FragmentManager manager) {
            super(manager);
        }

        @Override
        public Fragment getItem(int position) {
            return mFragmentList.get(position);
        }

        @Override
        public int getCount() {
            return mFragmentList.size();
        }

        public void addFragment(Fragment fragment, String title) {
            mFragmentList.add(fragment);
            mFragmentTitleList.add(title);
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return mFragmentTitleList.get(position);
        }
    }



    private void iniciarServicoDeBuscaDePromocao()
    {
        try {
            if( searchPromoRunnable == null ){
                searchPromoRunnable = new SearchPromoTask(this.getApplicationContext());
                searchPromoThread = new Thread(searchPromoRunnable);
                searchPromoThread.start();
                Logger.i(TAG, "searchPromoThread Started!!");
            }
        } catch (Exception e) {
            Logger.d(TAG, e.toString());
        }
    }

}
