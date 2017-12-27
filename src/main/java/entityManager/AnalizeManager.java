package entityManager;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by MalindaK on 12/27/2017.
 */
public class AnalizeManager {

    public List<AnalizedEntity> getTopMarkers(String grade){
        List<AnalizedEntity> analizedEntityList = new ArrayList<AnalizedEntity>();
        analizedEntityList.add(new AnalizedEntity("Malinda Kumarasinghe" +"  ( Grade "+grade+" D )", "98%"));
        analizedEntityList.add(new AnalizedEntity("Supun Hettihewa", "92%"));
        analizedEntityList.add(new AnalizedEntity("Gayan Madushanka", "87%"));

        return analizedEntityList;
    }
}
