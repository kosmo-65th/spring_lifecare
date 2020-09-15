function WEBF_getFlash(url, w, h, opt){
	document.write("<embed src=\""+url+"\" quality=high wmode=transparent ");
	document.write ("pluginspage=\"http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\" ");
	document.write ("type=\"application/x-shockwave-flash\" width=\""+w+"\" height=\""+h+"\" "+opt+">");
}

function WEBF_getMovie(url, w, h, opt){
	document.write("<embed src=\""+url+"\" ");
	//document.write ("pluginspage=\"http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\" ");
	document.write (" width=\""+w+"\" height=\""+h+"\" "+opt+">");
}

//紐⑤떖�덉갹�닿린
function WEBF_newModalWindow(mypage, myname, w, h, s) {
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'dialogWidth:'+w+'px;dialogHeight:'+h+'px;';
	window.showModalDialog(mypage, myname ,settings );
}
//�덉갹�닿린
function WEBF_newWindow(mypage, myname, w, h, s) {
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition;
	if(s == 1)
		settings += ",scrollbars=yes";
	window.open(mypage, myname, settings)
}

//�덉갹�닿린
function WEBF_newWindowWide(mypage, myname, s) {
	LeftPosition = (screen.width) ? (screen.width)/2 : 0;
	TopPosition = (screen.height) ? (screen.height)/2 : 0;
	settings = 'height='+screen.height+',width='+screen.width+',top='+TopPosition+',left='+LeftPosition;
	if(s == 1)
		settings += ",scrollbars=yes";
	window.open(mypage, myname, settings)
}

var WEB_errText = "�꾨뱶媛� 鍮꾩뿀嫄곕굹 �щ컮瑜댁� �딆뒿�덈떎.";
var WEB_errText2 = "�꾨뱶媛� �좏깮�섏� �딆븯�듬땲��.";

function WEBF_chkText(val) {
	var keynum, keylen;
    keynum = val.indexOf(" ");
    while (keynum != -1)
    {
		val = val.replace(" ", "");
        keynum  = val.indexOf(" ");
    }
    keylen = val.length;
    if (keylen < 1)
		return false;
	else
		return true;
}

function WEBF_chkDay(val) {
	if (val.search(/(\d){4}\-(\d){2}\-(\d){2}$/ ) == -1)
		return false;
	else
		return true;
}

function WEBF_chkTime(val) {
	if (val.search(/(\d){2}\:(\d){2}\:(\d){2}$/ ) == -1)
		return false;
	else
		return true;
}

function WEBF_chkPhone(val) {
	if (val.search(/^0(\d){1,3}\-(\d){2,4}\-(\d){4}$/) == -1)
		return false;
	else
		return true;
}

function WEBF_chkCphone(val) {
	//if (val.search(/^0(\d){1,3}\-(\d){2,4}\-(\d){4}$/) == -1)
	if (val.search(/^0(\d){2,3}\-(\d){2,4}\-(\d){4}$/) == -1)	//190311 �섏젙
		return false;
	else
		return true;
}

function WEBF_chkEmail(val) {
	if (val.search(/(\S+)@(\S+)\.(\S+)/) == -1)
		return false;
	else
		return true;
}


function WEBF_chkAddress(addr1, addr2, addr3) {
	if ((addr1.search(/(\d){3}/) == -1) || (addr2.search(/(\d){3}/) == -1) || (!WEBF_chkText(addr3)))
		return false;
	else
		return true;
}


function WEBF_chkLoop(val) {
	var chk = false;
	for (i = 0; i < val.length ; i++)
	{
		if (val[i].checked)
		{
			chk = true;
			break;
		}
	}
	return chk;
}


function WEBF_chkSSN(val) {
	if (val.indexOf("-") == -1)
		return false;
	
	var ssn = val.split("-")
  	var tmp = 0
    var yy = ssn[0].substring(0,2)
    var mm = ssn[0].substring(2,4)
    var dd = ssn[0].substring(4,6)
    var sex = ssn[1].substring(0,1)

	if ((ssn[0].length != 6 ) || ( mm < 1 || mm > 12 || dd < 1) )
		return false;
    if ((sex != 1 && sex !=2 && sex !=3 && sex !=4)|| (ssn[1].length != 7 ))
		return false;

    for (var i = 0; i <=5 ; i++)
		tmp = tmp + ((i%8+2) * parseInt(ssn[0].substring(i,i+1)))

    for (var i = 6; i <=11 ; i++)
		tmp = tmp + ((i%8+2) * parseInt(ssn[1].substring(i-6,i-5)))

    tmp = 11 - (tmp %11)
    tmp = tmp % 10

    if (tmp != ssn[1].substring(6,7))
		return false;
           
	return true;
}

function WEBF_chkBusiNum(vencod){ 

  if(vencod == "") return false;

  if(vencod.length != 12) return false;
  if(vencod.substring(3,4) != "-") return false;
  if(vencod.substring(6,7) != "-") return false;
  vencod = vencod.replace(/-/gi,'');

  var sum = 0; 
  var getlist =new Array(10); 
  var chkvalue =new Array("1","3","7","1","3","7","1","3","5"); 

  for (var i=0;i<10;i++){  
      getlist[i] = vencod.substring(i,i+1); 
  } 

  for (var i=0;i<9;i++){  
      sum += getlist[i]*chkvalue[i]; 
  } 
  sum = sum +parseInt((getlist[8]*5)/10) ; 
  sidliy = sum%10; 
  sidchk = 0; 

  if ( sidliy != 0 ) {  
      sidchk = 10 - sidliy;  
  } else {  
      sidchk = 0;  
  } 
  if ( sidchk != getlist[9] ) { 
      return false; 
  } 
  return true; 
} 

