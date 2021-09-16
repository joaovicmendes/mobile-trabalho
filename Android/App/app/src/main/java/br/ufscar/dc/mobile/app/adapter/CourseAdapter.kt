package br.ufscar.dc.mobile.app.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.model.Course
import kotlinx.android.synthetic.main.course_item.view.*

class CourseAdapter : RecyclerView.Adapter<CourseAdapter.CourseViewHolder>() {
    private var courseList = emptyList<Course>()

    class CourseViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CourseViewHolder {
        return CourseViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.course_item,
                parent,
                false
            )
        )
    }

    override fun onBindViewHolder(holder: CourseViewHolder, position: Int) {
        val currentCourse = courseList[position]
        holder.itemView.apply {
            course_item_title.text = currentCourse.title
            course_item_instructor.text = currentCourse.instructor.name
            course_item_rating.numStars = currentCourse.rating
        }
    }

    override fun getItemCount(): Int {
        return courseList.size
    }

    fun setList(courses: List<Course>) {
        courseList = courses
        notifyDataSetChanged()
    }
}
