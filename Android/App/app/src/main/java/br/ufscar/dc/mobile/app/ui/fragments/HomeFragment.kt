package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.adapter.CourseAdapter
import br.ufscar.dc.mobile.app.viewmodel.CourseViewModel
import br.ufscar.dc.mobile.app.adapter.CourseOnClickListener

class HomeFragment : Fragment(), CourseOnClickListener {
    private var courseAdapter = CourseAdapter()
    private var courseViewModel: CourseViewModel? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView = inflater.inflate(R.layout.fragment_home, container, false)

        // Courses view Setup
        courseAdapter.setClickListener(this);
        val home_courses_rv: RecyclerView = rootView.findViewById(R.id.home_courses_rv)
        home_courses_rv.adapter = courseAdapter
        home_courses_rv.layoutManager = LinearLayoutManager(activity)

        courseViewModel = ViewModelProvider(this).get(CourseViewModel::class.java)
        courseViewModel!!.courseList.observe(viewLifecycleOwner, { courses ->
            courseAdapter.setList(courses)
        })

        // Push to refresh setup
        val refresh_layout: SwipeRefreshLayout = rootView.findViewById(R.id.refresh_layout)
        refresh_layout.setOnRefreshListener {
            courseViewModel!!.fetchCourses()
            refresh_layout.isRefreshing = false
        }

        courseViewModel!!.fetchCourses()
        return rootView
    }

    override fun onItemClick(courseId: String) {
        var args = Bundle()
        args.putString("courseId", courseId)
        val courseDetailsFragment = CourseDetailsFragment()
        courseDetailsFragment.arguments = args

        activity?.supportFragmentManager?.beginTransaction()?.apply {
            replace(R.id.fragment_frame, courseDetailsFragment)
            addToBackStack(null)
            commit()
        }
    }
}