package com.mulcam.c901.yk.moneybookandroid.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.mulcam.c901.yk.moneybookandroid.R;
import com.mulcam.c901.yk.moneybookandroid.service.LoginService;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by student on 2017-06-14.
 */

public class LoginActivity extends Activity {
    private EditText userID;
    private EditText userPW;
    private Button okBtn;
    private Button cancelBtn;
    private LoginService service;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);

        userID = (EditText) findViewById(R.id.login_id_edt);
        userPW = (EditText) findViewById(R.id.login_pw_edt);
        okBtn = (Button) findViewById(R.id.login_ok_btn);
        cancelBtn = (Button) findViewById(R.id.login_cancle_btn);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.56.1:8080/MoneyBookProject/android/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        service = retrofit.create(LoginService.class);

        okBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = userID.getText().toString();
                String pw = userPW.getText().toString();
                Call<Integer> call = service.login(id, pw);
                call.enqueue(new Callback<Integer>() {
                    @Override
                    public void onResponse(Call<Integer> call, Response<Integer> response) {
                        Integer result = response.body();
                        if (result == 2101) {
                            Toast.makeText(LoginActivity.this, "성공", Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(LoginActivity.this, MoneyBookActivity.class);
                            startActivity(intent);
                            finish();
                        } else if (result == 2102) {
                            Toast.makeText(LoginActivity.this, "아이디 또는 비밀번호가 다릅니다.", Toast.LENGTH_SHORT).show();
                        }
                    }

                    @Override
                    public void onFailure(Call<Integer> call, Throwable t) {
                        Toast.makeText(LoginActivity.this, "인터넷 연결을 확인해주세요.", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });

        cancelBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

    }
}
