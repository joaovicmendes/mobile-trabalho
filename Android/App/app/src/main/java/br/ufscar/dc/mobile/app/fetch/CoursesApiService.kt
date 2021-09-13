package br.ufscar.dc.mobile.app.fetch

import br.ufscar.dc.mobile.app.model.CourseDto
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface CoursesApiService {
    @GET("courses/{id}/")
    suspend fun get(
        @Path("id") id: String
    ): CourseDto

    @GET("courses/")
    fun getAll(): Call<List<CourseDto>>
}
