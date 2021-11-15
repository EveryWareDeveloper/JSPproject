	function update(id){
		document.update.id.value=id;
		document.update.submit();
	}

	function zipCheck(){
	url="../zipSearch.jsp?search=n";
	window.open(url,"post","toolbar=pid ,width=500 ,height=300 ,directories=pid,status=yes,scrollbars=yes,menubar=pid");
	}

//product 

	function productDetail(pid) {
		document.detail.pid.value=pid;
		document.detail.submit();
	}

	function productDelete(pid) {
		document.del.pid.value=pid;
		document.del.submit();
	}

	function productUpdate(pid){
		document.update.pid.value=pid;
		document.update.submit();
	}


//order

	function orderDetail(pid){
		document.detail.pid.value=pid;
		document.detail.submit();	
	}
	
	function orderUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function orderDelete(form) {
		form.flag.value="delete";
		form.submit();
	}
	

//order end