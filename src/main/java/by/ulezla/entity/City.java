package by.ulezla.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the city database table.
 *
 */
@Entity
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int id;

    private String name;

    //bi-directional many-to-one association to Region
    @ManyToOne
    @Lazy
    @JsonIgnore
    private Region region;

    //bi-directional many-to-one association to Street
    @OneToMany(mappedBy="city")
    private List<Street> streets;

    public City() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Region getRegion() {
        return this.region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public List<Street> getStreets() {
        return this.streets;
    }

    public void setStreets(List<Street> streets) {
        this.streets = streets;
    }

    public Street addStreet(Street street) {
        getStreets().add(street);
        street.setCity(this);

        return street;
    }

    public Street removeStreet(Street street) {
        getStreets().remove(street);
        street.setCity(null);

        return street;
    }

}