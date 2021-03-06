package br.ufscar.dc.mobile.app.model

data class Course (
    val id: String,
    val title: String,
    val instructor: User,
    val description: String,
    val rating: Int,
    val category: Category,
    val schedule: String,
    val videoUrl: String,
    val thumbnail: String,
)