function WEBF_chkDate(val) {
	if (val.search(/^20(\d){2}\-(\d){2}\-(\d){2}$/) == -1)
		return false;
	else
		return true;
}


function WEBF_chkNumber(str) {
	if (str.search(/^[0-9\-]{1,}$/) == -1)
		return false;
	else
		return true;
}


function WEBF_onlyNumber() {
	if ((event.keyCode == 46) || (event.keyCode == 45)) {
	} else {
		if((event.keyCode<48)||(event.keyCode>57))
			event.returnValue=false;
	}
}

function WEBF_chkID(str) {
	if (str.search(/^[A-Za-z0-9_]{4,12}$/) == -1) 
		return false;
	else
		return true;
}


function WEBF_searchZip(num) {
	leftp = (screen.width) ? (screen.width) / 2 : 0;
	topp =   (screen.height) ? (screen.height) / 2 : 0;
	alert("/mobile/WEB/APP/G_APP_POST.asp?num="+num,"sch","width="+screen.width+",height="+screen.height+",left="+ leftp +", top="+ topp);
	window.open("/mobile/WEB/APP/G_APP_POST.asp?num="+num,"sch","width="+screen.width+",height="+screen.height+",left="+ leftp +", top="+ topp);
	return; 
}


function WEBF_openCalendar(val) {
	x = (screen.width / 2)-(270 / 2);
	y = (screen.height / 2)-(259 / 2);
	window.open("/WEB/APP/G_APP_CALENDAR.asp?val="+ val, "calendar", "width=270, height=259, top="+ y +", left="+ x);
}


function WEBF_mvLocation(url) {
	location.href = url;
}


function WEBF_chgWord(val) {
	var tmpVal;
	tmpVal = val.replace(/\&/g, "`*`");
	return tmpVal;
}

function WEBF_getObj(mnu) {
	var obj;
	if (document.all) 
		obj = document.all(mnu); //IE ...
	else if (DOM)
		obj = document.getElementById(mnu); //Netscape6 and mozila browser...
	else
		obj = document.layer[mnu]; //Netscape3,4...

	return obj;
}

function WEBF_getBrVer() {
	if (navigator.appVersion.indexOf("MSIE") != -1) {
		IEmajorStart = navigator.appVersion.indexOf("MSIE") + 4;
		IEmajorEnd = (IEmajorStart + 4);
		theMajor = navigator.appVersion.substring(IEmajorStart, IEmajorEnd);
		if (isNaN(theMajor)) 
			return 0;
		else
			return parseFloat(theMajor);
	} else {
		return 0;
	}
}


var WEB_pause=8000
var WEB_nowPointer=0

function WEBF_doTrans() {

	if(WEB_nowPointer == WEB_processCnt) 
		WEB_nowPointer = 0;


	if(WEBF_getBrVer() < 5.5) {
		
		WEB_imgObj.innerHTML = WEB_slidecomment[WEB_nowPointer];
	} else {
		WEB_imgObj.filters[0].apply();

		WEB_imgObj.innerHTML = WEB_slidecomment[WEB_nowPointer];
		WEB_imgObj.filters[0].play();
	}

	WEB_nowPointer++;
	setTimeout("WEBF_doTrans()",WEB_pause);
}



function WEBF_mnuDoTrans(obj, color, color2) {
	if(document.all && WEBF_getBrVer() >= 5.5) {
		eval(obj+".filters[0].apply()");
		eval(obj+".style.color = color2");
		eval(obj+".style.backgroundColor = color");	
		eval(obj+".filters[0].play();");
	} else {
	}
}

function MaskPhon( obj ) { 
	obj.value =  PhonNumStr( obj.value ); 
} 

function PhonNumStr( str ){ 
	var RegNotNum  = /[^0-9]/g; 
	var RegPhonNum = ""; 
	var DataForm   = ""; 
	// return blank     
	if( str == "" || str == null ) return ""; 
	// delete not number
	str = str.replace(RegNotNum,''); 
	if( str.length < 4 ) return str; 
	if( str.length > 3 && str.length < 7 ) { 
	   	DataForm = "$1-$2"; 
		RegPhonNum = /([0-9]{3})([0-9]+)/; 
	} else if(str.length == 7 ) {
		DataForm = "$1-$2"; 
		RegPhonNum = /([0-9]{3})([0-9]{4})/; 
	} else if(str.length == 8 ) {
		DataForm = "$1-$2"; 
		RegPhonNum = /([0-9]{4})([0-9]{4})/; 
	} else if(str.length == 9 ) {
		DataForm = "$1-$2-$3"; 
		RegPhonNum = /([0-9]{2})([0-9]{3})([0-9]+)/; 
	} else if(str.length == 10){ 
		if(str.substring(0,2)=="02"){
			DataForm = "$1-$2-$3"; 
			RegPhonNum = /([0-9]{2})([0-9]{4})([0-9]+)/; 
		}else{
			DataForm = "$1-$2-$3"; 
			RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
		}
	} else if(str.length > 10){  
		DataForm = "$1-$2-$3"; 
		RegPhonNum = /([0-9]{3})([0-9]{4})([0-9]+)/; 
	} 
	while( RegPhonNum.test(str) ) {  
		str = str.replace(RegPhonNum, DataForm);  
	} 
	return str; 
} 

function MaskBis( obj ) { 
	obj.value =  BisNumStr( obj.value ); 
} 

