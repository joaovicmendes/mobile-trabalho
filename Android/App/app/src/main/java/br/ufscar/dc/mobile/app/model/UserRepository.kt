package br.ufscar.dc.mobile.app.model


import br.ufscar.dc.mobile.app.fetch.UsersApiService
import br.ufscar.dc.mobile.app.fetch.RetrofitClient
import retrofit2.Call

class UserRepository {
    private val userClient = RetrofitClient.createService(UsersApiService::class.java)




    fun fetchUser(id: String): Call<User> {
        return userClient.get(id)
    }


}