package by.ulezla.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the element database table.
 * 
 */
@Entity
@NamedQuery(name="Element.findAll", query="SELECT e FROM Element e")
public class Element implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

    @Lob
    private String description;

	private String name;

	//bi-directional many-to-many association to Organization
	@ManyToMany
	@JoinTable(
		name="organization_has_element"
		, joinColumns={
			@JoinColumn(name="element_id")
			}
		, inverseJoinColumns={
			@JoinColumn(name="organization_id")
			}
		)
	private List<Organization> organizations;

	public Element() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

}