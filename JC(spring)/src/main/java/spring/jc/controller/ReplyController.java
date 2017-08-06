package spring.jc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.jc.dto.ReplyDto;
import spring.jc.service.ReplyService;
import spring.jc.util.Criteria;
import spring.jc.util.PageMaker;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	ReplyService service;

	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyDto dto){
		ResponseEntity<String> entity = null;
		try {
			service.replyInsert(dto);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyDto>> replyList(@PathVariable("bno")Integer bno){
		 ResponseEntity<List<ReplyDto>> entity = null;
		try {
			entity = new ResponseEntity<>(service.replyList(bno),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyListPage(@PathVariable("bno")Integer bno, @PathVariable("page") Integer page){
		 ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(10);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
		      Map<String, Object> map = new HashMap<String, Object>();
		      List<ReplyDto> list = service.replyListPage(bno, cri);
		      map.put("list",list);
		      
		      int reCnt = service.totalCnt(bno);
		      pageMaker.setTotalCount(reCnt);
		      map.put("pageMaker", pageMaker);
		      
			entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reDelete(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		try {
			service.replyDelete(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	
	
	
	
}
