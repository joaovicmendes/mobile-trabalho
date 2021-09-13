package br.ufscar.dc.mobile.app.fetch

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

abstract class RetrofitClient {

    companion object {
        @Volatile
        private var INSTANCE: Retrofit? = null
        private const val baseUrl = Config.baseUrl

        private fun getInstance(): Retrofit {
            val tempInstance = INSTANCE
            if (tempInstance != null) {
                return tempInstance
            }

            synchronized(this) {
                val instance = Retrofit.Builder()
                    .baseUrl(baseUrl)
                    .addConverterFactory(GsonConverterFactory.create())
                    .build()
                INSTANCE = instance
                return instance
            }
        }

        fun <T> createService(serviceClass: Class<T>): T {
            return getInstance().create(serviceClass)
        }
    }
}

