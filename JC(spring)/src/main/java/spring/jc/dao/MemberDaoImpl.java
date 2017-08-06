package spring.jc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import spring.jc.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

		private static final String namespace = "spring.jc.mapper.MemberMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDto> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public void insert(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace+".insert",dto);
		
	}

	@Override
	public int idCheck(String id) throws Exception {
		
		return sqlSession.selectOne(namespace+".idCheck",id);
	}

	@Override
	public String idSelect(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".idSelect",id);
	}

	@Override
	public MemberDto searchID(String name, String Email) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("Email", Email);
		return sqlSession.selectOne(namespace+".SearchID",param);
	}

	@Override
	public MemberDto searchPW(String name, String Email, String id) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("Email", Email);
		param.put("id", id);

		return sqlSession.selectOne(namespace+".SearchPW",param);
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",id);
	}



}
