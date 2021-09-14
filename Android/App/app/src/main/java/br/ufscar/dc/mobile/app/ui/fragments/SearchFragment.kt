package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.adapter.CategoryAdapter
import br.ufscar.dc.mobile.app.viewmodel.CategoryViewModel

class SearchFragment : Fragment() {
    private var categoryAdapter = CategoryAdapter()
    private var categoryViewModel: CategoryViewModel? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView = inflater.inflate(R.layout.fragment_search, container, false)

        // Category view Setup
        val search_category_rv: RecyclerView = rootView.findViewById(R.id.search_category_rv)
        search_category_rv.adapter = categoryAdapter
        search_category_rv.layoutManager = GridLayoutManager(activity, 2)

        categoryViewModel = ViewModelProvider(this).get(CategoryViewModel::class.java)
        categoryViewModel!!.categoryList.observe(viewLifecycleOwner, { categories ->
            categoryAdapter.setList(categories)
        })

        categoryViewModel!!.getCategories()

        return rootView
    }
}