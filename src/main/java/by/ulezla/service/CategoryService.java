package by.ulezla.service;

import by.ulezla.entity.Category;

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

    public void addOrganizationsToCategory(Category category) {

    }
}
