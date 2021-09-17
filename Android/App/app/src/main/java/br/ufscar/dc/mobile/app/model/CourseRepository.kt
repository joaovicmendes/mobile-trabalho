package br.ufscar.dc.mobile.app.model

import br.ufscar.dc.mobile.app.fetch.CategoryApiService
import br.ufscar.dc.mobile.app.fetch.CoursesApiService
import br.ufscar.dc.mobile.app.fetch.RetrofitClient
import retrofit2.Call

class CourseRepository {
    private val courseClient = RetrofitClient.createService(CoursesApiService::class.java)
    private val categoryClient = RetrofitClient.createService(CategoryApiService::class.java)

    fun fetchAllCourses(): Call<List<Course>> {
        return courseClient.getAll()
    }

    fun fetchCourse(id: String): Call<Course> {
        return courseClient.get(id)
    }

    fun fetchCoursesByCategory(id: String): Call<List<Course>> {
        return categoryClient.getCourses(id)
    }
}
