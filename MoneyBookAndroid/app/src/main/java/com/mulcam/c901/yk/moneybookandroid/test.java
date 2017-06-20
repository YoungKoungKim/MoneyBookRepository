//package com.mulcam.c901.yk.moneybookandroid;
//
//import android.app.Activity;
//import android.app.ProgressDialog;
//import android.os.AsyncTask;
//import android.os.Bundle;
//import android.support.annotation.Nullable;
//import android.util.Log;
//import android.widget.TextView;
//import android.widget.Toast;
//
//import org.w3c.dom.Text;
//
//import java.io.IOException;
//import java.util.List;
//
//import retrofit2.Call;
//import retrofit2.Callback;
//import retrofit2.Response;
//import retrofit2.Retrofit;
//import retrofit2.converter.gson.GsonConverterFactory;
//import retrofit2.http.GET;
//import retrofit2.http.Path;
//
///**
// * Created by student on 2017-06-13.
// */
//
//public class test extends Activity {
//    private TextView tv;
//
//    @Override
//    protected void onCreate(@Nullable Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.test);
//
//        tv = (TextView) findViewById(R.id.test_tv);
//
//        /*
//        GitHubService service = retrofit.create(GitHubService.class);
//        List<Repo> repos = service.listRepos("ParkSangGwon");*/
//
//        Retrofit retrofit = new Retrofit.Builder()
//                .baseUrl("http://192.168.56.1:8080/MoneyBookProject/and/")
//                .addConverterFactory(GsonConverterFactory.create())
//                .build();
//        GitHubService service = retrofit.create(GitHubService.class);
//
//        Call<List<Repo>> call = service.callAndroid();
//        call.enqueue(new Callback<List<Repo>>() {
//            @Override
//            public void onResponse(Call<List<Repo>> call, Response<List<Repo>> response) {
//                List<Repo> list = response.body();
//                tv.setText(list.get(0).getFull_name());
//            }
//
//            @Override
//            public void onFailure(Call<List<Repo>> call, Throwable t) {
//                Toast.makeText(test.this, "fail", Toast.LENGTH_SHORT).show();
//            }
//        });
//
//
////        tv.setText(repos.toString());
//       /* new Thread(new Runnable() {
//            @Override
//            public void run() {
//                Retrofit retrofit = new Retrofit.Builder()
//                        .baseUrl("http://192.168.56.1:8080/MoneyBookProject/")
//                        .addConverterFactory(GsonConverterFactory.create())
//                        .build();
//                GitHubService service = retrofit.create(GitHubService.class);
//
//                Call<List<Repo>> call = service.callAndroid();
//                try {
//                    Response<List<Repo>> response =call.execute();
//                    List<Repo> list= response.body();
//                    Log.d("test", list.get(0).getFull_name());
//
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }).start();*/
//
//    }
//
//}
