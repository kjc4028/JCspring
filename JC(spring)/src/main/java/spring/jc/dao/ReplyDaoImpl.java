package spring.jc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import spring.jc.dto.ReplyDto;
import spring.jc.util.Criteria;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	private static final String namespace = "spring.jc.mapper.ReplyMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyDto> replyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".replyList",bno);
	}

	@Override
	public void replyInsert(ReplyDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("bno",dto.getBno());
		param.put("replytext",dto.getReplytext());
		param.put("replyer",dto.getReplyer());
		sqlSession.insert(namespace+".replyInsert",param);

	}

	@Override
	public List<ReplyDto> replyListPage(int bno, Criteria cri) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("bno",bno);
		param.put("reStart", cri.getPageStart()+1);
		param.put("reEnd", cri.getPageStart()+10);
		return sqlSession.selectList(namespace+".reListPage",param);
	}

	@Override
	public int totalCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".reTotalCnt",bno);
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".reDelete",rno);
	}

}
