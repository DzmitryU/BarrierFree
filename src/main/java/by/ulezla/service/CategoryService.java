package by.ulezla.service;

import by.ulezla.entity.Category;
import by.ulezla.entity.Organization;
import by.ulezla.exception.HTreeBuildingException;
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

    public <T> HTreeItem buildHTreeObject(T object) throws HTreeBuildingException {
        HTreeItem hTreeItem = null;
        if (object.getClass().equals(Category.class)) {
            Category category = (Category) object;
            hTreeItem = new HTreeItem(category.getName(), category.getClass().toString());
        } else if  (object.getClass().equals(Organization.class)) {
            Organization organization = (Organization) object;
            hTreeItem = new HTreeItem(organization.getName(), organization.getClass().toString());
        } else {
            throw new HTreeBuildingException(object.getClass() + ", " + object.toString());
        }
        return hTreeItem;
    }

    public <T>List<HTreeItem> buildHTreeList(List<T> objects) throws HTreeBuildingException {
        List<HTreeItem> hTreeItems = new ArrayList<>();
        for (T object : objects) {
            hTreeItems.add(buildHTreeObject(object));
        }
        return hTreeItems;
    }
}
