package by.ulezla.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the street database table.
 *
 */
@Entity
@NamedQuery(name="Street.findAll", query="SELECT s FROM Street s")
public class Street implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int id;

    @Lob
    private String name;

    //bi-directional many-to-one association to Address
    @OneToMany(mappedBy="street")
    @Lazy
    @JsonIgnore
    private List<Address> addresses;

    //bi-directional many-to-one association to City
    @ManyToOne
    @Lazy
    @JsonIgnore
    private City city;

    public Street() {
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

    public List<Address> getAddresses() {
        return this.addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public Address addAddress(Address address) {
        getAddresses().add(address);
        address.setStreet(this);

        return address;
    }

    public Address removeAddress(Address address) {
        getAddresses().remove(address);
        address.setStreet(null);

        return address;
    }

    public City getCity() {
        return this.city;
    }

    public void setCity(City city) {
        this.city = city;
    }

}