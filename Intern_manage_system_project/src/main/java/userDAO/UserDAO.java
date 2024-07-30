package userDAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import User.User;

public class UserDAO {
	private static EntityManager em;
	private static EntityManagerFactory emf;
//	private List<User> users = new ArrayList<User>();
	
	public UserDAO(String persistenceName) {
		emf = Persistence.createEntityManagerFactory(persistenceName);
	}
	
	public User findByID(int studentID) {
		User user = null;
		try {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			user = em.find(User.class, studentID);
		}
		catch(Exception ex) {
			System.out.println("Error" + ex.getMessage());
		}finally {
			em.close();
		};
		return user;
	}
	
	public List<User> getUsers() {
		return users;
	}
	
	public void save(User user) {
		users.add(user);
	}
	
	public void delete(int userID) {
		User user = null;
		try {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			user = em.find(User.class, userID);
//			users.remove(user);
			em.remove(user);
			em.getTransaction().commit();
			System.out.println("Delete Success");
		}
		catch(Exception ex) {
			System.out.println("Error" + ex.getMessage());
		}finally {
			em.close();
		};
	}
	
	public void update(User user) {
		User u = null;
		try {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			u = em.find(User.class, u.getID());
			if(u!=null) {
				u.setID(user.getID());
				u.setpassWord(user.getpassWord());
				u.setUserName(user.getUserName());
				u.setRole(user.getRole());
				em.getTransaction().commit();
				System.out.println("Update Success");
			}
		}
		catch(Exception ex) {
			System.out.println("Error" + ex.getMessage());
		}finally {
			em.close();
		};
	}
}
