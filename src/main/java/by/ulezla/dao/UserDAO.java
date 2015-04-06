package by.ulezla.dao;

import by.ulezla.entity.User;
import by.ulezla.exception.RegistrationException;
import by.ulezla.utils.email.EmailManager;
import org.hibernate.Criteria;
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

    public User getUserFromEmail(String email) {
        try {
            Criteria criteria = getCriteria(User.class);
            criteria.add(Restrictions.like("email", email));
            return (User) criteria.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new User();
        }
    }

    public String sendRestorePasswordLink(String email) {
        User user = getUserFromEmail(email);
        if (user != null) {
            EmailManager.send(email, "Восстановление пароля",
                    "Перейдите по ссылке для восстановления пароля. "
                            + "http://localhost:18080/bfree/setnewpassword?userId=" + email);
            //EmailSender.sendEmail(email);
            return "Пароль выслан Вам на емеил";
        } else {
            return "Пользователя с данным емеилом не существует.";
        }
    }

    public String updatePassword(String email, String passwordOld, String passwordNew) {
        User user = getUserFromEmail(email);
        if (passwordOld.contentEquals(user.getPassword())) {
            user.setPassword(passwordNew);
            saveOrUpdate(user);
            return "Пароль изменён";
        } else {
            return "Старый пароль не верен";
        }

    }
}
