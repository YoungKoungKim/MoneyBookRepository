package com.mulcam.c901.yk.moneybookandroid;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.Toast;

import com.mulcam.c901.yk.moneybookandroid.service.MoneybookService;

import java.util.HashMap;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by student on 2017-06-14.
 */

public class testMoneyBook extends Activity {
    private DatePicker dp;
    private TextView incomeTv;
    private TextView expenseTv;
    private MoneybookService service;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.test);

        dp = (DatePicker) findViewById(R.id.test_dp);
        incomeTv = (TextView) findViewById(R.id.text_income_tv);
        expenseTv = (TextView) findViewById(R.id.text_expense_tv);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.56.1:8080/MoneyBookProject/android/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        service = retrofit.create(MoneybookService.class);

        dp.init(2017, 5, 14, new DatePicker.OnDateChangedListener() {
            @Override
            public void onDateChanged(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                Call<HashMap<String, Object>> call = service.moneybookList();
                call.enqueue(new Callback<HashMap<String, Object>>() {
                    @Override
                    public void onResponse(Call<HashMap<String, Object>> call, Response<HashMap<String, Object>> response) {
                        HashMap<String, Object> result = response.body();
                        List<HashMap<String, Object>> income = (List<HashMap<String, Object>>) result.get("income");
                    }

                    @Override
                    public void onFailure(Call<HashMap<String, Object>> call, Throwable t) {
                        Toast.makeText(testMoneyBook.this, "fail", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });

    }
}
