package User;

public class Trainer extends User {
	 public Trainer(int ID, String userName, String passWord, String role) {
		super(ID, userName, passWord, role);
		// TODO Auto-generated constructor stub
	}

	public void createTrainingProgram() {
	        System.out.println("Creating a new training program...");
	    }

	    public void manageTrainee() {
	        System.out.println("Managing trainees...");
	    }

	    public void assignTask() {
	        System.out.println("Assigning tasks to trainees...");
	    }

	    public void evaluateTrainee() {
	        System.out.println("Evaluating trainees...");
	    }

	    public void provideFeedback() {
	        System.out.println("Providing feedback to trainees...");
	    }
}
