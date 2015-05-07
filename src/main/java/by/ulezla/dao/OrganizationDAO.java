package by.ulezla.dao;

import by.ulezla.entity.Category;
import by.ulezla.entity.Element;
import by.ulezla.entity.Organization;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class OrganizationDAO extends BaseDAO {
    public List<Organization> getOrganizationByCategory(Category category) {
        Criteria criteria = getCriteria(Organization.class);
        criteria.add(Restrictions.eq(Organization.COL_CATEGORY_ID, category));
        return criteria.list();
    }

    public List<Organization> filterOrganizations(Category category, List<Element> elements) {
        Criteria criteria = getCriteria(Organization.class);
        if (category != null) {
            criteria.add(Restrictions.eq(Organization.COL_CATEGORY_ID, category));
        }

        List<Organization> preselectedOrganizations = criteria.list();
        List<Organization> resultOrganizations = new ArrayList<>();
        for (Organization organization : preselectedOrganizations) {
            List<Element> elementsResult = elements;
            elementsResult.retainAll(organization.getElements());
            if (elementsResult.size() > 0) {
                resultOrganizations.add(organization);
            }
        }

        return resultOrganizations;
    }
}
