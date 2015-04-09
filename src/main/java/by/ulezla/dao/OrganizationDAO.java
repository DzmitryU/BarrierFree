package by.ulezla.dao;

import by.ulezla.entity.Category;
import by.ulezla.entity.Organization;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrganizationDAO extends BaseDAO {
    public List<Organization> getOrganizationByCategory(Category category) {
        Criteria criteria = getCriteria(Organization.class);
        criteria.add(Restrictions.eq(Organization.COL_CATEGORY_ID, category));
        return criteria.list();
    }
}