function BisNumStr( str ){ 
	var RegNotNum  = /[^0-9]/g; 
	var RegPhonNum = ""; 
	var DataForm   = ""; 
	// return blank     
	if( str == "" || str == null ) return ""; 
	// delete not number
	str = str.replace(RegNotNum,''); 
	if( str.length < 4 ) return str; 
	if( str.length >= 4 && str.length < 6 ) { 
	   	DataForm = "$1-$2"; 
		RegPhonNum = /([0-9]{3})([0-9]+)/; 
	} else if(str.length >= 6 ) {
		DataForm = "$1-$2-$3"; 
		RegPhonNum = /([0-9]{3})([0-9]{2})([0-9]+)/; 
	} 
	while( RegPhonNum.test(str) ) {  
		str = str.replace(RegPhonNum, DataForm);  
	} 
	return str; 
} 

function MaskDate( obj ) { 
	obj.value =  DateStr( obj.value ); 
} 

function DateStr( str ){ 
	var RegNotNum  = /[^0-9]/g; 
	var RegPhonNum = ""; 
	var DataForm   = ""; 
	// return blank     
	if( str == "" || str == null ) return ""; 
	// delete not number
	str = str.replace(RegNotNum,''); 
	if( str.length < 5 ) return str; 
	if( str.length >= 5 && str.length < 8 ) { 
	   	DataForm = "$1-$2"; 
		RegPhonNum = /([0-9]{4})([0-9]+)/; 
	} else if(str.length >= 8 ) {
		DataForm = "$1-$2-$3"; 
		RegPhonNum = /([0-9]{4})([0-9]{2})([0-9]+)/; 
	} 
	while( RegPhonNum.test(str) ) {  
		str = str.replace(RegPhonNum, DataForm);  
	} 
	return str; 
} 

function MaskJumin( obj ) { 
	obj.value =  JuminStr( obj.value ); 
} 

function JuminStr( str ){ 
	var RegNotNum  = /[^0-9]/g; 
	var str = str.replace(RegNotNum,''); 
	var subStr = str.replace('-', '');
	if (subStr.length < 7){
		return str; 
	}else if(subStr.length >= 7){
		subStr = subStr.substring(0, 6) + "-" + subStr.replace(subStr.substring(0, 6), "");
		return subStr; 
	}
} 

//二쇰�踰덊샇 �낅젰(16/08/19 異붽�)
function MaskJumin2(event, obj, nextname) {

	event = event || window.event;
	 
	var ew = event.which;
	//諛⑺뼢��, 諛깆뒪�섏씠��,�쒕━�� �� �낅젰 媛��ν븯寃�...
	if(ew == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
		return true;
	}
	else
	{
		str=obj.value;

		if (str.length == 6 && nextname!=""){
			next=document.getElementsByName(nextname);
			next[0].focus();
		}

		var RegNotNum  = /[^0-9]/; 
		obj.value = str.replace(RegNotNum,'');

		return true;
	}
	return false;
}

//�대쫫�낅젰 泥댄겕(�쒓�留�, 10�먯젣��)
function MaskName(obj)
{
	tmpStr=obj.value;
	//tmpStr=tmpStr.replace(/([^媛�-�ｃ꽦-�롢뀖-��\x20])/gi,'');
	//tmpStr=tmpStr.replace(/\s/gi, ''); 

	if(tmpStr.length > obj.maxLength) {
		tmpStr = tmpStr.slice(0, obj.maxLength);
	}

	obj.value=tmpStr;
}

//二쇰�踰덊샇 寃���(16/08/19 異붽�)
function WEBF_chkSSN2(val) {
	if (val.indexOf("-") == -1)
		return false;
	
	var ssn = val.split("-")
  	var tmp = 0
    var yy = ssn[0].substring(0,2)
    var mm = ssn[0].substring(2,4)
    var dd = ssn[0].substring(4,6)
    var sex = ssn[1].substring(0,1)

	if ((ssn[0].length != 6 ) || ( mm < 1 || mm > 12 || dd < 1 || dd > 31 ) )
		return false;
    if ((sex != 1 && sex !=2 && sex !=3 && sex !=4 && sex !=5 && sex !=6 && sex !=7 && sex !=8)|| (ssn[1].length != 1 ))
		return false;

	return true;
}


//�レ옄留� �낅젰(16/08/19 異붽�)
function TxtOnlyNum(event, obj) {

	event = event || window.event;
	 
	var ew = event.which;
	//諛⑺뼢��, 諛깆뒪�섏씠��,�쒕━�� �� �낅젰 媛��ν븯寃�...
	if(ew == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
		return true;
	}
	else
	{
		str=obj.value;

		var RegNotNum  = /[^0-9]/; 
		obj.value = str.replace(RegNotNum,'');

		return true;
	}
	return false;
}

//�レ옄留� �낅젰 - ��(.) 媛���
function TxtOnlyNum2(event, obj) {

	event = event || window.event;
	 
	var ew = event.which;
	//諛⑺뼢��, 諛깆뒪�섏씠��,�쒕━�� �� �낅젰 媛��ν븯寃�...
	if(ew == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
		return true;
	}
	else
	{
		str=obj.value;

		var RegNotNum  = /[^0-9.]/; 
		obj.value = str.replace(RegNotNum,'');

		return true;
	}
	return false;
}


//�쒓�泥댄겕
function Is_nick_name(formname){
	var form = formname;
	for(var i = 0; i < form.length; i++){
		var chr = form.substr(i,1);
		chr = escape(chr);
		if (chr.charAt(1) == "u"){
			chr = chr.substr(2, (chr.length - 1));
			if((chr < "AC00") || (chr > "D7A3"))
				return false;
		}else{
			return false;
		}
	}
	return true;
}

