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
