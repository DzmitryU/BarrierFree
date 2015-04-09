package by.ulezla.dao;

import by.ulezla.entity.Category;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryDAO extends BaseDAO {
    public List<Category> getCategoryTree() {
        Criteria criteria = getCriteria(Category.class);
        criteria.add(Restrictions.isNull(Category.COL_CATEGORY_ID));
        return criteria.list();
    }
}