/* �덈맖 (�섏젙�꾩슂)
function MaskNumber( obj ) { 
	obj.value =  NumberStr( obj.value ); 
} 

function NumberStr(str) {
	if (str.search(/^[0-9\-]{1,}$/) == -1)
		return false;
	else
		return true;
}
*/


/**
 * =============================================================
 * Copyright (c) 2000 by LG-EDS Systems Inc
 * All rights reserved.
 *
 * �좎쭨愿��� �먮컮�ㅽ겕由쏀듃 怨듯넻�⑥닔
 *
 * 遺꾨떒�� �댄븯(= 珥�)�� 怨좊젮�섏� �딆븯�듬땲��.
 * YYYYMMDDHHMI �뺤떇�� String => 'Time'�쇰줈 移�븿
 *
 * 二쇰줈 YYYYMMDD 源뚯�留� �곗씤�ㅻ㈃ �꾨옒 �⑥닔�ㅼ쓣
 * YYYYMMDD �뺤떇�� String => 'Date'濡� �섏뿬 �곷떦��
 * �섏젙�섏떆嫄곕굹 �꾨땲硫� �⑥닔瑜�, �덈��ㅼ뼱 isValidDate()泥섎읆,
 * 異붽��섏떆湲� 諛붾엻�덈떎.
 *
 * @version 2.0, 2001/01/28
 * @author 諛뺤쥌吏�(JongJin Park), jongjpark@lgeds.lg.co.kr
 * =============================================================
 */


/**
 * �좏슚��(議댁옱�섎뒗) ��(��)�몄� 泥댄겕
 */
function isValidMonth(mm) {
    var m = parseInt(mm,10);
    return (m >= 1 && m <= 12);
}

/**
 * �좏슚��(議댁옱�섎뒗) ��(��)�몄� 泥댄겕
 */
function isValidDay(yyyy, mm, dd) {
    var m = parseInt(mm,10) - 1;
    var d = parseInt(dd,10);

    var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    if ((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0) {
        end[1] = 29;
    }

    return (d >= 1 && d <= end[m]);
}

/**
 * �좏슚��(議댁옱�섎뒗) ��(��)�몄� 泥댄겕
 */
function isValidHour(hh) {
    var h = parseInt(hh,10);
    return (h >= 1 && h <= 24);
}

/**
 * �좏슚��(議댁옱�섎뒗) 遺�(��)�몄� 泥댄겕
 */
function isValidMin(mi) {
    var m = parseInt(mi,10);
    return (m >= 1 && m <= 60);
}

/**
 * Time �뺤떇�몄� 泥댄겕(�먯뒯�� 泥댄겕)
 */
function isValidTimeFormat(time) {
    return (!isNaN(time) && time.length == 12);
}

/**
 * �좏슚�섎뒗(議댁옱�섎뒗) Time �몄� 泥댄겕

 * ex) var time = form.time.value; //'200102310000'
 *     if (!isValidTime(time)) {
 *         alert("�щ컮瑜� �좎쭨媛� �꾨떃�덈떎.");
 *     }
 */
function isValidTime(time) {
    var year  = time.substring(0,4);
    var month = time.substring(5,6);
    var day   = time.substring(8,8);
    var hour  = "00";
    var min   = "00";
	if(time.length > 10){
		hour  = time.substr(11,2);
		min   = time.substr(13,2);
	}

    if (parseInt(year,10) >= 1900  && isValidMonth(month) &&
        isValidDay(year,month,day) && isValidHour(hour)   &&
        isValidMin(min)) {
        return true;
    }
    return false;
}

/**
 * Time �ㅽ듃留곸쓣 �먮컮�ㅽ겕由쏀듃 Date 媛앹껜濡� 蹂���
 * parameter time: Time �뺤떇�� String
 * time�뺤떇�� "2000-01-01 00:00" �댁뼱�� ��.
 */
function toTimeObject(time) { //parseTime(time)
    var year  = time.substr(0,4);
    var month = time.substr(5,2) - 1; // 1��=0,12��=11
    var day   = time.substr(8,2);
    var hour  = "00";
    var min   = "00";
	if(time.length > 10){
		hour  = time.substr(11,2);
		min   = time.substr(13,2);
	}

    return new Date(year,month,day,hour,min);
}

/**
 * �먮컮�ㅽ겕由쏀듃 Date 媛앹껜瑜� Time �ㅽ듃留곸쑝濡� 蹂���
 * parameter date: JavaScript Date Object
 */
function toTimeString(date) { //formatTime(date)
    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 1��=0,12��=11�대�濡� 1 �뷀븿
    var day   = date.getDate();
    var hour  = date.getHours();
    var min   = date.getMinutes();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
    if (("" + hour).length  == 1) { hour  = "0" + hour;  }
    if (("" + min).length   == 1) { min   = "0" + min;   }

    return ("" + year + month + day + hour + min)
}

/**
 * Time�� �꾩옱�쒓컖 �댄썑(誘몃옒)�몄� 泥댄겕
 */
function isFutureTime(time) {
    return (toTimeObject(time) > new Date());
}

/**
 * Time�� �꾩옱�쒓컖 �댁쟾(怨쇨굅)�몄� 泥댄겕
 */
function isPastTime(time) {
    return (toTimeObject(time) < new Date());
}

/**
 * 二쇱뼱吏� Time 怨� y�� m�� d�� h�� 李⑥씠�섎뒗 Time�� 由ы꽩

 * ex) var time = form.time.value; //'20000101000'
 *     alert(shiftTime(time,0,0,-100,0));
 *     => 2000/01/01 00:00 �쇰줈遺��� 100�� �� Time
 */
function shiftTime(time,y,m,d,h) { //moveTime(time,y,m,d,h)
    var date = toTimeObject(time);

    date.setFullYear(date.getFullYear() + y); //y�꾩쓣 �뷀븿
    date.setMonth(date.getMonth() + m);       //m�붿쓣 �뷀븿
    date.setDate(date.getDate() + d);         //d�쇱쓣 �뷀븿
    date.setHours(date.getHours() + h);       //h�쒕� �뷀븿

    return toTimeString(date);
}

/**
 * �� Time�� 紐� �� 李⑥씠�섎뒗吏� 援ы븿

 * time1�� time2蹂대떎 �щ㈃(誘몃옒硫�) minus(-)
 */
function WEBF_getYearInterval(time1,time2) { //measureMonthInterval(time1,time2)
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);

    var years  = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days   = date2.getDate() - date1.getDate();

	return parseInt(((years * 12 + months + (days >= 0 ? 0 : -1) ) / 12));
}

