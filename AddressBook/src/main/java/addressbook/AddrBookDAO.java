package addressbook;

import java.util.ArrayList;
import java.util.List;

//자료 추가, 수정, 삭제, 검색할 클래스(메서드 사용)
public class AddrBookDAO {
   //자료 구조 - ArrayList
   private List<Addrbook> addrList = new ArrayList<>();
   
   //주소 추가(저장)
   public void addAddrBook(Addrbook addrbook) {
      addrList.add(addrbook);
   }
   
   //주소 목록(전체) 보기
   public List<Addrbook> getListAll() {
      return addrList;
   }
   //특정 주소 보기
   public Addrbook getAddrBook(String username) {
	   Addrbook addrBook =null;
	   for(int i =0; i<addrList.size(); i++) {
		   //메모리에 이미 추가된 이름을 가져와서
		 String dbUsername = addrList.get(i).getUsername();
		   //외부에 입력된 이름과 비교하여 일치하면 객체를 반환한다.
		 if(dbUsername.equals(username)) {
			 addrBook = addrList.get(i);
		 }
	   }
	   
	   
	   return addrBook;
   }
   
   //주소 삭제
   public void deleteAddrBook(String username) {
	   for(int i =0; i<addrList.size(); i++) {
		   //메모리에 이미 추가된 이름을 가져와서
		 String dbUsername = addrList.get(i).getUsername();
		   //외부에 입력된 이름과 비교하여 일치하면 객체를 반환한다.
		 if(dbUsername.equals(username)) {
			 addrList.remove(i);
		 }
	   }
   }
}