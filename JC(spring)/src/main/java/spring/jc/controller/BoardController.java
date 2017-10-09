package spring.jc.controller;


import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.jc.dto.BoardDto;
import spring.jc.service.BoardService;
import spring.jc.util.Criteria;
import spring.jc.util.PageMaker;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/bbsAllList")
	public String listAll(@RequestParam("page") int page, @RequestParam("perPageNum")int perPageNum,Model model){
		
	
		Criteria cri = new Criteria();
	
	
		
		
		try {
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			model.addAttribute("bbsList",service.boardAllList(cri));
			int totalbbs = service.totalBBS();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalbbs);
			model.addAttribute("pageMaker", pageMaker);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		
		
		return "board/bbsList";
		
	}
	
	@RequestMapping("/bbsContent")
	public String content(@RequestParam String bbsNum, Model model,HttpSession session){
		String view = "";
		try {
			
			service.readcnt(Integer.parseInt(bbsNum));
			model.addAttribute("bCon",service.bbsContent(bbsNum));
			model.addAttribute("userID",session.getAttribute("userID"));

			view = "board/bbsContent";
	
		}catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			view = "/board/errorPage";
		}
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return view;
		
	}
	
	@RequestMapping("/bbsContent2")
	public void content2(@RequestParam String bbsNum, Model model) throws Exception{
		
		model.addAttribute(service.bbsContent(bbsNum));
		
	
		
	}
	
	
	@RequestMapping("/contentWriteView")
	public String bbsWrite(){
	
		
		return "board/writeForm";
		
	}
	
	@RequestMapping(value = "/bbsInsert" ,method = RequestMethod.POST )
	public String bbsWriteaction( String writer, String subject, String email, String content, String passwd,String re_step,String re_level,String re_renum ){
		
		if(!re_level.equals("new")){
			try {
				service.replyshare(Integer.parseInt(re_level), Integer.parseInt(re_renum));
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		try {
			content = content.replace("\r\n", "<br>");
			BoardDto dto = new BoardDto();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setEmail(email);
			dto.setContent(content);
			dto.setPasswd(passwd);
			
			
			
			if(!re_level.equals("new")){
				dto.setRe_level(Integer.parseInt(re_level));
				dto.setRe_step(Integer.parseInt(re_step)+1);
			}else if(re_level.equals("new")){
				int a =service.nextNum();
				System.out.println(a);
				dto.setRe_level(a);
				dto.setRe_step(0);
			}
			
			dto.setRe_renum(Integer.parseInt(re_renum)+1);
			
			service.bbsInsert(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/bbsAllList?page=1&perPageNum=10";
		
	}
	
	
	@RequestMapping("/deletebbs")
	public String bbsDelete(@RequestParam("num") int num){
		
		try {
			service.deleteBBS(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/bbsAllList?page=1&perPageNum=10";
	}
	
	

	@RequestMapping("/updatebbsView")
	public String bbsUpdateView(@RequestParam("num") String num,Model model){
		try {
			BoardDto a = service.bbsContent(num);
		   
		 
		model.addAttribute("ccc",a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/updateBBSForm";
	}
	
	@RequestMapping(value ="/updatebbs",method = RequestMethod.POST)
	public String bbsUpdate(int num, String subject, String email, String content){
		BoardDto dto = new BoardDto();
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setEmail(email);
		dto.setContent(content);
		try {
			service.updateBBS(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/bbsAllList?page=1&perPageNum=10";
	}
	
	
	@RequestMapping("/replybbsView")
	public String bbsReplyView(@RequestParam("num") String num,Model model){
		try {
			BoardDto a = service.bbsContent(num);
		   
		 
		model.addAttribute("ccc",a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/writeForm";
	}
	
	@RequestMapping("/searchBBS")
	public String bbsSearch(@RequestParam("word") String word,Model model){
		try {
			System.out.println(word);
			String keyowrd = URLDecoder.decode(word, "UTF-8");
		  model.addAttribute("bbsList",service.searchBBS("%"+keyowrd+"%"));

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "board/searchListForm";
	}
	
	@RequestMapping(value ="/upload", method=RequestMethod.POST)
	public String uploadForm(MultipartFile file,Model model){
		try {
		
		 String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		 
		 model.addAttribute(savedName);

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "home";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid+"_"+originalName;
		
		File target = new File(uploadPath,savedName);
		
		FileCopyUtils.copy(fileData,target);
		
		return savedName;
	}
	
	/*private String uploadFile(String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath,savedName);
		
		FileCopyUtils.copy(fileData,target);
		
		return savedName;
	}*/
	
	@RequestMapping(value ="/fileForm")
	public String fileForm(){
		
	
		
		return "board/fileupload";
	}
	
	@RequestMapping("/jong")
	public  String jongMe(Model model) throws Exception {
		
		List<String> list = new ArrayList<>();
		list.addAll(service.bbsTest());
		
		model.addAttribute("aa",list);
		model.addAttribute("aaa",service.bbsTest());
		return "board/jongTest";
		
	}

	@RequestMapping("/jong2")
	public  @ResponseBody List<String> jongMeth(Model model) throws Exception {
		
		
		return service.bbsTest();
	}
	
	
}
