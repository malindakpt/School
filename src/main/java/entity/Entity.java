package entity;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/9/2017.
 */
@MappedSuperclass
public class Entity  implements java.io.Serializable {
    private int id;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
