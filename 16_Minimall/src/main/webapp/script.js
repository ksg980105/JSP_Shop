/**
 * 
 */

var isCheck = false;
var use;
var pwuse;

$(function(){
	$('input[name=id]').keydown(function(){
		$('#idmessage').css('display','none');
		isCheck = false;
		use = "";
	});
});
 
function writeSave(){	//가입하기 눌렀을 때
	if($("input[name=id]").val()==""){
		alert("아이디를 입력하세요");
		$("input[name=id]").focus();
		isBlank = true;
		return false;
	}else if(use == "impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}else if(isCheck == false){
		alert("중복체크 먼저 하세요");
		return false;
	}
	
	if($('input[name=password]').val()==""){
		alert('비밀번호를 입력하세요.');
		$('input[name=password]').focus();
		return false;
	}
	if($('input[name=repassword]').val()==""){
		alert('비밀번호 확인을 입력하세요.');
		$('input[name=repassword]').focus();
		return false;
	}
	
	if(pwuse == "nosame"){
		alert('비밀번호 일치하지 않습니다.');
		return false;
	}
	
}

function duplicate(){	//중복체크 눌렀을 때
	isCheck = true;
	if($('input[name=id]').val()==""){
		alert('아이디를 입력하세요');
		$('input[name=id]').focus();
		isBlack = true;
		return;
	}
	
	$.ajax({
			url : "id_check_proc.jsp",
			data : ({
				userid : $('input[name="id"]').val()
			}),
			success : function(data){
			//alert("data:"+data);
			if($.trim(data)=='YES'){
					$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
					$('#idmessage').show();
					use = "possible";
			}else{
					$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
					$('#idmessage').show();
					use = "impossible";
				}
			}
		});
}


function repassword_keyup(){
	//alert(1);
	if($('input[name=password]').val() == $('input[name=repassword]').val()){
		$('#pwmessage').html("<font color=blue>비번일치</font>");
		pwuse = "same";
	}else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
		pwuse = "nosame";
	}
}

function pwcheck(){ //비밀번호 유효성 검사	
	pvalue = $('input[name="password"]').val();
	var regexp = /^[a-z0-9]{3,8}$/; //3글자~8글자사이
	
	if(pvalue.search(regexp) == -1){
		alert('길이는 3~8글자로 입력하세요.');
		return false;
	}
	
	var chk_eng = pvalue.search(/[a-z]/);
	var chk_num = pvalue.search(/[0-9]/);
	if(chk_eng<0 || chk_num<0){
		alert('영문 소문자/숫자 조합이 아닙니다.');
		return false;
	}
}

