package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.adapter.CourseAdapter

class HomeFragment : Fragment() {
    private var courseAdapter: CourseAdapter? = null
    //private var courseViewModel: CourseViewModel? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_home, container, false)
    }
}