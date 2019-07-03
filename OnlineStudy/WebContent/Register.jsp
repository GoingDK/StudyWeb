<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>注册界面</title>
		<link rel="stylesheet" href="css/layui.css"  media="all">
		<link href="css/layer.css" type="text/css" rel="stylesheet"/>
		<link rel="stylesheet" href="css/layui.mobile.css"  media="all">
		<script src="js/layui.all.js" ></script>
		<style type="text/css">
			*{
				
				margin: 0px;
				padding: 0px;
				
			}
			.di{
				position: absolute;
				height: 100%;
				width: 100%;
				background:url(img/yinhe.jpg);
				background-size:cover ;
				
			}
			.left{
				float: left;
				position: absolute;
				width: 29%;;
				height: 100%;
				background:url(img/left1.png);
				
			}
			.left p{
				position: relative;     /*行内元素变块元素*/
				margin-top: 60%;
				text-align: center;     /*文本水平居中*/
				line-height: 100%;     /*文本垂直居中（等于盒子/块元素高度）*/
				font-size: 60px;
				color: white;
			}
			.left h4{
				position: relative;     /*行内元素变块元素*/
				margin-top: 3%;
				text-align: center;     /*文本水平居中*/
				line-height: 100%;     /*文本垂直居中（等于盒子/块元素高度）*/
				font-size: 20px;
				color: white;
			}
			.right{
				height: 450px;
				width: 340px;
			    position:absolute;
				top: 50%;            /*盒子左上角水平居中*/
				left: 54%;            /*盒子左上角垂直居中*/
				background: white;
				/*margin-left: -100px;  */       /*盒子左移（width/2）*/
				margin-top: -250px;         /*盒子上移（height/2）*/
			}
			.right h1{
				position: relative; 
				text-align: center; 
				margin-top: 18px;
				margin-bottom: 15px;
			}
			.layui-form-item{
				margin-left: -30px;
			}
			.layui-input-block{
				width: 60%;
			}
			
			.tijiao{
				position:absolute;
				left: 35%;            /*盒子左上角垂直居中*/
				margin-left: -45px;
				
			}
			.xuanze{
				margin-top: 16px;
				margin-left:-5%;
				
			}
			
			.qvxiao{
				position:absolute;
				left: 70%;            /*盒子左上角垂直居中*/
				margin-left: -45px;
				
			}
		
		</style>
</head>
<body>
	<div class="di">
			
		</div>
		
		<div class="left">
			<p>Start learning</p>
			<h4>最权威的在线学习网站</h4>
			
		</div>
		<div class="right">
		<div class="layui-anim layui-anim-up layui-anim-scaleSpring">
			<h1 >注册</h1>
			<form action="Register" method="post">
			    <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input name="user" class="layui-input" 
                            	type="text" placeholder="字母开始，6< 字符长度 <20" id="us"
                               required	pattern="^[a-zA-Z]{1}[a-zA-Z0-9]{5,19}$" autocomplete="off" lay-verify="title"/>
                        </div>
		        </div>
		        
		        <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input name="psd" id="pwd" class="layui-input" pattern="^[a-zA-Z0-9_]\w{5,17}$"
                            	type="password" placeholder="6< 字符长度 <20" 
                            	onkeyup="lalala()" required
                            	autocomplete="off"><span id="tishi1"></span>
                        </div>
                 </div>  
                 		        <div class="layui-form-item">
                    <label class="layui-form-label">重复密码</label>
                        <div class="layui-input-block">
                            <input name="psd" id="pwd1" required
                            class="layui-input" type="password" placeholder="" onkeyup="validate()"
                            	autocomplete="off"><span id="tishi"></span>
                        </div>
                 </div>         
                        
                        
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" required 
                pattern="[\u4e00-\u9fa5]{0,5}" placeholder="请填写您的姓名" autocomplete="off" lay-verify="title">
                        </div>
		        </div>
		        <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
				<input name="email" class="layui-input" required 
						pattern="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                            	type="email" autocomplete="off" lay-verify="title">
                        </div>
		        </div>        
	
		         
		        <div class="xuanze" pane="">
                    <div class="layui-input-block">
                        <input name="man" title="教师" type="radio" value="teacher" >教师
                        <input name="man" title="学生" type="radio" value="student" checked="checked" style="margin-left: 70px;">学生
                    </div>
                </div>

		        
		        <div class="qvxiao layui-btn layui-btn-normal layui-btn-radius">
                    <h2 onclick="window.location.href='Login.jsp'">返回</h2>
                </div>
                <div class="tijiao">
                    <button  type="submit" class="layui-btn layui-btn-normal layui-btn-radius"><h2>注册</h2></button>
                </div>
                </form>
		    </div></div>
		
	<script>
       function validate() {
if(document.getElementById("pwd").value==document.getElementById("pwd1").value) {
document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
document.getElementById("submit").disabled=false;
}
else {
document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
document.getElementById("submit").disabled=true;
}
}
	function lalala(){
		if(document.getElementById("pwd").value==document.getElementById("us").value) {
document.getElementById("tishi1").innerHTML="<font color='red'>不能与用户名相同</font>";
document.getElementById("submit").disabled=true;
}else {
document.getElementById("tishi1").innerHTML="<font></font>";
document.getElementById("submit").disabled=false;
}
	}
    </script>
<% if(request.getAttribute("message")=="no"){ %>
<script>
layer.open({
  title: '注册提示'
  ,content: '已存在该账号！'
});    
  
</script>

<%	}else if(request.getAttribute("message")=="ok"){%>
<script>
layer.open({
  title: '注册提示'
  ,content: '注册成功，返回登陆页面！'
  ,yes: function(index, layero){
    window.location.href="Login.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%} %>
</body>
</html>