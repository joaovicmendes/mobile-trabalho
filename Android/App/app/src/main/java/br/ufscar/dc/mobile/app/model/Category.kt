package br.ufscar.dc.mobile.app.model

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "Category")
data class Category (
    @PrimaryKey
    val id: String,
    val name: String,
    val hexColor: String, // Hex value of the color to be displayed in the search tab
)
