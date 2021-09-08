package br.ufscar.dc.mobile.app.model

data class User (
    val id: Long,
    val name: String,
    val username: String,
    val email: String,
    val password: String,
)
