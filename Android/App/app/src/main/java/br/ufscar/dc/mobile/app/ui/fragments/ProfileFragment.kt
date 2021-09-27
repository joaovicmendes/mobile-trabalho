package br.ufscar.dc.mobile.app.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.RatingBar
import android.widget.TextView
import androidx.lifecycle.ViewModelProvider
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.model.User
import br.ufscar.dc.mobile.app.viewmodel.CourseViewModel
import br.ufscar.dc.mobile.app.viewmodel.UserViewModel

class ProfileFragment : Fragment() {
    private var userViewModel: UserViewModel? = null
    private var curUser: User? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val rootView =  inflater.inflate(R.layout.fragment_profile, container, false);
        val curUserId = "me";

        curUserId?.let{
            userViewModel = ViewModelProvider(this).get(UserViewModel::class.java);
            userViewModel!!.curUser.observe(viewLifecycleOwner, { user ->
                curUser = user

                var name: TextView =  rootView.findViewById(R.id.user_username)
                name.text = user.name


            })

            userViewModel!!.fetchUserById(curUserId)

        }

        return rootView;
    }
}