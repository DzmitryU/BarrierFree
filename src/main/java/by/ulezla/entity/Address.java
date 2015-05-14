package by.ulezla.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the coordinate database table.
 * 
 */
@Entity
@NamedQuery(name="Coordinate.findAll", query="SELECT c FROM Address c")
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

    private Integer house;

    @JsonProperty(value="lat")
	private double x;

    @JsonProperty(value="lng")
	private double y;

	//bi-directional many-to-one association to Organization
	@OneToMany(mappedBy="address")
    @Lazy
    @JsonIgnore
	private List<Organization> organizations;

    //bi-directional many-to-one association to Street
    @ManyToOne
    @Lazy
    @JsonIgnore
    private Street street;

	public Address() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getX() {
		return this.x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return this.y;
	}

	public void setY(double y) {
		this.y = y;
	}

    public Street getStreet() {
        return this.street;
    }

    public void setStreet(Street street) {
        this.street = street;
    }

	public List<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public Organization addOrganization(Organization organization) {
		getOrganizations().add(organization);
		organization.setAddress(this);

		return organization;
	}

	public Organization removeOrganization(Organization organization) {
		getOrganizations().remove(organization);
		organization.setAddress(null);

		return organization;
	}

}