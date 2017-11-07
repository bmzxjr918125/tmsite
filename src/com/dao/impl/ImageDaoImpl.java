package com.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.base.dao.BaseDaoImpl;
import com.dao.ImageDao;
import com.entity.Image;

@Repository("imageDao")
public class ImageDaoImpl extends BaseDaoImpl<Image> implements ImageDao{

	@SuppressWarnings("unchecked")
	public List<Image> getImageList(int type) {
		String hql = "from Image where type=" + type;
		return this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Image> getImageByNoticeId(int noticeId){
		
		String hql = "from Image where notice.id=" + noticeId;
		
		return this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).list();
	}
	
	public void deleteByNewsId(int newsId){
		
		String hql = "delete from Image where notice.id=" + newsId;
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).executeUpdate();
	}
	
	public Image getLutrababyImage(){
		
		String hql = "from Image where lutrababy.id=1 and type=3";
		return (Image) this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).setMaxResults(1).uniqueResult();
	}
	
	public Image getNewsFirstImage(int newsId){
		
		String hql = "from Image where notice.id=" + newsId;
		return (Image) this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).setMaxResults(1).uniqueResult();
	}

}
