package spring.jc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spring.jc.dao.MemberDao;
import spring.jc.dto.MemberDto;

@Service
public class MemberServieImpl implements MemberService{

	@Inject
	MemberDao dao;
	@Override
	public List<MemberDto> listAll() throws Exception {
		
		
		return dao.listAll();
	}
	@Override
	public void join(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(dto);
		
		
	}
	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.idCheck(id);
	}
	@Override
	public String idSelect(String id) throws Exception {
		// TODO Auto-generated method stub
		
		
		return dao.idSelect(id);
	}
	@Override
	public MemberDto searchID(String name, String Email) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchID(name, Email);
	}
	@Override
	public MemberDto searchPW(String name, String Email, String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchPW(name, Email, id);
	}
	@Override
	public void memberOut(String id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(id);
		
	}

}
