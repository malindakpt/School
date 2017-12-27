package entityManager;

import java.util.List;

/**
 * Created by MalindaK on 12/27/2017.
 */
public class AnalizedEntity{
    private String name;
    private String value;

    public AnalizedEntity(String name, String value){
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
