/**
 *  댓글 스크립트
 */

var replyService = (function() {
	
	function add(reply, callback) {
		console.log("댓글 추가 메소드 호출중")
		$.ajax({
			type: 'post',
			url: '/replies/newReply',
			contentType : 'application/json;charset=utf-8',
			data:JSON.stringify(reply),
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result) {
				if(callback) {
					callback(result);
				}
			}
		})
	} // add

	function getList(param, callback) {
		
		var bno = param.bno;
		var page = param.page||1;
		
		$.getJSON({
			url : '/replies/pages/'+bno+'/'+page,
			success: function(data) {
				if(data != null) {
					if(callback) {
						callback(data.replyCnt, data.list);
					}
				}
			}
		})
	} // list
	
	function get(rno, callback) {
		$.getJSON({
			url: '/replies/' + rno,
			success: function(data) {
				if(callback) {
					callback(data);
				}
			}
		})
	} // get
	
	function update(reply, callback) {

		$.ajax({
			url: '/replies/' + reply.rno,
			type: 'put',
			contentType: 'application/json;charset=utf-8',
			data: JSON.stringify(reply),
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result) {
				if(callback) {
					callback(result);
				}
			}
		})
	} //update
	
	function remove(rno, callback) {
		
		$.ajax({
			url : '/replies/'+rno,
			type : 'delete',
			contentType : 'application/json;charset=utf-8',
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : JSON.stringify({
				replyer:replyer
			}),
			success:function(result) {
				if(callback) {
					callback(result);
				}
			}
		})
	} // remove
	
	function displayTime(timeVal) {
		console.log(timeVal);
		
		var today = new Date();
		var gap = today.getTime() - timeVal;
		var dateObj = new Date(timeVal);

		// 현재 RDS 시간이 서울이 아니므로 시분초는 임시 주석처리함
		// 연월일은 정상작동하므로 연월일로 처리.
		
//		if(gap < (1000*60*60*24)) {	// 댓글이 달린 날짜가 오늘일 경우 (밀리세컨드*분*초*시)
//			var hh = dateObj.getHours();
//			var mi = dateObj.getMinutes();
//			var sc = dateObj.getSeconds();

			// 9보다 클 경우 그대로, 작을경우 '0'을 붙여서 출력 
//			return [(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (sc>9?'':'0')+sc].join('');

//		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();

			return [yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd].join('');
//		}
	}
	
	
	return {
		add : add,
		getList : getList,
		get : get,
		update : update,
		remove : remove,
		displayTime : displayTime
		
	}
	
})();