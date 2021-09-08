package br.ufscar.dc.mobile.app.model

/*
    List that represents the available time-slots for a given course. For the MVP, every schedule
    refers to the current week only. So days[0] = list of available time-slots on sunday, days[1] =
    monday and so on until days[6] = saturday. This should change on a final version to store week
    startomg from current day.
 */
data class Schedule (
    val days: List<List<String>>,
)
