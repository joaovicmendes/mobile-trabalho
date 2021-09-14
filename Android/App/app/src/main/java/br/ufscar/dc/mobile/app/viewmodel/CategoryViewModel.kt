package br.ufscar.dc.mobile.app.viewmodel

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import br.ufscar.dc.mobile.app.model.Category
import br.ufscar.dc.mobile.app.model.CategoryRepository
import br.ufscar.dc.mobile.app.model.db.AppDatabase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CategoryViewModel(application: Application) : AndroidViewModel(application) {
    var categoryList = MutableLiveData<List<Category>>()
    private var categoryRepo: CategoryRepository

    init {
        val dao = AppDatabase.getDatabase(application).categoryDao()
        categoryRepo = CategoryRepository(dao)
    }

    fun fetchCategories() {
        viewModelScope.launch(Dispatchers.IO) {
            val call = categoryRepo.fetchAllCategories()
            call.enqueue(object : Callback<List<Category>> {
                override fun onResponse(call: Call<List<Category>>, response: Response<List<Category>>) {
                    val categories = response.body()
                    categories?.let {
                        insertListIntoDB(it)
                    }
                }

                override fun onFailure(call: Call<List<Category>>, t: Throwable) {
                    Log.d("RetrofitError", "Erro ao buscar todas as categorias", t)
                }
            })
        }
    }

    fun getCategories() {
        viewModelScope.launch(Dispatchers.IO) {
            categoryList.postValue(categoryRepo.getAllCategories())
        }
    }

    private fun insertListIntoDB(list: List<Category>) {
        for (item in list) {
            insertIntoDB(item)
        }
    }

    private fun insertIntoDB(category: Category) {
        viewModelScope.launch(Dispatchers.IO) {
            categoryRepo.insert(category)
        }
    }
}