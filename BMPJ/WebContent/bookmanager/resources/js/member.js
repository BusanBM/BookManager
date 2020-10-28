function loginCk(obj){
	if(!obj.id.value||obj.id.value.trim().length == 0){
		alert("아이디가 입력되지 않았습니다.");
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
	if(!obj.pwd.value||obj.pwd.trim().length == 0){
		alert("비밀번호를 입력해주세요.");
		obj.pwd.value = "";
		obj.pwd.focus();
		return false;
	}
	return true;
}

function regist_check(){
	if(document.reg_mem.cs_id.value.length<4 || document.reg_mem.cs_id.value.length>16 ){
		alert("아이디는 4~16자 입니다.");
		reg_mem.cs_id.focus();
		return;
	}
	if(document.reg_mem.cs_pwd.value.length==0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_mem.cs_pwd.focus();
		return;
	}
	if(document.reg_mem.cs_pwd.value != document.reg_mem.pwdck.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_mem.pwdck.focus();
		return;
	}
	if(document.reg_mem.cs_name.value.length==0){
		alert("이름을 써주세요.");
		reg_mem.cs_name.focus();
		return;
	}
	if(document.reg_mem.cs_email.value.length==0){
		alert("E-mail을 써주세요.");
		reg_mem.cs_email.focus();
		return;
	}
	document.reg_mem.submit();
}
