package br.ufscar.dc.mobile.app.fetch


import br.ufscar.dc.mobile.app.model.Course
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface CoursesApiService {
    @GET("courses/{id}/")
    fun get(
        @Path("id") id: String
    ): Call<Course>

    @GET("courses/")
    fun getAll(): Call<List<Course>>
}
