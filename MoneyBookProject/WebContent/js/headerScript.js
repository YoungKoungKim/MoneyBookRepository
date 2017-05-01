function viewMyPage(id_index) {
	var date = dateToYYYYMMDD(new Date());
	alert(id_index);
	location.href = "viewMyPage.do?id_index=" + id_index + "&date=" + date;
}

function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}