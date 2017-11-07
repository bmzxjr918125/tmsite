package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.base.action.datatables.DataTables;
import com.dao.NoticeDao;
import com.entity.Notice;
import com.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	private NoticeDao noticeDao;
	
	public void getNoticeList(DataTables dtJson, int type,String title) {
		// TODO Auto-generated method stub
		noticeDao.getNoticeList(dtJson,type,title);
	}

	public void save(Notice notice) {
		// TODO Auto-generated method stub
		noticeDao.save(notice);
	}

	public void deleteById(int id) {
		// TODO Auto-generated method stub
		noticeDao.deleteById(id);
	}

	public void update(Notice notice) {
		// TODO Auto-generated method stub
		noticeDao.update(notice);
	}

	public Notice getById(int id) {
		// TODO Auto-generated method stub
		return noticeDao.get(id);
	}
	
	public List<Notice> getHtmlNotice(){
		
		return noticeDao.getHtmlNotice();
	}
	
	public List<Notice> getHtmlNews(int first, int pageNumber){
		
		return noticeDao.getHtmlNews(first,pageNumber);
	}
	
	public int getTotalCount(){
		
		return noticeDao.getTotalCount();
	}
	
	public NoticeDao getNoticeDao() {
		return noticeDao;
	}

	@Resource(name = "noticeDao")
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
}
