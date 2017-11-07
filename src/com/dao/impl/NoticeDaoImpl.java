package com.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDaoImpl;
import com.dao.NoticeDao;
import com.entity.Notice;

@Repository("noticeDao")
public class NoticeDaoImpl extends BaseDaoImpl<Notice> implements NoticeDao{

	public void getNoticeList(DataTables dtJson, int type,String title) {
		
		String hql = "from Notice where type=" + type;
		
		if (!StringUtils.isEmpty(title)) {
			
			hql = hql + " and title like'%"+ title +"%'";
		}
		
		super.findByPage(hql, dtJson);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> getHtmlNotice(){
		
		String hql = "from Notice where type=2 and status=1 order by updateDate desc";
		
		return this.getHibernateTemplate().getSessionFactory().
				getCurrentSession().createQuery(hql).setMaxResults(5).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> getHtmlNews(int first, int pageNumber){
		
		String hql = "from Notice where type=1 and status=1 order by updateDate desc";
		
		return this.getHibernateTemplate().getSessionFactory()
                .getCurrentSession().createQuery(hql)
                .setFirstResult(first).setMaxResults(pageNumber).list();
	}
	
	public int getTotalCount(){
		
		String hql = "select count(id) from Notice where type=1 and status=1";
		return ((Long)this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).uniqueResult()).intValue();
	}

}
