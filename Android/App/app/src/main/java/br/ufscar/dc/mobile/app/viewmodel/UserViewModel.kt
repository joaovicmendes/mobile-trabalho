package br.ufscar.dc.mobile.app.viewmodel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.ufscar.dc.mobile.app.model.Course
import br.ufscar.dc.mobile.app.model.User

import br.ufscar.dc.mobile.app.model.UserRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class UserViewModel : ViewModel() {
    private val userRepo = UserRepository()
    val curUser = MutableLiveData<User>()

    fun fetchUserById(userId: String) {
        viewModelScope.launch(Dispatchers.IO) {
            val call = userRepo.fetchUser(userId)
            call.enqueue(object : Callback<User> {
                override fun onResponse(call: Call<User>, response: Response<User>) {
                    curUser.postValue(response.body())
                    print(response.body())
                }

                override fun onFailure(call: Call<User>, t: Throwable) {
                    Log.d("RetrofitError", "Erro ao buscar todos os cursos da categoria " + userId, t)
                }
            })
        }
    }
}