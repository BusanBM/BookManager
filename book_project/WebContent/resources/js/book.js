function search_ok() {
	if(document.search_bar.search_word.value.length==0){
		alert("검색어를 입력해 주세요");
		search_bar.search_word.focus();
		return false;
	}
	document.search_bar.submit();
}

function insert_ok(){
	if(document.form.b_title.value.len == 0){
		alert("도서명을 입력해 주세요");
		form.b_title.focus();
		return false;
	}
	if(document.form.b_author.value.len == 0){
		alert("작가 이름을 입력해 주세요");
		form.b_author.focus();
		return false;
	}
	if(document.form.b_year.value.len == 0){
		alert("출판년도를 입력해 주세요");
		form.b_year.focus();
		return false;
	}
	if(document.form.b_price.value.len == 0){
		alert("가격을 입력해 주세요");
		form.b_price.focus();
		return false;
	}
	document.form.submit();
}

function sum(){
	var temp;
	var input = document.getElementById("b_quantity").value;
	temp = input;
	var price = "<%=b_price%>";
	var sum = price * temp;
	document.getElementById("total_price").value = sum;
}