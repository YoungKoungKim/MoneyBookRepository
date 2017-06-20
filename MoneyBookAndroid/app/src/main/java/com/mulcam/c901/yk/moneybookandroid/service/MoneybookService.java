package com.mulcam.c901.yk.moneybookandroid.service;

import com.mulcam.c901.yk.moneybookandroid.model.MoneyBook;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by student on 2017-06-14.
 */

public interface MoneybookService {
    @GET("moneybookList.do")
    Call<HashMap<String, Object>> moneybookList();
}
