package com.scrummasters.milgols;

/**
 * Created by tiago on 14/10/15.
 */

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.Toast;

import com.scrummasters.milgols.dao.GolDAO;
import com.scrummasters.milgols.model.Gol;

public class InsertFragment extends Fragment implements View.OnClickListener {

    private ImageButton ballImageBtn;
    private View fragmentView;


    public InsertFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        fragmentView = inflater.inflate(R.layout.insert, container, false);
        ballImageBtn = (ImageButton) fragmentView.findViewById(R.id.ball_image_btn);
        ballImageBtn.setOnClickListener(this);
        return fragmentView;
    }

    @Override
    public void onClick(View v) {
        Toast.makeText(fragmentView.getContext(), "Parabéns Artilheiro!!! \n Gol número " + adicionarGol(), Toast.LENGTH_LONG).show();
    }

    public long adicionarGol()
    {
        Gol gol = new Gol();
        gol.setDescricao("Normal");
        GolDAO golDAO = new GolDAO(fragmentView.getContext());
        return  golDAO.save(gol);
    }


}