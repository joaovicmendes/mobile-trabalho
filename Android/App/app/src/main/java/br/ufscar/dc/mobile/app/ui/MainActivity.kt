package br.ufscar.dc.mobile.app.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.ui.fragments.HomeFragment
import br.ufscar.dc.mobile.app.ui.fragments.ProfileFragment
import br.ufscar.dc.mobile.app.ui.fragments.SearchFragment
import br.ufscar.dc.mobile.app.viewmodel.CategoryViewModel
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Bottom Navigation Bar setup
        val homeFragment = HomeFragment()
        val searchFragment = SearchFragment()
        val profileFragment = ProfileFragment()

        setCurrentFragment(homeFragment)
        bottom_navigation.setOnNavigationItemSelectedListener {
            when (it.itemId) {
                R.id.ic_home    -> setCurrentFragment(homeFragment)
                R.id.ic_search  -> setCurrentFragment(searchFragment)
                R.id.ic_profile -> setCurrentFragment(profileFragment)
            }
            true
        }

        // Fetching current app categories
        val categoryViewModel = ViewModelProvider(this).get(CategoryViewModel::class.java)
        categoryViewModel.fetchCategories()
    }

    private fun setCurrentFragment(fragment: Fragment) {
        supportFragmentManager.beginTransaction().apply {
            replace(R.id.fragment_frame, fragment)
            commit()
        }
    }
}