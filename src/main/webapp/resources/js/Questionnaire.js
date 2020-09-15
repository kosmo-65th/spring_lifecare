var examFolder="2020/HSP/MAKE";

//���됲듃諛뺤뒪 �좏깮�� 湲��먯깋�� 吏���
function selectColor(obj, num){
	sObj = document.getElementById(obj);
	if(sObj.value == "0" || sObj.value == ""){
		sObj.style.color="black";
	}else if(sObj.value == "1" || sObj.value == num) {
		sObj.style.color="red";
	} 
}

//嫄닿컯寃�吏� 臾몄쭊�� �묒꽦
function examWrite(mymYear, mymForm)
{
	//estimate �섏씠吏��� parameter
	pg_mehId=document.sform.mehId.value;
	pg_med_type=document.sform.med_type.value;

	pg_lang=document.sform.lang.value;

	urlParam = "mymYear="+mymYear+"&mymForm="+mymForm+"&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang;

	url = "/" + examFolder + "/ExamMake.asp?" + urlParam;

	location.href=url;
}

//嫄닿컯寃�吏� 臾몄쭊�� �묒꽦(nfc)
function examWrite_nfc(mymYear, mymForm, ver, useNormal)
{
	//estimate �섏씠吏��� parameter
	pg_mehId=document.sform.mehId.value;
	pg_med_type=document.sform.med_type.value;

	pg_lang=document.sform.lang.value;

	urlParam = "mymYear="+mymYear+"&mymForm="+mymForm+"&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang+"&ver="+ver+"&useNormal="+useNormal;

	url = "/" + examFolder + "/ExamMake.asp?" + urlParam;

	location.href=url;
}

//嫄닿컯寃�吏� 臾몄쭊�� �묒꽦
function examWriteTO(mymYear, mymForm, examNo)
{
	//estimate �섏씠吏��� parameter
	pg_mehId=document.sform.mehId.value;
	pg_med_type=document.sform.med_type.value;
	pg_chk_useNormal=document.sform.chk_useNormal.value;
	pg_lang=document.sform.lang.value;

	//醫낃��몃뜲 �쇰컲寃�吏� 臾몄쭊�� �ъ슜
	if(pg_chk_useNormal=="Y")
	{
		urlParam="mymYear="+mymYear+"&mymForm=AA&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang+"&exm_examNo="+examNo+"&useNormal="+pg_chk_useNormal;
	}
	else
	{
		urlParam="mymYear="+mymYear+"&mymForm="+mymForm+"&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang+"&exm_examNo="+examNo;;
	}

	url = "/" + examFolder + "/ExamMake.asp?" + urlParam;

	location.href=url;
}

//嫄닿컯寃�吏� 臾몄쭊�� �묒꽦(nfc)
function examWriteTO_nfc(mymYear, mymForm, examNo, ver)
{
	//estimate �섏씠吏��� parameter
	pg_mehId=document.sform.mehId.value;
	pg_med_type=document.sform.med_type.value;
	pg_chk_useNormal=document.sform.chk_useNormal.value;
	pg_lang=document.sform.lang.value;

	//醫낃��몃뜲 �쇰컲寃�吏� 臾몄쭊�� �ъ슜
	if(pg_chk_useNormal=="Y")
	{
		urlParam="mymYear="+mymYear+"&mymForm=AA&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang+"&exm_examNo="+examNo+"&useNormal="+pg_chk_useNormal+"&ver="+ver;
	}
	else
	{
		urlParam="mymYear="+mymYear+"&mymForm="+mymForm+"&mehId="+pg_mehId+"&med_type="+pg_med_type+"&lang="+pg_lang+"&exm_examNo="+examNo+"&ver="+ver;
	}

	url = "/" + examFolder + "/ExamMake.asp?" + urlParam;

	location.href=url;
}

//�몄뼱蹂�寃�
function chg_lang()
{
	var f=document.sform;

	f.submit();
}


//�대�吏� �먮윭(190620 異붽�)
function imgError(obj)
{
	obj.style.display="none";
}