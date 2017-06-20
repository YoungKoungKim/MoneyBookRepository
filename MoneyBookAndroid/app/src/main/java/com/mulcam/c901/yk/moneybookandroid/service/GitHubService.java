package com.mulcam.c901.yk.moneybookandroid.service;

import com.mulcam.c901.yk.moneybookandroid.model.Repo;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

/**
 * Created by student on 2017-06-13.
 */

public interface GitHubService {
    @GET("android.do")
    Call<List<Repo>> callAndroid();

}
