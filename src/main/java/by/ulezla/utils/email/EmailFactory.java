package by.ulezla.utils.email;

public class EmailFactory {
	
	public static EmailAccount getPromo() {
		EmailAccount emailAccount = new EmailAccount();
		emailAccount.setEMAIL("bfree-grodno@yandex.ru");
		emailAccount.setLOGIN("bfree-grodno@yandex.ru");
		emailAccount.setPASSWORD("123456aA");
		emailAccount.setSERVER("smtp.yandex.com");
		emailAccount.setSMTPPORT("587");
		return emailAccount;
	}
}
