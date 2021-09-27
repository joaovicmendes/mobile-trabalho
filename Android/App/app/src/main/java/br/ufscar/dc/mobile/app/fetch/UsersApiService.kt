package br.ufscar.dc.mobile.app.fetch


import br.ufscar.dc.mobile.app.model.User
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface UsersApiService {
    @GET("users/{id}/")
    fun get(
            @Path("id") id: String
    ): Call<User>

}