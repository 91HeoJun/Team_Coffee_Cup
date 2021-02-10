/**
 *
아이디: 5~12- 영어 대소문자, 숫자, 특수문자 허용
비밀번호: 8~15-영어 대소문자, 숫자, 특수문자 허용
비밀번호 확인: 이전 비밀번호와 동일
이름: 2~4자리 허용
이메일: 이메일 검증
번호: 숫자만 입력
 */
$(function(){
    $("#regist").validate({
        //규칙정의 -이름
        rules:{
            userid:{
                required: true,
                validId:true,
                remote:{
                	url:"/user/checkId",
                	type:"post",
                	data:{
                		userid:function(){
                			return $("#userid").val();
                		}
                	}
                }
            },
            password:{
                required: true,
                validPwd:true
            },
            confirm_password:{
                required: true,
                validPwd:true,
                equalTo:"#password"
            },
			name:{
				required: true,
				validName: true,
				rangelength:[2,4]
			},
			postCode:{
				required: true,
			},
            email:{
                required: true,
                email: true
            },
            tel:{
                required: true,
                tel: true
            },
            address:{
                required: true
            }
        },
        //규칙에 대한 메세지 정의
        messages:{
            userid:{
                required:"아이디는 필수 속성입니다.",
				remote:"중복된 아이디 입니다."
            },
            password:{
                required:"비밀번호는 필수 속성입니다."
            },
            confirm_password:{
                required:"비밀번호는 필수 속성입니다.",
                equalTo:"이전 비밀번호와 다릅니다."
            },
            name:{
                required:"이름은 필수 속성입니다.",
				rangelength:"이름은 2~4자리 사이입니다."
            },
            email:{
                required:"이메일은 필수 속성입니다.",
            },
            tel:{
                required:"모바일은 필수 속성입니다.",
            },
            postCode:{
                required:"우편번호는 필수 속성입니다.",
            },
            address:{
                required:"주소는 필수 속성입니다.",
            }
        },
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr('id')+"']").append(error);
		},
		success: function(label){
			var name=label.attr('for');
			label.text(name+' is ok!');
		}
    });
})
//사용자 검증 메소드 추가
$.validator.addMethod("validId",function(value){
    var regId = /(?=.*[A-Za-z])[A-Za-z\d]{5,12}$/;
    return regId.test(value); //true or false return
},"아이디를 영대소문자, 숫자 조합으로 5~12자리로 만들어 주세요"); //false면 자동으로 메세지
$.validator.addMethod("validPwd",function(value){
    var regPw = /(?=.*[A-Za-z])(?=.*[!@#$%^*])[A-Za-z\d!@#$%^*]{8,15}$/;
    return regPw.test(value); //true or false return
},"비밀번호를 영대소문자, 숫자, 특수문자 조합으로 8~15자리로 만들어 주세요"); //false면 자동으로 메세지
$.validator.addMethod("email",function(value){
    var regEmail =/(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
    return regEmail.test(value);
},"이메일을 확인해 주세요");
$.validator.addMethod("validName",function(value){
    var regName = /[가-힣]{2,4}$/;
    return regName.test(value);
},"한글 2~4자리로 만들어 주세요.");
$.validator.addMethod("validTel",function(value){
    var regTel = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    return regTel.test(value);
},"전화번호 숫자만 입력해 주세요.");