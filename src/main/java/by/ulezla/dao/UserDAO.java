package by.ulezla.dao;

import by.ulezla.entity.User;
import by.ulezla.exception.RegistrationException;
import by.ulezla.utils.email.EmailManager;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserDAO extends BaseDAO {
    public String registerUser(String email, String firstname,
                               String lastname, String password) throws RegistrationException {

        User user = null;
        if (getEntitys(User.class, Restrictions.eq(User.COL_EMAIL, email)).size() > 0) {
            throw new RegistrationException("Данный емеил уже имеет аккуант.");
        }

        user = new User(email,  firstname, lastname, password);
        saveOrUpdate(user);

        EmailManager.send(email, "Успешная регистрация","Спасибо, что зарегистрировались на нашем сайте");
        return "Пользователь успешно зарегистрировался";
    }
}
