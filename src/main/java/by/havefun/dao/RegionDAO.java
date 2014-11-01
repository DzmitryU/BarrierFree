package by.havefun.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.havefun.domain.Region;

@Service
@Transactional
public class RegionDAO {

	@Autowired
	BaseDAO baseDAO;
	
	public List<Region> getRegions() {
	    return baseDAO.getListEntity(Region.class);
    }
}