/**
 * �� Time�� 紐� 媛쒖썡 李⑥씠�섎뒗吏� 援ы븿

 * time1�� time2蹂대떎 �щ㈃(誘몃옒硫�) minus(-)
 */
function getMonthInterval(time1,time2) { //measureMonthInterval(time1,time2)
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);

    var years  = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days   = date2.getDate() - date1.getDate();

    return (years * 12 + months + (days >= 0 ? 0 : -1) );
}

/**
 * �� Time�� 硫곗튌 李⑥씠�섎뒗吏� 援ы븿
 * time1�� time2蹂대떎 �щ㈃(誘몃옒硫�) minus(-)
 */
function getDayInterval(time1,time2) {
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);
    var day   = 1000 * 3600 * 24; //24�쒓컙

    return parseInt((date2 - date1) / day, 10);
}

/**
 * �� Time�� 紐� �쒓컙 李⑥씠�섎뒗吏� 援ы븿

 * time1�� time2蹂대떎 �щ㈃(誘몃옒硫�) minus(-)
 */
function getHourInterval(time1,time2) {
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);
    var hour  = 1000 * 3600; //1�쒓컙

    return parseInt((date2 - date1) / hour, 10);
}

/**
 * �꾩옱 �쒓컖�� Time �뺤떇�쇰줈 由ы꽩

 */
function getCurrentTime() {
    return toTimeString(new Date());
}

/**
 * �꾩옱 �쒓컖怨� y�� m�� d�� h�� 李⑥씠�섎뒗 Time�� 由ы꽩
 */
function getRelativeTime(y,m,d,h) {
/*
    var date = new Date();

    date.setFullYear(date.getFullYear() + y); //y�꾩쓣 �뷀븿
    date.setMonth(date.getMonth() + m);       //m�붿쓣 �뷀븿
    date.setDate(date.getDate() + d);         //d�쇱쓣 �뷀븿
    date.setHours(date.getHours() + h);       //h�쒕� �뷀븿

    return toTimeString(date);
*/
    return shiftTime(getCurrentTime(),y,m,d,h);
}

/**
 * �꾩옱 亮댁쓣 YYYY�뺤떇�쇰줈 由ы꽩
 */
function getYear() {
/*
    var now = new Date();
    return now.getFullYear();
*/
    return getCurrentTime().substr(0,4);
}

/**
 * �꾩옱 �덉쓣 MM�뺤떇�쇰줈 由ы꽩
 */
function getMonth() {
/*
    var now = new Date();

    var month = now.getMonth() + 1; // 1��=0,12��=11�대�濡� 1 �뷀븿
    if (("" + month).length == 1) { month = "0" + month; }

    return month;
*/
    return getCurrentTime().substr(4,2);
}

/**
 * �꾩옱 �μ쓣 DD�뺤떇�쇰줈 由ы꽩

 */
function getDay() {
/*
    var now = new Date();

    var day = now.getDate();
    if (("" + day).length == 1) { day = "0" + day; }

    return day;
*/
    return getCurrentTime().substr(6,2);
}

/**
 * �꾩옱 �귣� HH�뺤떇�쇰줈 由ы꽩
 */
function getHour() {
/*
    var now = new Date();

    var hour = now.getHours();
    if (("" + hour).length == 1) { hour = "0" + hour; }

    return hour;
*/
    return getCurrentTime().substr(8,2);
}

/**
 * �ㅻ뒛�� 臾댁뒯 �붿씪�댁빞?

 * ex) alert('�ㅻ뒛�� ' + getDayOfWeek() + '�붿씪�낅땲��.');
 * �뱀젙 �좎쭨�� �붿씪�� 援ы븯�ㅻ㈃? => �щ윭遺꾩씠 吏곸젒 留뚮뱾�� 蹂댁꽭��.
 */
function getDayOfWeek() {
    var now = new Date();

    var day = now.getDay(); //�쇱슂��=0,�붿슂��=1,...,�좎슂��=6
    var week = new Array('��','��','��','��','紐�','湲�','��');

    return week[day];
}

/*
// 異쒖쿂�� http://www.oramaster.net
*/

//�뺤닔 10�댄븯 �덉궗
function money10WinCut(f){
	var fNum = f.toFixed(0);
	var fNumSize = fNum.length;
	if( fNumSize > 0 ){
		fNum = String(fNum).substring(0, fNumSize-1)+"0";
	}
	else{
		fNum = 0;
	}
	return fNum;
}

