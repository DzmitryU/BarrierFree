package by.ulezla.security;

import java.util.ArrayList;
import java.util.Collection;

import by.ulezla.entity.User;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import by.ulezla.dao.BaseDAO;

@Transactional
public class MyUserDetails implements UserDetailsService {

    @Autowired
    BaseDAO baseDAO;

    Logger logger = LoggerFactory.getLogger(getClass().getName());

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        User user = baseDAO.getEntity(User.class, Restrictions.eq(User.COL_EMAIL,email));
        if (user == null) {
            throw new UsernameNotFoundException("User not found.");
        }

        boolean enabled = !(user.getRole().getRole().contains("BAN"));
        boolean credentialsNonExpired = true;
        boolean accountNonExpired = true;
        boolean accountNonLocked = true;

        logger.info(email);

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        authorities.add(new SimpleGrantedAuthority(user.getRole().getRole()));

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

}