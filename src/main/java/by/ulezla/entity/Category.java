package by.ulezla.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the category database table.
 *
 */
@Entity
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
    public static final String COL_CATEGORY_ID = "category";
    public static final String COL_ID = "id";

    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String image;

    @JsonProperty(value="text")
	private String name;

	//bi-directional many-to-one association to Category
	@ManyToOne(fetch=FetchType.LAZY)
    @Lazy
    @JsonIgnore
	private Category category;

	//bi-directional many-to-one association to Category
	@OneToMany(mappedBy="category")
    @Lazy
    @JsonProperty(value="children")
	private List<Category> categories;

	//bi-directional many-to-one association to Organization
	@OneToMany(mappedBy="category")
    @Lazy
    @JsonIgnore
	private List<Organization> organizations;

	public Category() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Category addCategory(Category category) {
		getCategories().add(category);
		category.setCategory(this);

		return category;
	}

	public Category removeCategory(Category category) {
		getCategories().remove(category);
		category.setCategory(null);

		return category;
	}

	public List<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public Organization addOrganization(Organization organization) {
		getOrganizations().add(organization);
		organization.setCategory(this);

		return organization;
	}

	public Organization removeOrganization(Organization organization) {
		getOrganizations().remove(organization);
		organization.setCategory(null);

		return organization;
	}

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", categories=" + categories +
                ", organizations=" + organizations +
                '}';
    }
}