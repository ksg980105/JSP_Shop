/**
 * 
 */

var isCheck = false;
var use;

$(function(){
	$('input[name=id]').keydown(function(){
		$('#idmessage').css('display','none');
		isCheck = false;
		use = "";
	});
});
 
function writeSave(){	//가입하기 눌렀을 때
	if($('input[name=id]').val()==""){
		alert('아이디를 입력하세요');
		$('input[name=id]').focus();
		isBlack = true;
		return false;
	}else if(use == "impossible"){
		alert('이미 사용중인 아이디입니다.');
		return false;
	}else if(isCheck == false){
		alert('중복체크 먼저 하세요');
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