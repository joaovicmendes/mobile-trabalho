package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.adapter.CourseAdapter
import br.ufscar.dc.mobile.app.viewmodel.CourseViewModel

class SearchResultFragment : Fragment() {
    private var courseAdapter = CourseAdapter()
    private var courseViewModel: CourseViewModel? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView = inflater.inflate(R.layout.fragment_search_result, container, false)
        val categoryId = arguments?.getString("categoryId")

        categoryId?.let {
            val search_result_rv: RecyclerView = rootView.findViewById(R.id.search_result_rv)
            search_result_rv.adapter = courseAdapter
            search_result_rv.layoutManager = LinearLayoutManager(activity)

            courseViewModel = ViewModelProvider(this).get(CourseViewModel::class.java)
            courseViewModel!!.courseByCategoryList.observe(viewLifecycleOwner, { courses ->
                courseAdapter.setList(courses)
            })

            courseViewModel!!.fetchCoursesByCategory(categoryId)
        }

        return rootView
    }
}