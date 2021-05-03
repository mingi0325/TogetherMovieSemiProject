<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script type="text/javascript" src="script/member.js"></script>

  <title>로그인</title>
  <style>
  
  
  
 .login { width: 410px; position: absolute; left: 50%; top: 50%;  transform: translate(-50%, -50%); text-align: center;}
.login h2 { padding:0 0 20px; border-bottom: 2px solid #111; text-align: center; line-height:1; font-size: 32px; color: #111;}
.login > ul { padding: 40px 0 33px;}
.login > ul li { padding:0 0 12px; text-align: left;}
.login > ul li input { width: 100%; height: 46px; box-sizing: border-box; text-indent: 16px;}
.login > ul li input::-webkit-input-placeholder { font-size:16px; color:#9fa19f;}
.login > ul li input[type="checkbox"] { position:absolute; left: -3000%;}
.login > ul li input[type="checkbox"] + label { height: 36px; line-height: 36px;}
.login > ul li input[type="checkbox"] + label:before { content: ""; display:inline-block; margin:0 10px 0 0; width: 18px; height: 18px; border:1px solid #666; background:#fff;
vertical-align: -5px;}
.login > ul li input[type="checkbox"]:checked + label:before {background: url(../images/ico_check_on.png) no-repeat center #333; border-color:#333;}
.login button { width: 100%; height: 56px; background:#f39c12; font-size: 18px; color:#fff;}
.login div { padding: 0 0 45px;}
.login div ul { display: flex; justify-content: center;}
.login div ul li { position: relative; padding: 0 18px;}
.login div ul li ~ li:after { content: ""; position: absolute; left: 0; top: 4px; height:14px; width: 1px; background: #111; transform: rotate(25deg);}
.login div ul li a { font-size: 14px; color:#111;}
.login > a { font-size: 14px; color:#666; border-bottom: 1px solid #666;}
  
@charset "utf-8";
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');

/* Reset */
html,body,h1,h2,h3,h4,h5,h6,div,p,blockquote,pre,code,address,ul,ol,li,menu,nav,section,article,aside,
dl,dt,dd,table,thead,tbody,tfoot,label,caption,th,td,form,fieldset,legend,hr,input,button,textarea,object,figure,figcaption {margin:0;padding:0;}
body{background:#fff; min-width:320px; -webkit-text-size-adjust:none;word-wrap:break-word;word-break:break-all;}
body,input,select,textarea,button {border:none;font-size:12px; font-family:'Noto Sans KR', sans-serif;color:#727272;}
ul,ol,li{list-style:none;}
table{width:100%;border-spacing:0;border-collapse:collapse;}
img,fieldset{border:0;}
address,cite,code,em{font-style:normal;font-weight:normal;}
label,img,input,select,textarea,button{vertical-align:middle;}
.hide,caption,legend{line-height:0;font-size:1px;overflow:hidden;}
hr{display:none;}
main,header,section,nav,footer,aside,article,figure{display:block;}
a{color:#000;text-decoration:none;}

/* Form */
textarea { border:1px solid #dbdbdb;}
select { height:32px; font-size:13px; color:#373737; border:1px solid #e9e9e9; background:#fff;border-radius: 5px;}
input[type=tel],
input[type=time],
input[type=text],
input[type=password],
input[type=search],
input[type=email],
input[type=file],
input[type=url],
input[type=number],
input[type=date],textarea { height:30px; font-size:13px; color:#373737; border:1px solid #e9e9e9; background:#fff; transition: all 0.5s; vertical-align:middle;}
input::-webkit-input-placeholder{color:#b5b5b5; font-size:12px; line-height:100%;}
textarea { padding:5px 0;}
select:focus,
textarea:focus,
input:focus { border: 1px solid #727272;}

input[type=tel][readonly],
input[type=text][readonly],
input[type=password][readonly],
input[type=email][readonly],
input[type=search][readonly],
input[type=tel][disabled],
input[type=text][disabled],
input[type=password][disabled],
input[type=search][disabled],
input[type=email][disabled]{background:#eaeaea; border-color:#c0c0c0; color:#666; -webkit-appearance:none;font-size:12px;}
textarea[readonly],
textarea[disabled]{padding:11px; font-size:16px; color:#666; font-weight:normal; line-height:140%; height:78px; background:#eaeaea;border:1px solid #c0c0c0;}

.clear {clear:both;}
.clear:after { content:""; display:block; clear:both;}
 
  
 
  
  
  </style>
</head>
<body>

  <form action="login.do" method="post" name="frm">
	  <section class="login">
	  <input type="hidden" name="beforeUrl" value =<%=(String)request.getHeader("REFERER") %>>
	    <h2>로그인</h2>
	    <ul>
	      <li><input type="text" placeholder="아이디"  name="userId" value="${userId }"></li>
	      <li><input type="password" placeholder="비밀번호"  name="userPassword"></li>
	      <li><input style="color: red">${message }</li>
	      <li><button onclick="return loginCheck()">로그인</button></li>
	    </ul>
	    <div>
	      <ul>
	      <li><a href="">회원가입</a></li>
	      <li><a href="">아이디 찾기</a></li>
	      <li><a href="">비밀번호 찾기</a></li>
	      </ul>
	    </div>
	  </section>
  </form>	



</body>
</html>