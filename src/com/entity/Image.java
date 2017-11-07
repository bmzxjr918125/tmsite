package com.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * <p>ClassName: Image</p>
 * <p>@Description: 图片</p>
 * <p>@author TangTianBao</p>
 * <p>@date 2016-10-19下午3:14:02</p>
 */
@Entity
@Table(name="image")
public class Image implements Serializable{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 1357961728628214490L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	/**
	 * 类型：1.新闻图片，2.公告页图片，3.公司简介图片
	 */
	private int type;
	
	/**
	 * 地址
	 */
	private String url;
	
	/**
	 * 所属新闻、公告
	 */
	@ManyToOne
    @JoinColumn(name="notice")
	private Notice notice;
	
	/**
	 * 所属公司简介图片
	 */
	@ManyToOne
    @JoinColumn(name="lutrababy")
	private Lutrababy lutrababy;
	
	/**
	 * 创建日期
	 */
	private Date createDate;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public Lutrababy getLutrababy() {
		return lutrababy;
	}

	public void setLutrababy(Lutrababy lutrababy) {
		this.lutrababy = lutrababy;
	}
	
}
