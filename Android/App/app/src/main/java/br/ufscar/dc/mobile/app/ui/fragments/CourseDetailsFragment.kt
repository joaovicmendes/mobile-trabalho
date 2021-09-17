package br.ufscar.dc.mobile.app.ui.fragments

import android.media.Rating
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.RatingBar
import android.widget.TextView
import androidx.lifecycle.ViewModelProvider
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.model.Course
import br.ufscar.dc.mobile.app.viewmodel.CourseViewModel

class CourseDetailsFragment : Fragment() {

    private var courseViewModel: CourseViewModel? = null
    private var curCourse: Course? = null
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView =  inflater.inflate(R.layout.fragment_course_details, container, false)
        val courseId = arguments?.getString("courseId")
        courseId?.let {

            courseViewModel = ViewModelProvider(this).get(CourseViewModel::class.java)
            courseViewModel!!.courseById.observe(viewLifecycleOwner, { course ->
                curCourse = course

                var title: TextView =  rootView.findViewById(R.id.course_details_title)
                title.text = course.title

                var teacher: TextView =  rootView.findViewById(R.id.course_details_instructor)
                teacher.text = course.instructor.name

                var description: TextView =  rootView.findViewById(R.id.course_details_description)
                description.text = course.description

                var rating: RatingBar =  rootView.findViewById(R.id.course_details_rating)
                rating.numStars = course.rating
            })

            courseViewModel!!.fetchCourseById(courseId)
        }

        return rootView
    }
}