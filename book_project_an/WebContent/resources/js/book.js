function search_ok() {
	if(document.search_bar.search_word.value.length==0){
		alert("검색어를 입력해 주세요");
		search_bar.search_word.focus();
		return false;
	}
	document.search_bar.submit();
}