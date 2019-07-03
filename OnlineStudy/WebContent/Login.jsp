<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>软件项目管理在线学习网站</title>
		<link rel="stylesheet" href="css/layui.css"  media="all">
		<link href="css/layer.css" type="text/css" rel="stylesheet"/>
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
				height: 300px;
				width: 340px;
			    position:absolute;
				top: 50%;            /*盒子左上角水平居中*/
				left: 54%;            /*盒子左上角垂直居中*/
				background: white;
				/*margin-left: -100px;  */       /*盒子左移（width/2）*/
				margin-top: -150px;         /*盒子上移（height/2）*/
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
			
			.zhuce{
				position:absolute;
				left: 35%;            /*盒子左上角垂直居中*/
				margin-left: -45px;
				
			}
			.xuanze{
				margin-top: 16px;
				margin-left:3.5%;
				
			}
			
			.queren{
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
			<h1 >登录</h1>
			<form action="Login" method="post">
			    <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input name="username" class="layui-input" 
                            	type="text" placeholder="请输入账号" 
                            	autocomplete="off" lay-verify="title">
                        </div>
		        </div>
		        <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input name="password" class="layui-input" 
                            	type="password" placeholder="请输入密码" 
                            	autocomplete="off">
                        </div>
                        
	
		         
		        <div class="xuanze" pane="">
                    <div class="layui-input-block">
                        <input name="man" title="教师" type="radio" value="tea" >教师
                        <input name="man" title="学生" type="radio" value="stu" checked="checked" style="margin-left: 70px;">学生
                    </div>
                </div>

		        
		        <div class="queren">
                    <button class="layui-btn layui-btn-normal layui-btn-radius" type="submit"><h2>确认</h2></button>
                </div>
				<div class="zhuce layui-btn layui-btn-normal layui-btn-radius">
                    <h2 onclick="window.location.href='Register.jsp'">注册</h2>
                </div>
		    </div>
		    </form>
		        
		    </div>
		
<% if(request.getAttribute("message")=="no"){ %>
<script>
layer.open({
  title: '登陆提示'
  ,content: '登陆失败，请重新登陆！'
});    
  
</script>

<%	}else if(request.getAttribute("message")=="ok"){%>
<script>
layer.open({
  title: '登陆提示'
  ,content: '学生登陆成功！'
  ,yes: function(index, layero){
    window.location.href="Stumain.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%}else if(request.getAttribute("message")=="okk"){%>
<script>
layer.open({
  title: '登陆提示'
  ,content: '老师登陆成功！'
  ,yes: function(index, layero){
    window.location.href="Teamain.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%} %>
</body>
</html>