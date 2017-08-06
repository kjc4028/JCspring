package spring.jc.service;

import java.util.List;

import spring.jc.dto.MemberDto;

public interface MemberService {
	
	public List<MemberDto> listAll() throws Exception;
	
	public void join(MemberDto dto) throws Exception;
	
	public int idCheck(String id) throws Exception;
	
	public String idSelect(String id) throws Exception;
	
	public MemberDto searchID(String name, String Email) throws Exception;

	public MemberDto searchPW(String name, String Email,String id) throws Exception;

	public void memberOut(String id) throws Exception;

}
