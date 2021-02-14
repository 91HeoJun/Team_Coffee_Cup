/**
 * modifyForm의 유효성 검증 
 name 값과 이름명 맞추기
 */

$(function(){
    $("#_frmForm").validate({
        //규칙 정의-이름
    rules :{
        password:{
			required:true,
            validPwd : true
        },
        new_password:{
			required:true,
            validPwd : true
        },
         confirm_password:{
			required:true,
			validPwd : true,
			equalTo : "#new_password" 
		},
		email:{
			required:true,
		},
		tel:{
			required:true,
		},
		addr:{
			required:true,			
		}
},

	messages:{
		password :{ 
			required:"현재 비밀번호를 입력해 주세요.",
			equalTo:"현재 비밀번호와 다릅니다."
	},
		new_password :{ 
			required:"새로운 비밀번호를 입력해 주세요."
	},
		confirm_password :{ 
			required:"새로운 비밀번호를 입력해 주세요",
			equalTo:"이전 비밀번호와 다릅니다."
	},
		email :{ 
			required:"이메일을 입력해 주세요."
	},
		tel :{ 
			required:"휴대폰 번호를 입력해 주세요."
	},
		addr :{ 
			required:"주소를 입력해 주세요."
	},

  },//에러 메시지가 나올 위치 잡기: small 아이디 뒤로
	errorPlacement:function(error,element){
		$(element).closest("form").find("small[id='"+element.attr('id')+"']").append(error);
		$(error).css('color', 'red');
	}
})
});
//사용자 검증 메소드 추가
$.validator.addMethod("validPwd",function(value){
    let pwcheck = /(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^*])[A-Za-z\d!@#$%^*]{8,15}$/;
    return pwcheck.test(value);
},"비밀번호를 영대소문자, 숫자, 특수문자의 조합으로 8~15자리로 만들어주세요");
