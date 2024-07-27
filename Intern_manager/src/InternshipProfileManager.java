package InternshipManager;

import java.util.ArrayList;
import java.util.List;

import Intern.Intern;

public class InternshipProfileManager {
	// ThuocTinh
	private List<Intern> InternList;
	 // Setter
    public void setInternList(List<Intern> InternList) {
        this.InternList = InternList;
    }
    
	// Constructor
    public InternshipProfileManager() {
    	this.InternList = new ArrayList<>();
    }
    
    
 // PhuongThuc
    //Them_ThucTapSinh_VaoDanhSach
    public void addIntern(Intern Intern) {
    	InternList.add(Intern);
    }
    
    //XoaThucTapSinh_DuaVaoID
    public void removeIntern(String InternID) {
    	for (int i = 0; i < InternList.size(); i++) {
            if (InternList.get(i).getInternID().equals(InternID)) {
                InternList.remove(i);
                return; // Exit the method after removing
            }
        }
        System.out.println("Không tìm thấy thực tập sinh có ID = " + InternID);
    }
    
    // Tìm_kiếm_thực_tập_sinh_bằngID_và_hiển_thị_thông_tin
    public void findIntern(String InternID) {
        for (Intern Intern : InternList) {
            if (Intern.getInternID().equals(InternID)) {
                System.out.println("Thông tin thực tập sinh có ID = " + InternID + ":");
                System.out.println(Intern.toString()); // Assuming Intern class has toString() method
                return; // Exit the method after finding
            }
        }
        System.out.println("Không tìm thấy thực tập sinh có ID = " + InternID); 
    }
 // Báo_cáo_dữ_liệu_về_các_thực_tập_sinh_trong_danh_sách
    public void generateReport() {
        System.out.println("Báo cáo dữ liệu về các thực tập sinh:");
        for (Intern Intern : InternList) {
            System.out.println(Intern.toString()); // Assuming Intern class has toString() method
        }
    }
    
  
}
