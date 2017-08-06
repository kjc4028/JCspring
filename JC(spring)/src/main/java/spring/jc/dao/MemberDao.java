package spring.jc.dao;

import java.util.List;

import spring.jc.dto.MemberDto;

public interface MemberDao {
	
	public List<MemberDto> listAll() throws Exception;
	
	public void insert(MemberDto dto) throws Exception;
	
	public int idCheck(String id) throws Exception;
	
	public String idSelect(String id) throws Exception;
	
	public MemberDto searchID(String name, String Email) throws Exception;
	
	public MemberDto searchPW(String name, String Email,String id) throws Exception;
	
	public void delete(String id) throws Exception;
}
