package br.ufscar.dc.mobile.app.model

import br.ufscar.dc.mobile.app.fetch.CoursesApiService
import br.ufscar.dc.mobile.app.fetch.RetrofitClient
import retrofit2.Call

class CourseRepository {
    private val retrofit = RetrofitClient.createService(CoursesApiService::class.java)

    fun fetchAllCourses(): Call<List<Course>> {
        return retrofit.getAll()
    }

    suspend fun fetchCourse(id: String): Course {
        return retrofit.get(id)
    }
}
