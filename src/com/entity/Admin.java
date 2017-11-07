package com.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

/**
 * 
 * <p>ClassName: Admin</p>
 * <p>@Description: 后台用户</p>
 * <p>@author TangTianBao</p>
 * <p>@date 2016-10-19下午3:09:57</p>
 */
@Entity
@Table(name="admin")
public class Admin implements Serializable{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = -6682369864272308616L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	/**
	 * 管理员类型
	 * 0.超级管理员
	 * 1.....
	 * 2.....
	 * 3.....
	 */
	private int type;
	
	/**
	 * 管理员账户
	 */
	@JoinColumn(unique = true)
	private String username;
	
	/**
	 * 管理员密码
	 */
	private String password;
	
	/**
	 * 状态
	 * 1.可用
	 * -1.不可用
	 */
	@Column(columnDefinition = "INTEGER default 1")
	private int status;
	
	/**
	 * 帐号创建时间
	 */
	private Date creatDate;
	
	/**
	 * 帐号最近修改时间
	 */
	private Date updateDate;
	
	/**
	 * 上次登陆时间
	 */
	private Date lastLoginDate;
	
	/**
	 * 本次登陆时间
	 */
	private Date thisLoginDate;
	
	/**
	 * 
	 */
	private String powers;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getThisLoginDate() {
		return thisLoginDate;
	}

	public void setThisLoginDate(Date thisLoginDate) {
		this.thisLoginDate = thisLoginDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPowers() {
		return powers;
	}

	public void setPowers(String powers) {
		this.powers = powers;
	}
	
}
