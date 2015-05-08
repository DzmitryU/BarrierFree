package by.ulezla.dao;

import by.ulezla.entity.Element;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ElementDAO extends BaseDAO {
    public List<Element> getElements() {
        Criteria criteria = getCriteria(Element.class);
        return criteria.list();
    }

    public List<Element> getElements(List<Integer> ids) {
        Criteria criteria = getCriteria(Element.class);
        List<Element> elements = new ArrayList<>();
        if (ids != null) {
            criteria.add(Restrictions.in(Element.COL_ID, ids));
            elements = criteria.list();
        } else {

        }

        return elements;
    }
}
