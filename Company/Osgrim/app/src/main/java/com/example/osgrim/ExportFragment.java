package com.example.osgrim;


import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.example.osgrim.data.Report;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;


/**
 * A simple {@link Fragment} subclass.
 */
public class ExportFragment extends Fragment {

	private View exportView;
	private MainActivity mainAct;

	public ExportFragment() {
		// Required empty public constructor
	}


	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
							 Bundle savedInstanceState) {
		// Inflate the layout for this fragment
		exportView = inflater.inflate(R.layout.fragment_export, container, false);
		mainAct = (MainActivity) getActivity();

		TextView tvInstructions = exportView.findViewById(R.id.tvInstructions);
		Button btnImport = exportView.findViewById(R.id.btnImport);
		Button btnExport = exportView.findViewById(R.id.btnExport);

		tvInstructions.setText(mainAct.messages.get("instructions"));
		btnImport.setText(mainAct.messages.get("importData"));
		btnExport.setText(mainAct.messages.get("exportData"));

		btnImport.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View view) {
				importData();
			}
		});

		btnExport.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View view) {
				exportData();
			}
		});

		return exportView;
	}

	private void importData() {
		mainAct.getData();
		mainAct.getLabels();
	}

	private void exportData() {
		JSONArray reportArray = new JSONArray();

		try {
			for (Report report : mainAct.reports)
				reportArray.put(report.getJSONReport());
		} catch (JSONException e) {
			e.printStackTrace();
		}

		try {
			File file = new File(mainAct.getFilesDir() + "/data_export.json");
			Writer output = new BufferedWriter(new FileWriter(file));
			output.write(reportArray.toString());
			output.close();
			Toast.makeText(mainAct, "Export to " + file.getAbsolutePath(), Toast.LENGTH_LONG).show();
			Log.d("blbl", file.getAbsolutePath());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
