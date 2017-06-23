
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import model.Member;
import service.IMemberService;
import service.MemberService;

public class test {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext
				("/WebContent/WEB-INF/rootContext.xml");
		
		IMemberService service = context.getBean("memberService", IMemberService.class);
		
		Member m = new Member();
		
		m.setId("asdf@asdf.com");
		m.setNick("asdf");
		m.setPwd("aaAA11!!");
		
		service.joinSuccess(m);
	}
}
