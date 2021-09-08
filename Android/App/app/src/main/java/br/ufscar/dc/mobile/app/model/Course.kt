package br.ufscar.dc.mobile.app.model

data class Course (
    val id: Long,
    val title: String,
    val instructor: User,
    val description: String,
    val rating: Int,
    val category: Category,
    val schedule: Schedule,
    val explanationUrl: String,
)
