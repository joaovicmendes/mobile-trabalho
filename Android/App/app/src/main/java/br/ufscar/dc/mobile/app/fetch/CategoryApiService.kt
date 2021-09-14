package br.ufscar.dc.mobile.app.fetch

import br.ufscar.dc.mobile.app.model.Category
import retrofit2.Call
import retrofit2.http.GET

interface CategoryApiService {
    @GET("categories/")
    fun getAll(): Call<List<Category>>
}