//泥쒕떒�� 肄ㅻ쭏(,)泥섎━
function number_format(nStr) { 
	nStr += ''; 
	x = nStr.split('.'); 
	x1 = x[0]; 
	x2 = x.length > 1 ? '.' + x[1] : ''; 
	var rgx = /(\d+)(\d{3})/; 
	while (rgx.test(x1)) { 
		x1 = x1.replace(rgx, '$1' + ',' + '$2'); 
	} 
	return x1 + x2; 
} 
 
//泥쒕떒�� 肄ㅻ쭏(,) �ㅻ툕�앺듃 �⑥닔泥섎━
function obj_number_format(obj) { 
	var input = String(strip_number_format(obj.value));
	var output = "";
	for(var i=input.length; i>=0; i--){
		if((input.length-i)%3==1 && output.length!=0 && input.charAt(i) != "-"){
			output = "," + output;
		}
		output = input.charAt(i) + output;
	}
	obj.value = output;
	return output;
} 
 
/** 
* 肄ㅻ쭏泥섎━�� �レ옄瑜� �먮낯�쇰줈 �뚮┛��. 
* @param val 1,234,567 
* @return 1234567 
*/
function strip_number_format(val) { 
	if ( typeof val == "undefined" || val == null || val == "" ) { 
		return ""; 
	} 
	var txtNumber = '' + val; 
	return txtNumber.replace(/(,)/g, ""); 
}

function obj_strip_number_format(obj) { 
	val = obj.value;
	if ( typeof val == "undefined" || val == null || val == "" ) { 
		return ""; 
	} 
	var txtNumber = '' + val; 
	obj.value = txtNumber.replace(/(,)/g, "");
	return txtNumber.replace(/(,)/g, "");
}

