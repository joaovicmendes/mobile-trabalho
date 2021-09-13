package br.ufscar.dc.mobile.app.model.db

import androidx.lifecycle.LiveData
import androidx.room.*
import br.ufscar.dc.mobile.app.model.Category

@Dao
interface CategoryDao {
    @Query("SELECT * FROM Category")
    fun getAll(): LiveData<List<Category>>

    @Query("SELECT * FROM Category WHERE id == :id")
    fun get(id: String): Category

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(category: Category)

    @Update
    suspend fun update(category: Category)

    @Delete
    fun delete(category: Category)
}