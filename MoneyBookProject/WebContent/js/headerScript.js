function viewMyPage() {
	var date = dateToYYYYMMDD(new Date());
	location.href = "viewMyPage.do?date=" + date;
}

function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

