package spring.jc.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.jc.dto.MemberDto;
import spring.jc.service.MemberService;

@RestController
@RequestMapping("/testjc")
public class SearchInfoController {
	
	@Inject
	private MemberService svc;
	
	@RequestMapping(value="" , method=RequestMethod.POST)
	public ResponseEntity<String> test(@RequestBody MemberDto dto){
		ResponseEntity<String> entity = null;
		try {
			svc.join(dto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);

		}
		
		return entity;
	}
	
	@RequestMapping(value="/all",method=RequestMethod.GET)
	public ResponseEntity<List<MemberDto>> list(){
		ResponseEntity<List<MemberDto>> entity = null;
		try {
			
			entity = new ResponseEntity<>( svc.listAll() ,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		
		return entity;
	}
	
	@RequestMapping(value="/list/{userid}",method=RequestMethod.GET)
	public ResponseEntity<String> selectID(@PathVariable("userid") String userid){
		ResponseEntity<String> entity = null;
		try {
			
			entity = new ResponseEntity<String>( svc.idSelect(userid) ,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		
		return entity;
	}
	
	@RequestMapping(value="/searchID/{name}/{email}",method=RequestMethod.GET)
	public ResponseEntity<MemberDto> searcgID(@PathVariable("name") String userName, @PathVariable("email") String userEmail){
		ResponseEntity<MemberDto> entity = null;
		try {
			System.out.println(userName+userEmail);
			entity = new ResponseEntity<>( svc.searchID(userName, userEmail) ,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/searchPW/{userName},{userEmail},{userID}",method=RequestMethod.GET)
	public ResponseEntity<MemberDto> searcgPW(@PathVariable String userName, @PathVariable String userEmail, @PathVariable String userID){
		ResponseEntity<MemberDto> entity = null;
		try {
			
			entity = new ResponseEntity<>( svc.searchPW(userName, userEmail, userID) ,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		
		return entity;
	}

}
