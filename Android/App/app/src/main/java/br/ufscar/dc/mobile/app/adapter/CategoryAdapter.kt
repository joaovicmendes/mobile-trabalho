package br.ufscar.dc.mobile.app.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.graphics.toColorInt
import androidx.recyclerview.widget.RecyclerView
import br.ufscar.dc.mobile.app.R
import br.ufscar.dc.mobile.app.model.Category
import kotlinx.android.synthetic.main.category_item.view.*

class CategoryAdapter : RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder>() {
    private var categoryList = emptyList<Category>()
    private var onItemClickListener: CategoryOnClickListener? = null

    class CategoryViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        return CategoryViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.category_item,
                parent,
                false
            )
        )
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        val currentCategory = categoryList[position]
        holder.itemView.apply {
            category_item_button.text = currentCategory.name
            category_item_button.setBackgroundColor(currentCategory.hexColor.toColorInt())
            category_item_button.tag = currentCategory.id
            category_item_button.setOnClickListener {
                onItemClickListener?.onItemClick(currentCategory.id)
            }
        }
    }

    override fun getItemCount(): Int {
        return categoryList.size
    }

    fun setList(categories: List<Category>) {
        categoryList = categories
        notifyDataSetChanged()
    }

    fun setClickListener(listener: CategoryOnClickListener) {
        onItemClickListener = listener
    }
}