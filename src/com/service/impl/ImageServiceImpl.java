package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ImageDao;
import com.entity.Image;
import com.service.ImageService;

@Service("imageService")
public class ImageServiceImpl implements ImageService{

	private ImageDao imageDao;
	
	public ImageDao getImageDao() {
		return imageDao;
	}

	@Resource(name = "imageDao")
	public void setImageDao(ImageDao imageDao) {
		this.imageDao = imageDao;
	}

	public void save(Image image) {
		// TODO Auto-generated method stub
		imageDao.save(image);
	}

	public void deleteById(int id) {
		// TODO Auto-generated method stub
		imageDao.deleteById(id);
	}
	
	public void deleteByNewsId(int newsId){
		
		imageDao.deleteByNewsId(newsId);
	}

	public void update(Image image) {
		// TODO Auto-generated method stub
		imageDao.update(image);
	}
	
	public List<Image> getImageList(int type){
		
		return imageDao.getImageList(type);
	}
	
	public List<Image> getImageByNoticeId(int noticeId){
		
		return imageDao.getImageByNoticeId(noticeId);
	}
	
	public Image getLutrababyImage(){
		
		return imageDao.getLutrababyImage();
	}
	
	public Image getNewsFirstImage(int newsId){
		
		return imageDao.getNewsFirstImage(newsId);
	}
	
	
	
	
	
}
