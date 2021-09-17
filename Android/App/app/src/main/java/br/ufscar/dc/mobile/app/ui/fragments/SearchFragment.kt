package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.adapter.CategoryAdapter
import br.ufscar.dc.mobile.app.adapter.CategoryOnClickListener
import br.ufscar.dc.mobile.app.viewmodel.CategoryViewModel

class SearchFragment : Fragment(), CategoryOnClickListener {
    private var categoryAdapter = CategoryAdapter()
    private var categoryViewModel: CategoryViewModel? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView = inflater.inflate(R.layout.fragment_search, container, false)

        // Category view Setup
        categoryAdapter.setClickListener(this)
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

    override fun onItemClick(categoryId: String) {
        var args = Bundle()
        args.putString("categoryId", categoryId)
        val searchResultFragment = SearchResultFragment()
        searchResultFragment.arguments = args

        activity?.supportFragmentManager?.beginTransaction()?.apply {
            replace(R.id.fragment_frame, searchResultFragment)
            addToBackStack(null)
            commit()
        }
    }
}