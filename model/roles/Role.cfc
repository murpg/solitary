component persistent="true" extends="INCLMSsecurity.model.BaseEntity" table="roles" {
	
	property name="roleid" column="role_id" fieldtype="id" generator="uuid" setter="false";
	property name="name" notempty="true" min="3";
	property name="userCount" formula="select count(ur.user_id) from users_roles ur where ur.role_id = role_id";
	
	this.constraints = {
		name = {required=true, size=3-20}
	};
		
	public Role function init(){
		users = [];
		return this;
	}
		
	public boolean function canBeDeleted(){
		return getUserCount() == 0;
	}
	
}