function WEBF_getSgguCode(f){
	var s = ['110000', '210000', '220000', '230000', '240000', '250000', '260000', '310000', '320000', '330000', '340000', '350000', '360000', '370000', '380000', '390000', '410000']; 
	var v1 = ['110001','110002','110003','110004','110005','110006','110007','110008','110009','110010','110011','110012','110013','110014','110015','110016','110017','110018','110019','110020','110021','110022','110023','110024','110025','210001','210002','210003','210004','210005','210006','210007','210008','210009','210010','210011','210012','210013','210014','210015','210100','220001','220002','220003','220004','220005','220006','220007','220008','220100','220200','230001','230002','230003','230004','230005','230006','230007','230100','240001','240002','240003','240004','240005','250001','250002','250003','250004','250005','260001','260002','260003','260004','260100','310001','310009','310011','310100','310200','310301','310302','310303','310401','310402','310403','310601','310602','310603','310604','310701','310702','310800','310900','311000','311101','311102','311200','311300','311400','311500','311600','311700','311800','311901','311902','311903','312001','312002','312003','312100','312200','312300','312400','312500','312600','312700','312800','312900','320001','320004','320005','320006','320008','320009','320010','320012','320013','320014','320015','320100','320200','320300','320400','320500','320600','320700','330001','330002','330003','330004','330005','330006','330009','330011','330101','330102','330103','330104','330200','330300','340002','340007','340009','340012','340014','340015','340016','340201','340202','340300','340400','340500','340600','340700','340800','340900','350001','350004','350005','350006','350008','350010','350011','350013','350100','350200','350300','350401','350402','350500','350600','360001','360002','360003','360006','360008','360009','360010','360012','360014','360015','360016','360017','360018','360019','360020','360021','360022','360200','360300','360400','360500','360700','370002','370003','370007','370010','370012','370013','370017','370018','370019','370021','370022','370023','370024','370100','370200','370300','370400','370500','370600','370701','370702','370800','370900','371000','380002','380003','380005','380008','380011','380014','380016','380017','380018','380019','380100','380300','380500','380701','380702','380703','380704','380705','380800','380900','381000','381100','390100','390200','410000'];
	var v2 = ['媛뺣궓援�','媛뺣룞援�','媛뺤꽌援�','愿��낃뎄','援щ줈援�','�꾨큺援�','�숇�臾멸뎄','�숈옉援�','留덊룷援�','�쒕�臾멸뎄','�깅룞援�','�깅턿援�','�곷벑�ш뎄','�⑹궛援�','���됯뎄','醫낅줈援�','以묎뎄','�≫뙆援�','以묐옉援�','�묒쿇援�','�쒖큹援�','�몄썝援�','愿묒쭊援�','媛뺣턿援�','湲덉쿇援�','遺��곕궓援�','遺��곕룞援�','遺��곕룞�섍뎄','遺��곗쭊援�','遺��곕턿援�','遺��곗꽌援�','遺��곗쁺�꾧뎄','遺��곗쨷援�','遺��고빐�대�援�','遺��곗궗�섍뎄','遺��곌툑�뺢뎄','遺��곌컯�쒓뎄','遺��곗뿰�쒓뎄','遺��곗닔�곴뎄','遺��곗궗�곴뎄','遺��곌린�κ뎔','�몄쿇�④뎄','�몄쿇�숆뎄','�몄쿇遺��됯뎄','�몄쿇以묎뎄','�몄쿇�쒓뎄','�몄쿇�⑤룞援�','�몄쿇�곗닔援�','�몄쿇怨꾩뼇援�','�몄쿇媛뺥솕援�','�몄쿇�뱀쭊援�','��援щ궓援�','��援щ룞援�','��援щ턿援�','��援ъ꽌援�','��援ъ닔�깃뎄','��援ъ쨷援�','��援щ떖�쒓뎄','��援щ떖�깃뎔','愿묒＜�숆뎄','愿묒＜遺곴뎄','愿묒＜�쒓뎄','愿묒＜愿묒궛援�','愿묒＜�④뎄','���꾩쑀�깃뎄','���꾨��뺢뎄','���꾩꽌援�','���꾨룞援�','���꾩쨷援�','�몄궛�④뎄','�몄궛�숆뎄','�몄궛以묎뎄','�몄궛遺곴뎄','�몄궛�몄＜援�','媛��됯뎔','�묓룊援�','�곗쿇援�','愿묐챸��','�숇몢泥쒖떆','遺�泥쒖냼�ш뎄','遺�泥쒖삤�뺢뎄','遺�泥쒖썝誘멸뎄','�깅궓�섏젙援�','�깅궓以묒썝援�','�깅궓遺꾨떦援�','�섏썝沅뚯꽑援�','�섏썝�μ븞援�','�섏썝�붾떖援�','�섏썝�곹넻援�','�덉뼇留뚯븞援�','�덉뼇�숈븞援�','�섏젙遺���','怨쇱쿇��','援щ━��','�덉궛�⑥썝援�','�덉궛�곷줉援�','�됲깮��','�섎궓��','援고룷��','�⑥뼇二쇱떆','�섏솗��','�쒗씎��','�ㅼ궛��','怨좎뼇�뺤뼇援�','怨좎뼇�쇱궛�쒓뎄','怨좎뼇�쇱궛�숆뎄','�⑹씤湲고씎援�','�⑹씤�섏�援�','�⑹씤泥섏씤援�','�댁쿇��','�뚯＜��','源��ъ떆','�덉꽦��','�붿꽦��','愿묒＜��','�묒＜��','�ъ쿇��','�ъ＜��','怨좎꽦援�','�묎뎄援�','�묒뼇援�','�곸썡援�','�몄젣援�','�뺤꽑援�','泥좎썝援�','�됱갹援�','�띿쿇援�','�붿쿇援�','�≪꽦援�','媛뺣쫱��','�숉빐��','�띿큹��','�먯＜��','異섏쿇��','�쒕갚��','�쇱쿃��','愿댁궛援�','�⑥뼇援�','蹂댁�援�','�곷룞援�','�μ쿇援�','�뚯꽦援�','吏꾩쿇援�','利앺룊援�','泥�＜�곷떦援�','泥�＜�λ뜒援�','泥�＜泥�썝援�','泥�＜�쒖썝援�','異⑹＜��','�쒖쿇��','湲덉궛援�','遺��ш뎔','�쒖쿇援�','�덉궛援�','泥�뼇援�','�띿꽦援�','�쒖븞援�','泥쒖븞�쒕턿援�','泥쒖븞�숇궓援�','怨듭＜��','蹂대졊��','�꾩궛��','�쒖궛��','�쇱궛��','怨꾨！��','�뱀쭊��','怨좎갹援�','臾댁＜援�','遺��덇뎔','�쒖갹援�','�꾩＜援�','�꾩떎援�','�μ닔援�','吏꾩븞援�','援곗궛��','�⑥썝��','�듭궛��','�꾩＜�꾩궛援�','�꾩＜�뺤쭊援�','�뺤쓭��','源��쒖떆','媛뺤쭊援�','怨좏씎援�','怨≪꽦援�','援щ�援�','�댁뼇援�','臾댁븞援�','蹂댁꽦援�','�좎븞援�','�곴킅援�','�곸븫援�','�꾨룄援�','�μ꽦援�','�ν씎援�','吏꾨룄援�','�⑦룊援�','�대궓援�','�붿닚援�','�섏＜��','紐⑺룷��','�쒖쿇��','�ъ닔��','愿묒뼇��','怨좊졊援�','援곗쐞援�','遊됲솕援�','�깆＜援�','�곷뜒援�','�곸뼇援�','�덉쿇援�','�몃쫱援�','�몄쭊援�','�섏꽦援�','泥�룄援�','泥�넚援�','移좉끝援�','寃쎌＜��','援щ���','源�泥쒖떆','�덈룞��','�곸＜��','�곸쿇��','�ы빆�④뎄','�ы빆遺곴뎄','臾멸꼍��','�곸＜��','寃쎌궛��','嫄곗갹援�','怨좎꽦援�','�⑦빐援�','�곗껌援�','�섎졊援�','李쎈뀞援�','�섎룞援�','�⑥븞援�','�⑥뼇援�','�⑹쿇援�','源��댁떆','�ъ쿇��','吏꾩＜��','李쎌썝留덉궛�뚯썝援�','李쎌썝留덉궛�⑺룷援�','李쎌썝吏꾪빐援�','李쎌썝�섏갹援�','李쎌썝�깆궛援�','�듭쁺��','諛��묒떆','嫄곗젣��','�묒궛��','�쒓��ъ떆','�쒖＜��','�몄쥌��'];
	var sgguCd = f.sgguCd;
	sgguCd.length = 0;

	srt = 0;
	end = 0;
	if (f.sidoCd.value == '110000'){
		srt = 0;
		end = 24;
	}else if(f.sidoCd.value == '210000'){
		srt = 25;
		end = 40;
	}else if(f.sidoCd.value == '220000'){
		srt = 41;
		end = 50;
	}else if(f.sidoCd.value == '230000'){
		srt = 51;
		end = 58;
	}else if(f.sidoCd.value == '240000'){
		srt = 59;
		end = 63;
	}else if(f.sidoCd.value == '250000'){
		srt = 64;
		end = 68;
	}else if(f.sidoCd.value == '260000'){
		srt = 69;
		end = 73;
	}else if(f.sidoCd.value == '310000'){
		srt = 74;
		end = 117;
	}else if(f.sidoCd.value == '320000'){
		srt = 118;
		end = 135;
	}else if(f.sidoCd.value == '330000'){
		srt = 136;
		end = 149;
	}else if(f.sidoCd.value == '340000'){
		srt = 150;
		end = 165;
	}else if(f.sidoCd.value == '350000'){
		srt = 166;
		end = 180;
	}else if(f.sidoCd.value == '360000'){
		srt = 181;
		end = 202;
	}else if(f.sidoCd.value == '370000'){
		srt = 203;
		end = 226;
	}else if(f.sidoCd.value == '380000'){
		srt = 227;
		end = 248;
	}else if(f.sidoCd.value == '390000'){
		srt = 249;
		end = 250;
	}else if(f.sidoCd.value == '410000'){
		srt = 251;
		end = 251;
	}

	ct = 0;

	if(f.sidoCd.value == 'total')
	{
		sgguCd.add(new Option("�꾩껜蹂닿린", ""), ct);
	}
	else
	{
		sgguCd.add(new Option("援�/援� �좏깮", ""), ct);
		for(var i=srt; i<=end; i++){
			ct = ct + 1;
			sgguCd.add(new Option(v2[i], v1[i]), ct);
		}
	}
}

