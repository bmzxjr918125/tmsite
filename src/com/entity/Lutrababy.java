package com.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * <p>ClassName: Lutrababy</p>
 * <p>@Description: 獭猫相关信息</p>
 * <p>@author TangTianBao</p>
 * <p>@date 2016-10-19下午2:57:36</p>
 */
@Entity
@Table(name="lutrababy")
public class Lutrababy implements Serializable{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 7932918054882611361L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	/**
	 * 公司介绍
	 */
	@Column(length = 1000000000)
	private String introduce;
	
	/**
	 * 联系方式
	 */
	private String contact;
	
	/**
	 * 服务条款
	 */
	@Column(length = 1000000000)
	private String service_terms;
	
	/**
	 * 法律条款
	 */
	@Column(length = 1000000000)
	private String legal_terms;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getService_terms() {
		return service_terms;
	}

	public void setService_terms(String service_terms) {
		this.service_terms = service_terms;
	}

	public String getLegal_terms() {
		return legal_terms;
	}

	public void setLegal_terms(String legal_terms) {
		this.legal_terms = legal_terms;
	}
	
}
