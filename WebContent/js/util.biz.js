/* eiwaf-ui v1.0.0 | BizUtil | (c)E4NET Ltd, Co. */
function bizf_IsUserId(str, ignoreStr) {
	if (utlf_IsNull(str)) {
		return false;
	}
	return (/^[a-zA-z]{1}[0-9a-zA-Z]+$/).test(str.remove(ignoreStr)) ? true : false;
}

function bizf_IsJuminNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var jumin = eval("str.match(/^[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[1234]{1}[0-9]{6}$/)");
	if (utlf_IsNull(jumin)) {
		return false;
	} else {
		jumin = utlf_NumberChar(jumin.toString());
	}
	var a = parseInt(jumin.substring(0, 1), 10);
	var b = parseInt(jumin.substring(1, 2), 10);
	var c = parseInt(jumin.substring(2, 3), 10);
	var d = parseInt(jumin.substring(3, 4), 10);
	var e = parseInt(jumin.substring(4, 5), 10);
	var f = parseInt(jumin.substring(5, 6), 10);
	var g = parseInt(jumin.substring(6, 7), 10);
	var h = parseInt(jumin.substring(7, 8), 10);
	var i = parseInt(jumin.substring(8, 9), 10);
	var j = parseInt(jumin.substring(9, 10), 10);
	var k = parseInt(jumin.substring(10, 11), 10);
	var l = parseInt(jumin.substring(11, 12), 10);
	var m = parseInt(jumin.substring(12, 13), 10);
	var mm = parseInt(jumin.substring(2, 4), 10);
	var dd = parseInt(jumin.substring(4, 6), 10);
	if (mm <= 0 || mm > 12) {
		return false;
	}
	if (dd <= 0 || dd > 31) {
		return false;
	}
	var temp = a * 2 + b * 3 + c * 4 + d * 5 + e * 6 + f * 7 + g * 8 + h * 9 + i * 2 + j * 3 + k * 4 + l * 5;
	temp = temp % 11;
	temp = 11 - temp;
	temp = temp % 10;
	return (temp == m) ? true : false;
}

function bizf_IsForeignerNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var jumin = eval("str.match(/^[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[5678]{1}[0-9]{6}$/)");
	if (utlf_IsNull(jumin)) {
		return false;
	} else {
		jumin = utlf_NumberChar(jumin.toString());
	}
	var fgnNo = new Array(13);
	for (var ii = 0; ii < 13; ++ii) {
		fgnNo[ii] = parseInt(jumin.charAt(ii), 10);
	}
	if (fgnNo[11] < 6) {
		return false;
	}
	var parity = fgnNo[7] * 10 + fgnNo[8];
	if (parity & 1) {
		return false;
	}
	var total = 0;
	var weight = 2;
	for (var ii = 0; ii < 12; ++ii) {
		total += fgnNo[ii] * weight;
		if (++weight > 9) {
			weight = 2;
		}
	}
	if ((total = 11 - (total % 11)) >= 10) {
		total -= 10;
	}
	if ((total += 2) >= 10) {
		total -= 10;
	}
	return (total != fgnNo[12]) ? false : true;
}

function bizf_IsBizNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var bizno = eval("str.match(/^[0-9]{3}" + arg + "[0-9]{2}" + arg + "[0-9]{5}$/)");
	if (utlf_IsNull(bizno)) {
		return false;
	} else {
		bizno = utlf_NumberChar(bizno.toString());
	}
	if ('0000000000' == bizno || '4444444444' == bizno || '8888888888' == bizno) {
		return false;
	}
	var a = parseInt(bizno.substring(0, 1), 10);
	var b = parseInt(bizno.substring(1, 2), 10);
	var c = parseInt(bizno.substring(2, 3), 10);
	var d = parseInt(bizno.substring(3, 4), 10);
	var e = parseInt(bizno.substring(4, 5), 10);
	var f = parseInt(bizno.substring(5, 6), 10);
	var g = parseInt(bizno.substring(6, 7), 10);
	var h = parseInt(bizno.substring(7, 8), 10);
	var i = parseInt(bizno.substring(8, 9), 10);
	var j = parseInt(bizno.substring(9, 10), 10);
	var sum = 0;
	sum += a * 1 % 10;
	sum += b * 3 % 10;
	sum += c * 7 % 10;
	sum += d * 1 % 10;
	sum += e * 3 % 10;
	sum += f * 7 % 10;
	sum += g * 1 % 10;
	sum += h * 3 % 10;
	sum += i * 5 % 10 + Math.floor(i * 5 / 10);
	sum += j * 1 % 10;
	return (sum % 10 == 0) ? true : false;
}

