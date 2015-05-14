package by.ulezla.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the country database table.
 *
 */
@Entity
@NamedQuery(name="Country.findAll", query="SELECT c FROM Country c")
public class Country implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int id;

    private String name;

    //bi-directional many-to-one association to Region
    @OneToMany(mappedBy="country")
    private List<Region> regions;

    public Country() {
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

    public List<Region> getRegions() {
        return this.regions;
    }

    public void setRegions(List<Region> regions) {
        this.regions = regions;
    }

    public Region addRegion(Region region) {
        getRegions().add(region);
        region.setCountry(this);

        return region;
    }

    public Region removeRegion(Region region) {
        getRegions().remove(region);
        region.setCountry(null);

        return region;
    }

}