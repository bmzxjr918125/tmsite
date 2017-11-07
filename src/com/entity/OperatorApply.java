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
 * <p>ClassName: OperatorApply</p>
 * <p>@Description: 渠道申请信息</p>
 * <p>@author TangTianBao</p>
 * <p>@date 2016-10-19下午3:08:25</p>
 */
@Entity
@Table(name="operatorApply")
public class OperatorApply implements Serializable{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 7072071988234265585L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	/**
	 * 申请人姓名
	 */
	private String username;
	
	/**
	 * 联系电话
	 */
	@JoinColumn(unique = true)
	private String phone;
	
	/**
	 * 所在区域
	 */
	private String area;
	
	/**
	 * 状态：0.创建，1.同意，-1.拒绝
	 */
	@Column(columnDefinition = "INTEGER default 0")
	private int status;
	
	/**
	 * 申请时间
	 */
	private Date createDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
