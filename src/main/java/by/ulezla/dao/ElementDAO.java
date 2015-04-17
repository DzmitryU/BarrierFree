package by.ulezla.dao;

import by.ulezla.entity.Element;
import org.hibernate.Criteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ElementDAO extends BaseDAO {
    public List<Element> getElements() {
        Criteria criteria = getCriteria(Element.class);
        return criteria.list();
    }
}
