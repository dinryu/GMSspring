/**
 *  
*/
var app=(function(){
	var init=function(ctx){
		session.init(ctx);
		//member.init();
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		location.href=ctx()+"/home.do";
	};
	var setContentView=function(){
		
	};
	var ctx=function(){
		return session.getPath('ctx');
	};
	var js=function(){
		return session.getPath('js');
	};
	var img=function(){
		return session.getPath('img');
	};
	var css=function(){
		return session.getPath('css');
	};
	return {
		init:init,
		ctx:ctx,
		js:js,
		img:img,
		css:css
	};
})();
var session=(function(){
	var init=function(ctx){
		sessionStorage.setItem('ctx',ctx);
		sessionStorage.setItem('js',ctx+'/resources/js');
		sessionStorage.setItem('img',ctx+'/resources/img');
		sessionStorage.setItem('css',ctx+'/resources/css');
	};
	var getPath=function(x){
		return sessionStorage.getItem(x);
	};
	return {
		init : init,
		getPath : getPath

	};
})();
var main=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		 $('.list-group a').eq(0).on('click',function(){
			  controller.moveTo('member','member_join');
		  });
		  $('.list-group a').eq(1).on('click',function(){
			  controller.List('member','member_list','1');
		  });
		  $('.list-group a').eq(2).on('click',function(){
			  var person = prompt("검색할 아이디", "joo");
			  controller.detailStudent(person);
		  });
		  $('.list-group a').eq(3).on('click',function(){
			  controller.moveTo('member','member_update');
		  });
		  $('.list-group a').eq(4).on('click',function(){
			  controller.gms_del('회원');
		  });
	};
	var setContentView=function(){
		  var $u1 =$('#main_ul_stu');
		  var $u2 =$("#main_ul_grade");
		  var $u3 =$("#main_ul_board");
		  $u1.addClass("list-group");
		  $u2.addClass("list-group");
		  $u3.addClass("list-group");
		  $('.list-group').children().addClass("list-group-item");
		
	};
	return {
		init:init
	};
})();
var navbar=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('#logout').on('click',function(){
			location.href=app.ctx()+"/common.do?action=logout&page=home";
		});
		  $('.dropdown-menu a').eq(0).on('click',function(){
			  controller.moveTo('member','member_join');
		  });
		  $('.dropdown-menu a').eq(1).on('click',function(){
			  controller.List('member','member_list','1');
		  });
		  $('.dropdown-menu a').eq(2).on('click',function(){
			  controller.moveTo('member','member_detail');
		  });
		  $('.dropdown-menu a').eq(3).on('click',function(){
			  controller.moveTo('member','member_update');
		  });
	};
	var setContentView=function(){
		  var $d1 =$("#navbar_ul_stu");
		  var $d2 =$("#navbar_ul_grade");
		  var $d3 =$("#navbar_ul_board");
		  $d1.addClass("dropdown-menu");
		  $d2.addClass("dropdown-menu");
		  $d3.addClass("dropdown-menu");
		  
	};
	return {
		init:init
	}
})();
var controller=(function(){
	var init=function(){
		
	};
	var moveTo=function(dir,page){
		location.href=app.ctx()+'/'+dir+".do?action=move&page="+page;
	};
	var List=function(dir,page,num){
		location.href=app.ctx()+"/"+dir+".do?action=list&page="+page+"&num="+num;
	};
	var gms_del=function(name){
		  	var person = prompt("삭제할 "+name, "입력");
	};
	var updateStudent=function(id){
			location.href=app.ctx()+"/member.do?action=update&page=member_update&id="+id;
		};
	var deleteStudent=function(id){
			location.href=app.ctx()+"/member.do?action=delete&page=member_list&id="+id;
		};
	var detailStudent=function(id){
			location.href=app.ctx()+"/member.do?action=detail&page=member_detail&id="+id;
		};
	var searchStudent=function(num){
		var search_id=$("#search_id").val();
		location.href=app.ctx()+"/member.do?action=search&page=member_list&num="+num+"&search_id="+search_id;
	  };
	return {
		init:init,
		moveTo:moveTo,
		List:List,
		gms_del:gms_del,
		updateStudent:updateStudent,
		deleteStudent:deleteStudent,
		detailStudent:detailStudent,
		searchStudent:searchStudent
	};
})();
var home=(function(){
	var init=function(){
		
	};
	return {
		
	};
})();
var member=(function(){
	var init=function(){
		$('#loginBtn').on('click',function(){
		
			if($("#id").val()===""){
				alert('아이디 없음');
				return false;
			}
			if($("#pass").val()===""){
				alert('비밀번호 다름');
				return false;
			}
			$('#login_box').attr('action',app.ctx()+"/common.do");
			/*var form=$('#login_box');
			form.method="post";
			form.action=app.ctx()+"/common.do";*/
			return true;
		});
	};

	return {
		init:init
	};
})();
var memberDetail=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('#updateBtn').on('click',function(){
			//id,pw,name,phone,email,title;
			sessionStorage.setItem('id',$('#pid').text());
			sessionStorage.setItem('name',$('#pname').text());
			sessionStorage.setItem('phone',$('#pphone').text());
			sessionStorage.setItem('email',$('#pemail').text());
			controller.moveTo('member','member_update');
		});
	};
	var setContentView=function(){
		
	};
	return {
		init:init
	};
})();

var memberUpdate=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('confirmBtn').on('click',function(){
			
		});
		//id,pw,name,phone,email,title;
		
		controller.moveTo('member','member_update');
		
	};
	var setContentView=function(){
		var id=sessionStorage.setItem('id');
		var phone=sessionStorage.setItem('phone');
		var email=sessionStorage.setItem('email');
		var password=$('#confirm').val();
		$('#phone').attr('placeholder',phone);
		$('#email').attr('placeholder',email);
		$('confirmBtn').on('click',function(){
			
		});

	};
	return {
		init:init
	};
})();