function bizf_IsCorpNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var corpno = eval("str.match(/^[0-9]{6}" + arg + "[0-9]{7}$/)");
	if (utlf_IsNull(corpno)) {
		return false;
	} else {
		corpno = utlf_NumberChar(corpno.toString());
	}
	if ('0000000000000' == corpno) {
		return false;
	}
	return true;
}

function bizf_IsMerNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var merno = eval("str.match(/^[0-9]{3}" + arg + "[0-9]{3}" + arg + "[0-9]{6}$/)");
	if (utlf_IsNull(merno)) {
		return false;
	}
	return true;
}

function bizf_IsEmail(str) {
	if (utlf_IsNull(str)) {
		return false;
	}
	return (/^\w+([-.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(str);
}

function bizf_IsPhone(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	return eval("(/^(02|013[0-9]{1}|050[0-9]{1}|0[3-9]{1}[0-9]{1})" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

function bizf_IsMobile(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	return eval("(/^01[016789]" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

function bizf_FormatKrMoneyInternal(amt) {
	var orgAmt = String(amt);
	var strAmt = "0000000000000000" + orgAmt;
	var retAmt = "";
	var idx = 0;
	var len = strAmt.length;
	for(var ii = len; ii > 0; --ii) {
		if (++idx > orgAmt.length) { break; };
		var number = strAmt.substring(ii - 1, ii);
		if (number != "0") {
			if      (idx % 4 == 2)            { retAmt = "십" + retAmt; }
			else if (idx % 4 == 3)            { retAmt = "백" + retAmt; }
			else if (idx > 1 && (idx % 4)==0) { retAmt = "천" + retAmt; }
		}
		if (idx == 5  && parseInt(strAmt.substring(len - 8,  len - 4), 10)  > 0) { retAmt = "만" + retAmt; }
		if (idx == 9  && parseInt(strAmt.substring(len - 12, len - 8), 10)  > 0) { retAmt = "억" + retAmt; }
		if (idx == 13 && parseInt(strAmt.substring(len - 16, len - 12), 10) > 0) { retAmt = "조" + retAmt; }
		if      (number == "1") { retAmt = "일" + retAmt; }
		else if (number == "2") { retAmt = "이" + retAmt; }
		else if (number == "3") { retAmt = "삼" + retAmt; }
		else if (number == "4") { retAmt = "사" + retAmt; }
		else if (number == "5") { retAmt = "오" + retAmt; }
		else if (number == "6") { retAmt = "육" + retAmt; }
		else if (number == "7") { retAmt = "칠" + retAmt; }
		else if (number == "8") { retAmt = "팔" + retAmt; }
		else if (number == "9") { retAmt = "구" + retAmt; }
	}
	return retAmt + "원";
}

function bizf_FormatKrMoney(amt) {
	var val = utlf_ParseNumber(String(amt), 0);
	if (val < 1) {
		return "원";
	}
	return bizf_FormatKrMoneyInternal(val);
}

function bizf_FormatKrMoney2(amt) {
	var val = utlf_ParseNumber(String(amt), 0);
	if (val < 1) {
		return "만원";
	}
	return bizf_FormatKrMoneyInternal(val * 10000);
}