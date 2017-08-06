package spring.jc.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spring.jc.dao.BoardDao;
import spring.jc.dto.BoardDto;
import spring.jc.util.Criteria;


@Service
public class BoardSeviceImple implements BoardService {
	
	@Inject
	private BoardDao dao;

	@Override
	public List<BoardDto> boardAllList(Criteria cri) throws Exception {
			
		return dao.boardAllList(cri);
	}

	@Override
	public BoardDto bbsContent(String num) throws Exception {
		// TODO Auto-generated method stub
		return dao.bbsContent(num);
	}

	@Override
	public void bbsInsert(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		
		
		dao.bbsInsert(dto);
	}

	@Override
	public int totalBBS() throws Exception {
		// TODO Auto-generated method stub
		return dao.totalBBS();
	}

	@Override
	public void deleteBBS(int num) throws Exception {
		// TODO Auto-generated method stub
		
		dao.deleteBBS(num);
		
	}

	@Override
	public void updateBBS(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		dao.updateBBS(dto);
		
	}

	@Override
	public void readcnt(int num) throws Exception {
		// TODO Auto-generated method stub
		
		dao.readcnt(num);
		
	}

	@Override
	public int nextNum() throws Exception {
		// TODO Auto-generated method stub
		return dao.nextNum();
	}

	@Override
	public void replyshare(int re_level, int re_num) throws Exception {
		// TODO Auto-generated method stub
		dao.replyshare(re_level, re_num);
		
	}

	@Override
	public List<BoardDto> searchBBS(String word) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchBBS(word);
	}

}
