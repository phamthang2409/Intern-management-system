package userDAO;

import java.util.List;
import java.util.Optional;

public interface Dao<T> {
	Optional<T> get(long ID);
	List<T> getAll();
	void save(T t);
	void update(T t, String[] prams);
	void delete(T t);
	
}
