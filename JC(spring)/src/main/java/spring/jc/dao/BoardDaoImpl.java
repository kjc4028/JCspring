package spring.jc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import spring.jc.dto.BoardDto;
import spring.jc.util.Criteria;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	private static final String namespace = "spring.jc.mapper.BoardMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDto> boardAllList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("bbsStart", cri.getPageStart()+cri.getPerPageNum()-9);
		param.put("bbsEnd", cri.getPageStart()+cri.getPerPageNum());
		
		return sqlSession.selectList(namespace+".boardAllList",param);
	}

	@Override
	public BoardDto bbsContent(String num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".bbsContent",num);
	}

	@Override
	public void bbsInsert(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		

		sqlSession.insert(namespace+".bbsInsert",dto);
	}

	@Override
	public int totalBBS() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".totalBBS");
	}

	@Override
	public void deleteBBS(int num) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deleteBBS",num);
		
	}

	@Override
	public void updateBBS(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".updateBBS",dto);
	}

	@Override
	public void readcnt(int num) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace+".readcnt",num);
	}

	@Override
	public int nextNum() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".nextnum");
	}

	@Override
	public void replyshare(int re_level, int re_renum) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("re_level", re_level);
		param.put("re_renum", re_renum);

		sqlSession.update(namespace+".replyshare",param);
		
	}

	@Override
	public List<BoardDto> searchBBS(String word) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".searchBBS",word);
	}

	
}
