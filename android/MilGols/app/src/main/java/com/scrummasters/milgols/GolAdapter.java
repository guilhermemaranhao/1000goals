package com.scrummasters.milgols;

/**
 * Created by asus on 02/11/2015.
 */

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.scrummasters.milgols.model.Gol;
import java.util.ArrayList;

public class GolAdapter extends ArrayAdapter<Gol> {

    // declaring our ArrayList of items
    private ArrayList<Gol> objects;
    private int currentItemId;
    private int primaryIntColor;

    /* here we must override the constructor for ArrayAdapter
    * the only variable we care about now is ArrayList<Item> objects,
    * because it is the list of objects we want to display.
    */
    public GolAdapter(Context context, int textViewResourceId, ArrayList<Gol> objects)
    {
        super(context, textViewResourceId, objects);
        this.objects = objects;
    }

    /*
     * we are overriding the getView method here - this is what defines how each
     * list item will look.
     */
    public View getView(int position, View convertView, ViewGroup parent){

        // assign the view we are converting to a local variable
        View v = convertView;

        // first check to see if the view is null. if so, we have to inflate it.
        // to inflate it basically means to render, or show, the view.
        if (v == null) {
            LayoutInflater inflater = (LayoutInflater) getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            v = inflater.inflate(R.layout.gol_item_list, null);
        }

		/*
		 * Recall that the variable position is sent in as an argument to this method.
		 * The variable simply refers to the position of the current object in the list. (The ArrayAdapter
		 * iterates through the list we sent it)
		 *
		 * Therefore, i refers to the current Item object.
		 */
        Gol gol = objects.get(position);

        if (gol != null) {

            // This is how you obtain a reference to the TextViews.
            // These TextViews are created in the XML files we defined.

            TextView descriptionTv = (TextView) v.findViewById(R.id.description);
            TextView name = (TextView) v.findViewById(R.id.name);
            View currentMark = v.findViewById(R.id.mark);
            // check to see if each individual textview is null.
            // if not, assign some text!
            if (descriptionTv != null){
                descriptionTv.setText(gol.getDescricao() );
            }
            if (name != null){
                name.setText( gol.getDescricao() );
            }

            if( currentItemId == gol.hashCode() )
            {
                currentMark.setBackgroundColor(  primaryIntColor );
            }else{
                currentMark.setBackgroundColor(Color.WHITE);
            }
        }

        // the view must be returned to our activity
        return v;

    }

    public int getCurrentItemId() {
        return currentItemId;
    }

    public void setCurrentItemId(int currentItemId) {
        this.currentItemId = currentItemId;
    }

    public int getPrimaryIntColor() {
        return primaryIntColor;
    }

    public void setPrimaryIntColor(int primaryIntColor) {
        this.primaryIntColor = primaryIntColor;
    }


}