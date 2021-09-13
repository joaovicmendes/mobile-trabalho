package br.ufscar.dc.mobile.app.model

data class CourseDto (
    val id: String,
    val title: String,
    val instructorId: String,
    val description: String,
    val rating: Int,
    val categoryId: String,
    val schedule: String,
    val videoUrl: String,
    val thumbnail: String,
)
