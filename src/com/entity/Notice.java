package com.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * <p>ClassName: Notice</p>
 * <p>@Description: 公告、新闻</p>
 * <p>@author TangTianBao</p>
 * <p>@date 2016-10-19下午3:13:30</p>
 */
@Entity
@Table(name="notice")
public class Notice implements Serializable{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 8822206284956078568L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	/**
	 * 类型：1.新闻，2.公告
	 */
	private int type;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 内容
	 */
	@Column(length = 1000000000)
	private String content;
	
	/**
	 * 发布作者
	 */
	@ManyToOne
    @JoinColumn(name="admin")
	private Admin admin;
	
	/**
	 * 发布时间
	 */
	private Date createDate;
	
	/**
	 * 修改时间
	 */
	private Date updateDate;
	
	/**
	 * 状态：1.正常，-1.作废
	 */
	@Column(columnDefinition = "INTEGER default 1")
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
