package spring.jc.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import spring.jc.dto.MemberDto;
import spring.jc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping("/listAll")
	public String listAll(Model model){
		
		try {
			model.addAttribute("list", service.listAll());
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "member/listPage";
		
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpRequestHandlerServlet req, String name, String id,String password ,String Email ,String gender,String addr){
		
		try {
			
			MemberDto dto = new MemberDto();
			dto.setAddr(addr);
			dto.setUserEmail(Email);
			dto.setUserGender(gender);
			dto.setUserID(id);
			dto.setUserName(name);
			dto.setUserPW(password);
			
			service.join(dto);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "home";
		
	}
	
	@RequestMapping(value = "/IdOverlapCheck", method = RequestMethod.GET)
	public String IdOverlapCheck(@RequestParam("id")String id){
		String view = "";
		try {
			
			System.out.println(id);
			int a =  service.idCheck(id);
			System.out.println(a);

			if(a== 0){
				view = "member/canuseid";	
			}else if(a == 1){
				view = "member/cantuseid";	
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return view;
		
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(String id, String password,Boolean loginSave, HttpSession session){
		String view = "";
		System.out.println(loginSave);
		try {
			String idr = service.idSelect(id);
			
			if(idr.equals(id)){
			session.setAttribute("userID", id);
				view = "home";
			}else if(!idr.equals(id)){
				view = "member/loginForm";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return view;
	}
	
	
	
	

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session){
		try {
		session.invalidate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "home";
	}
	
	@RequestMapping("/memberOut")
	public String memberOut(@RequestParam("rowcheck")String[] rowcheck){
		
	
		try {
			for(int i = 0; i < rowcheck.length;i++){
			service.memberOut(rowcheck[i]);
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "home";
	}
	
	@RequestMapping("/joinView")
	public String joinView(){
		
		return "member/joinView";
		
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(){
		
		return "member/loginForm";
		
	}
	
	@RequestMapping("/searchID")
	public String searchID(){
		
		return "member/searchIdForm";
		
	}
	
	@RequestMapping("/searchPW")
	public String searchPW(){
		
		return "member/searchPwForm";
		
	}
}
