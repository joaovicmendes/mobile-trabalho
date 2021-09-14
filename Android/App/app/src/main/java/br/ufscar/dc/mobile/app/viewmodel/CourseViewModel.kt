package br.ufscar.dc.mobile.app.viewmodel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.ufscar.dc.mobile.app.model.Course
import br.ufscar.dc.mobile.app.model.CourseRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CourseViewModel : ViewModel() {
    private val courseRepo = CourseRepository()
    val courseList = MutableLiveData<List<Course>>()

    fun fetchCourses() {
        viewModelScope.launch(Dispatchers.IO) {
            val call = courseRepo.fetchAllCourses()
            call.enqueue(object : Callback<List<Course>> {
                override fun onResponse(call: Call<List<Course>>, response: Response<List<Course>>) {
                    courseList.postValue(response.body())
                }

                override fun onFailure(call: Call<List<Course>>, t: Throwable) {
                    Log.d("RetrofitError", "Erro ao buscar todos os cursos", t)
                }
            })
        }
    }
}
