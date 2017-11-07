 
 /**
  * 管理员状态
  * @param status
  * @returns {String}
  */
function adminStatus(status){
	if(status == -1){
		return "不可用";
	}else if(status == 1){
		return "可用";
	}else{
		return "---"
	}
}
 
/**
 * 管理员类型
 * @param status
 * @returns {String}
 */
function adminType(type){
	if(type == 0){
		return "超级管理员";
	}else if(type == 1){
		return "管理员";
	}else{
		return "---"
	}
} 

/**
 *申请状态
 * @param status
 * @returns {String}
 */
function applyStatus(status){
	if(status == 0){
		return "已申请";
	}else if(status == 1){
		return "已同意";
	}else if(status == -1){
		return "已拒绝";
	}else{
		return "---"
	}
}