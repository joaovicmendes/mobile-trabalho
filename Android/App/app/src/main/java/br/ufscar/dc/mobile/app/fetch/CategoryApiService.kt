package br.ufscar.dc.mobile.app.fetch

import br.ufscar.dc.mobile.app.model.Category
import br.ufscar.dc.mobile.app.model.Course
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface CategoryApiService {
    @GET("categories/")
    fun getAll(): Call<List<Category>>

    @GET("categories/{id}/courses")
    fun getCourses(@Path("id") id: String): Call<List<Course>>
}