function WEBF_getItemCode(f){
	var s = ['01', '02', '03', '04', '05', '06']; 
	var v1 = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25'];
	var v2 = ['湲곕낯寃���', 'CT', 'MRI', 'MRA', 'PET-CT', '蹂듬�珥덉쓬��', '媛묒긽�좎큹�뚰뙆', '�꾨┰�좎큹�뚰뙆', '寃쎈룞留μ큹�뚰뙆', '�먭턿珥덉쓬��', '�좊갑珥덉쓬��', '�ъ옣珥덉쓬��', '�좊갑�붽���', '�먭턿�붽���', '�먭턿�명룷吏�', '�몄쑀�먯쥌 諛붿씠�ъ뒪', '�꾨궡�쒓꼍', '���λ궡�쒓꼍', '�ъ쟾�꾧���', '�먭린�κ���', '�숇㎘寃쏀솕寃���', '怨⑤��꾧���', '媛꾩꽟�좏솕寃���', '移섎ℓ�좊퀎寃���', '�뚮젅瑜닿린寃���'];
	var itemCd = f.itemCd;
	itemCd.length = 0;

	srt = 0;
	end = 0;
	if (f.itmkCd.value == '01'){
		srt = 0;
		end = 0;
	}else if(f.itmkCd.value == '02'){
		srt = 1;
		end = 4;
	}else if(f.itmkCd.value == '03'){
		srt = 5;
		end = 11;
	}else if(f.itmkCd.value == '04'){
		srt = 12;
		end = 15;
	}else if(f.itmkCd.value == '05'){
		srt = 16;
		end = 17;
	}else if(f.itmkCd.value == '06'){
		srt = 18;
		end = 24;
	}

	ct = 0;
	itemCd.add(new Option("寃�吏� �좏깮", ""), ct);
	for(var i=srt; i<=end; i++){
		ct = ct + 1;
		itemCd.add(new Option(v2[i], v1[i]), ct);
	}
}

//泥댄겕諛뺤뒪,���됲듃諛뺤뒪 泥댄겕�щ�
function getCheckboxChk(n){
   var nAry=document.getElementsByName(n); 
	for(var i=0;i<nAry.length;i++) {
		if(nAry[i].checked)	return true;
   }
	return false;
}

//泥댄겕諛뺤뒪,���됲듃諛뺤뒪 泥댄겕�� 媛� 諛쏆븘�ㅺ린
function getCheckboxChkVal(n){
   var nAry=document.getElementsByName(n); 
	for(var i=0;i<nAry.length;i++) {
		if(nAry[i].checked)	return nAry[i].value;
   }
	return "";
}

//泥댄겕諛뺤뒪,���됲듃諛뺤뒪 諛곗뿴媛� 諛쏆븘�ㅺ린
function getCheckboxAryVal(n){
   var nAry=document.getElementsByName(n); 
	return nAry;
}

//DIV display �ㅼ젙
function WEB_divAllNoneSetting(n, f, divName, divColorName, divColorTrue, divColorFalse){
	//10000 = 珥덇린媛� �④린泥섎━
	if (f == 10000){	
		for(var i=0;i<=n-1;i++) {document.getElementById(divName+i).style.display ="none";}
		return false;
	}else{
		//�대젮�덈뒗 DVI �대┃�� �④�泥섎━
		tempDiv = "block"
		if(document.getElementById(divName+f).style.display == "block"){
			tempDiv = "none"
		}
		for(var i=0;i<=n-1;i++) {
			document.getElementById(divName+i).style.display ="none";
			if (divColorName != "" ){
				document.getElementById(divColor+i).style.background = divColorFalse;
			}
			if (i == f){
				document.getElementById(divName+i).style.display = tempDiv;
				if (divColorName != "" ){
					document.getElementById(divColor+i).style.background = divColorTrue;
				}
			}
		}
	}
}

//�뚯썝�뺣낫 - �뚯꽦�ㅼ젙
function chkRate(val)
{
	if(val=="Y")
	{
		$("#setRate").show();
	}
	else
	{
		$("#setRate").hide();
	}
}