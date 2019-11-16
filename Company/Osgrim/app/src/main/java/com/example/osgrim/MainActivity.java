package com.example.osgrim;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.ViewPager;

import android.os.Bundle;

import com.example.osgrim.data.Building;
import com.example.osgrim.data.Canton;
import com.example.osgrim.data.Detail;
import com.example.osgrim.data.Frequency;
import com.example.osgrim.data.Incident;
import com.example.osgrim.data.Level;
import com.example.osgrim.data.Material;
import com.example.osgrim.data.Nature;
import com.example.osgrim.data.Report;
import com.example.osgrim.data.Service;
import com.example.osgrim.data.ServiceCat;
import com.example.osgrim.data.Space;
import com.example.osgrim.data.SpaceCat;
import com.example.osgrim.data.Team;
import com.example.osgrim.data.User;
import com.example.osgrim.data.Zone;
import com.google.android.material.tabs.TabLayout;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    protected List<Team> teams;
    protected List<User> users;
    protected List<Zone> zones;
    protected List<Building> buildings;
    protected List<Level> levels;
    protected List<Canton> cantons;
    protected List<SpaceCat> spaceCats;
    protected List<Space> spaces;
    protected List<Nature> natures;
    protected List<Frequency> frequencies;
    protected List<Material> materials;
    protected List<ServiceCat> serviceCats;
    protected List<Service> services;
    protected List<Incident> incidents;
    protected List<Detail> details;
    protected Map<String, String> messages;
    protected Map<String, String> labels;
    protected List<Report> reports;
    protected ReportAdapter reportAdapter;
    protected TabLayout tabLayout;
    protected RecyclerView listReports;
    protected BooleanVariable needClear;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initializeLists();

        getData();
        getMessages();

        tabLayout = findViewById(R.id.tablayout);
        needClear = new BooleanVariable();
        ViewPager viewPager = findViewById(R.id.viewPager);

        PageAdapter pageAdapter = new PageAdapter(getSupportFragmentManager(), tabLayout.getTabCount());
        viewPager.setAdapter(pageAdapter);
        viewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));

        tabLayout.setupWithViewPager(viewPager);
        String[] titleTabs = { messages.get("reportList"), messages.get("inputReport"), messages.get("dataManagement") };

        for (int i = 0; i < tabLayout.getTabCount(); i++)
            tabLayout.getTabAt(i).setText(titleTabs[i]);

        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setLogo(R.drawable.logo_osgrim);
        getSupportActionBar().setDisplayUseLogoEnabled(true);
    }

    protected void changeTab(int numberTab) {
        tabLayout.getTabAt(numberTab).select();
    }

    protected void initializeLists() {
        this.users = new ArrayList<>();
        this.teams = new ArrayList<>();
        this.levels = new ArrayList<>();
        this.buildings = new ArrayList<>();
        this.zones = new ArrayList<>();
        this.cantons = new ArrayList<>();
        this.spaceCats = new ArrayList<>();
        this.spaces = new ArrayList<>();
        this.natures = new ArrayList<>();
        this.frequencies = new ArrayList<>();
        this.materials = new ArrayList<>();
        this.serviceCats = new ArrayList<>();
        this.services = new ArrayList<>();
        this.incidents = new ArrayList<>();
        this.details = new ArrayList<>();

        this.reports = new ArrayList<>();
    }

    protected boolean getData() {
        try {
            // Get the principal JSON object
            JSONObject jObj = new JSONObject(readJSONFromAsset("data_transfer.json"));

            // Get the users and fill the users list
            JSONArray users = jObj.getJSONArray("users");
            for (int i = 0; i < users.length(); i++) {
                JSONObject user = users.getJSONObject(i);
                this.users.add(new User(user.getInt("id"), user.getString("lastname"), user.getString("firstname")));
            }

            // Get the teams and fill the teams list
            JSONArray teams = jObj.getJSONArray("teams");
            for (int i = 0; i < teams.length(); i++) {
                JSONObject team = teams.getJSONObject(i);
                Team newTeam = new Team(team.getInt("id"), team.getString("name"));
                JSONArray usersId = team.getJSONArray("members");

                for (int j = 0; j < usersId.length(); j++) {
                    for (User usr : this.users) {
                        if (usr.getId() == usersId.getInt(j)) {
                            newTeam.addMember(usr);
                            break;
                        }
                    }
                }

                this.teams.add(newTeam);
            }

            // Get the address
            // Get the levels
            JSONObject address = jObj.getJSONObject("address");
            JSONArray levels = address.getJSONArray("level");

            for (int i = 0; i < levels.length(); i++) {
                JSONObject level = levels.getJSONObject(i);
                this.levels.add(new Level(level.getInt("id"), level.getString("name")));
            }

            // Get the buildings
            JSONArray buildings = address.getJSONArray("building");
            for (int i = 0; i < buildings.length(); i++) {
                JSONObject building = buildings.getJSONObject(i);
                Building newBuilding = new Building(building.getInt("id"), building.getString("name"));
                JSONArray levelsId = building.getJSONArray("levels");

                for (int j = 0; j < levelsId.length(); j++) {
                    for (Level lvl : this.levels) {
                        if (lvl.getId() == levelsId.getInt(j)) {
                            newBuilding.addLevel(lvl);
                            break;
                        }
                    }
                }

                this.buildings.add(newBuilding);
            }

            // Get the zones
            JSONArray zones = address.getJSONArray("zone");
            for (int i = 0; i < zones.length(); i++) {
                JSONObject zone = zones.getJSONObject(i);
                Zone newZone = new Zone(zone.getInt("id"), zone.getString("name"));
                JSONArray buildingsId = zone.getJSONArray("buildings");

                for (int j = 0; j < buildingsId.length(); j++) {
                    for (Building bld : this.buildings) {
                        if (bld.getId() == buildingsId.getInt(j)) {
                            newZone.addBuilding(bld);
                            break;
                        }
                    }
                }

                this.zones.add(newZone);
            }

            // Get the cantons
            JSONArray cantons = address.getJSONArray("canton");
            for (int i = 0; i < cantons.length(); i++) {
                JSONObject canton = cantons.getJSONObject(i);
                this.cantons.add(new Canton(canton.getInt("id"), canton.getString("name")));
            }

            // Get the spaces
            JSONArray spaces = address.getJSONArray("space");
            for (int i = 0; i < spaces.length(); i++) {
                JSONObject space = spaces.getJSONObject(i);
                this.spaces.add(new Space(space.getInt("id"), space.getString("name")));
            }

            // Get the spaceCats
            JSONArray spaceCats = address.getJSONArray("spaceCat");
            for (int i = 0; i < spaceCats.length(); i++) {
                JSONObject spaceCat = spaceCats.getJSONObject(i);
                SpaceCat newSpaceCat = new SpaceCat(spaceCat.getInt("id"), spaceCat.getString("name"));
                JSONArray spacesId = spaceCat.getJSONArray("spaces");

                for (int j = 0; j < spacesId.length(); j++) {
                    for (Space spc : this.spaces) {
                        if (spc.getId() == spacesId.getInt(j)) {
                            newSpaceCat.addSpace(spc);
                            break;
                        }
                    }
                }

                this.spaceCats.add(newSpaceCat);
            }

            // Get the maintenance
            JSONObject maintenance = jObj.getJSONObject("maintenance");

            // Get the nature operation
            JSONArray natures = maintenance.getJSONArray("nature");
            for (int i = 0; i < natures.length(); i++) {
                JSONObject nature = natures.getJSONObject(i);
                this.natures.add(new Nature(nature.getInt("id"), nature.getString("name")));
            }

            // Get the frequency
            JSONArray frequencies = maintenance.getJSONArray("frequency");
            for (int i = 0; i < frequencies.length(); i++) {
                JSONObject frequency = frequencies.getJSONObject(i);
                this.frequencies.add(new Frequency(frequency.getInt("id"), frequency.getString("name")));
            }

            // Get the incidents
            JSONArray incidents = jObj.getJSONArray("incident");
            for (int i = 0; i < incidents.length(); i++) {
                JSONObject incident = incidents.getJSONObject(i);
                this.incidents.add(new Incident(incident.getInt("id"), incident.getString("name")));
            }

            // Get the material
            JSONArray materials = maintenance.getJSONArray("material");
            for (int i = 0; i < materials.length(); i++) {
                JSONObject material = materials.getJSONObject(i);
                Material newMaterial = new Material(material.getInt("id"), material.getString("name"));
                JSONArray incidentsId = material.getJSONArray("incidents");

                for (int j = 0; j < incidentsId.length(); j++) {
                    for (Incident icd : this.incidents) {
                        if (icd.getId() == incidentsId.getInt(j)) {
                            newMaterial.addIncident(icd);
                            break;
                        }
                    }
                }

                this.materials.add(newMaterial);
            }

            // Get the categories of service
            JSONArray serviceCats = jObj.getJSONArray("serviceCat");
            for (int i = 0; i < serviceCats.length(); i++) {
                JSONObject serviceCat = serviceCats.getJSONObject(i);
                ServiceCat newServiceCat = new ServiceCat(serviceCat.getInt("id"), serviceCat.getString("name"));
                JSONArray services = serviceCat.getJSONArray("content");

                for (int j = 0; j < services.length(); j++) {
                    JSONObject jsonService = services.getJSONObject(j);
                    Service service = new Service(jsonService.getInt("id"), jsonService.getString("name"));
                    this.services.add(service);
                    newServiceCat.addService(service);
                }

                this.serviceCats.add(newServiceCat);
            }

            // Get the details
            JSONArray details = jObj.getJSONArray("details");
            for (int i = 0; i < details.length(); i++) {
                JSONObject detail = details.getJSONObject(i);
                Detail newDetail = new Detail(detail.getString("title"));
                JSONArray answers = detail.getJSONArray("answers");

                for (int j = 0; j < answers.length(); j++)
                    newDetail.addAnswer(answers.getString(j));

                this.details.add(newDetail);
            }

        } catch (JSONException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    private void getMessages() {
        this.messages = new HashMap<>();
        try {
            JSONObject jObj = new JSONObject(readJSONFromAsset("messages.json"));
            this.messages.put("error", jObj.getString("error"));
            this.messages.put("natureMissing", jObj.getString("natureMissing"));
            this.messages.put("dateMissing", jObj.getString("dateMissing"));
            this.messages.put("timeMissing", jObj.getString("timeMissing"));
            this.messages.put("incoherent", jObj.getString("incoherent"));
            this.messages.put("cancel", jObj.getString("cancel"));
            this.messages.put("ok", jObj.getString("ok"));
            this.messages.put("nbIncident", jObj.getString("nbIncident"));
            this.messages.put("titleNbIncident", jObj.getString("titleNbIncident"));
			this.messages.put("clear", jObj.getString("clear"));
            this.messages.put("confirmErase", jObj.getString("confirmErase"));
            this.messages.put("clearComplete", jObj.getString("clearComplete"));
            this.messages.put("saveComplete", jObj.getString("saveComplete"));
            this.messages.put("reportList", jObj.getString("reportList"));
            this.messages.put("inputReport", jObj.getString("inputReport"));
            this.messages.put("dataManagement", jObj.getString("dataManagement"));
            this.messages.put("enterStartDate", jObj.getString("enterStartDate"));
            this.messages.put("enterStartTime", jObj.getString("enterStartTime"));
            this.messages.put("yes", jObj.getString("yes"));
            this.messages.put("no", jObj.getString("no"));
            this.messages.put("editReport", jObj.getString("editReport"));
            this.messages.put("confirmDelete", jObj.getString("confirmDelete"));
            this.messages.put("deleted", jObj.getString("deleted"));
            this.messages.put("instructions", jObj.getString("instructions"));
            this.messages.put("importData", jObj.getString("importData"));
            this.messages.put("exportData", jObj.getString("exportData"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    protected void getLabels() {
        this.labels = new HashMap<>();
        try {
            JSONObject jObj = new JSONObject(readJSONFromAsset("label.json"));
            this.labels.put("team", jObj.getString("team"));
            this.labels.put("user", jObj.getString("user"));
            this.labels.put("address", jObj.getString("address"));
            this.labels.put("zone", jObj.getString("zone"));
            this.labels.put("building", jObj.getString("building"));
            this.labels.put("level", jObj.getString("level"));
            this.labels.put("canton", jObj.getString("canton"));
            this.labels.put("pillar", jObj.getString("pillar"));
            this.labels.put("spaceCat", jObj.getString("spaceCat"));
            this.labels.put("space", jObj.getString("space"));
            this.labels.put("maintenance", jObj.getString("maintenance"));
            this.labels.put("nature", jObj.getString("nature"));
            this.labels.put("frequency", jObj.getString("frequency"));
            this.labels.put("material", jObj.getString("material"));
            this.labels.put("code", jObj.getString("code"));
            this.labels.put("startDate", jObj.getString("startDate"));
            this.labels.put("endDate", jObj.getString("endDate"));
            this.labels.put("services", jObj.getString("services"));
            this.labels.put("teams", jObj.getString("teams"));
            this.labels.put("participant", jObj.getString("participant"));
            this.labels.put("participants", jObj.getString("participants"));
            this.labels.put("incident", jObj.getString("incident"));
            this.labels.put("comment", jObj.getString("comment"));
            this.labels.put("details", jObj.getString("details"));
            this.labels.put("save", jObj.getString("save"));
            this.labels.put("draft", jObj.getString("draft"));
            this.labels.put("cancel", jObj.getString("cancel"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    protected String readJSONFromAsset(String name) {
        String json = null;
        try {
            InputStream is = getAssets().open(name);
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, StandardCharsets.UTF_8);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return json;
    }
}
