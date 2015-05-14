package by.ulezla.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the region database table.
 *
 */
@Entity
@NamedQuery(name="Region.findAll", query="SELECT r FROM Region r")
public class Region implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int id;

    private String name;

    //bi-directional many-to-one association to City
    @OneToMany(mappedBy="region")
    private List<City> cities;

    //bi-directional many-to-one association to Country
    @ManyToOne
    @Lazy
    @JsonIgnore
    private Country country;

    public Region() {
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

    public List<City> getCities() {
        return this.cities;
    }

    public void setCities(List<City> cities) {
        this.cities = cities;
    }

    public City addCity(City city) {
        getCities().add(city);
        city.setRegion(this);

        return city;
    }

    public City removeCity(City city) {
        getCities().remove(city);
        city.setRegion(null);

        return city;
    }

    public Country getCountry() {
        return this.country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

}