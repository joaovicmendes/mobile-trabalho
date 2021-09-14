package br.ufscar.dc.mobile.app.model

import androidx.lifecycle.LiveData
import br.ufscar.dc.mobile.app.fetch.CategoryApiService
import br.ufscar.dc.mobile.app.fetch.RetrofitClient
import br.ufscar.dc.mobile.app.model.db.CategoryDao
import retrofit2.Call

class CategoryRepository(dao: CategoryDao) {
    private val categoryDao = dao
    private val retrofit = RetrofitClient.createService(CategoryApiService::class.java)

    fun fetchAllCategories(): Call<List<Category>> {
        return retrofit.getAll()
    }

    suspend fun getAllCategories(): List<Category> {
        return categoryDao.getAll()
    }

    suspend fun insert(category: Category) {
        categoryDao.insert(category)
    }
}