package spring.jc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spring.jc.dao.ReplyDao;
import spring.jc.dto.ReplyDto;
import spring.jc.util.Criteria;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDao dao;
	
	@Override
	public List<ReplyDto> replyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyList(bno);
	}

	@Override
	public void replyInsert(ReplyDto dto) throws Exception {
		// TODO Auto-generated method stub
		dao.replyInsert(dto);
	}

	@Override
	public List<ReplyDto> replyListPage(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyListPage(bno, cri);
	}

	@Override
	public int totalCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.totalCnt(bno);
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		// TODO Auto-generated method stub
		dao.replyDelete(rno);
	}

}
