package by.ulezla.service;

import by.ulezla.entity.Category;
import by.ulezla.entity.Organization;
import by.ulezla.utils.view.HTreeItem;

import java.util.ArrayList;
import java.util.List;

public class CategoryService extends AbstractService {
    public void initialize(Category category) {
        category.toString();
        initialize(category.getCategories());
    }
    public void initialize(List<Category> categories) {
        for (Category category : categories) {
            initialize(category);
        }
    }

    public HTreeItem buildHTreeObject(Organization organization) {
        return new HTreeItem(organization.getName(), Organization.class.toString());
    }

    public HTreeItem buildHTreeObject(Category category) {
        HTreeItem hTreeItem = hTreeItem = new HTreeItem(category.getName(), Category.class.toString());
        hTreeItem.addChildren(buildHTreeListFromCategories(category.getCategories()));
        hTreeItem.addChildren(buildHTreeListFromOrganization(category.getOrganizations()));

        return hTreeItem;
    }

    public List<HTreeItem> buildHTreeListFromOrganization(List<Organization> organizations) {
        List<HTreeItem> hTreeItems = new ArrayList<>();
        for (Organization organization : organizations) {
            hTreeItems.add(buildHTreeObject(organization));
        }
        return hTreeItems;
    }

    public List<HTreeItem> buildHTreeListFromCategories(List<Category> categories) {
        List<HTreeItem> hTreeItems = new ArrayList<>();
        for (Category category : categories) {
            hTreeItems.add(buildHTreeObject(category));
        }
        return hTreeItems;
    }
}
