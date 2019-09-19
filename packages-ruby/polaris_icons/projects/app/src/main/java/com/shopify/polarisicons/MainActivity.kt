package com.shopify.polarisicons

import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.graphics.drawable.Drawable
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.LinearLayout
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        gridview.adapter = ResourcesAdapter(this, polarisIconsDrawables())
    }

    private fun polarisIconsDrawables(): ArrayList<Drawable> {
        var drawables = R.drawable::class.java!!.getFields()
        val drawableResources = ArrayList<Drawable>()
        for (field in drawables) {
            if (field.getName().contains("polaris_icon_", true)) {
                drawableResources.add(resources.getDrawable(field.getInt(null)))
            }
        }
        return drawableResources
    }
}

class ResourcesAdapter : BaseAdapter {
    var resources = ArrayList<Drawable>()
    var context: Context? = null

    constructor(context: Context, resources: ArrayList<Drawable>) : super() {
        this.context = context
        this.resources = resources
    }

    override fun getCount(): Int {
        return resources.size
    }

    override fun getItem(position: Int): Any {
        return resources[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
        val drawable = this.resources[position]
        val imageView = ImageView(context)
        imageView.layoutParams = LinearLayout.LayoutParams(160, 160) // value is in pixels
        imageView.setImageDrawable(drawable)
        return imageView
    }
}