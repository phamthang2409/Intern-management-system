package Main;

import java.util.Scanner;

import User.User;
import userDAO.UserDAO;

public class Main {
	public static void main(String[]agrs) {
		System.out.println("===============Menu==============");
		System.out.println("1. Get Students");
		System.out.println("2. Add Students");
		System.out.println("3. Delete Students");
		System.out.println("4. Update Students");
		System.out.println("0. Quit");
		int inputKey = -1;
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("PLs enter number: ");
			inputKey = sc.nextInt();
			UserDAO userDao = new UserDAO("JPAs");
			User user = new User(1, "NgocPhuoc", "123", "admin");
			switch(inputKey) {
			case 0:break;
			case 1:
				userDao.getUsers();
				break;
			case 2:
				userDao.save(user);
				break;
			case 3:
				userDao.delete(1);
				break;
			case 4:
				user = new User(2, "HuyHoang", "1234", "user");
				userDao.update(user);
				break;
			default:
				System.out.println("PLs choice menu:");
		}
		}
	}
 }
