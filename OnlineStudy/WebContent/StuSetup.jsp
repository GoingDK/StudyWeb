<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置</title>
			<link href="css/layer.css" type="text/css" rel="stylesheet"/>
			<link rel="stylesheet" href="css/layui.css" media="all"/>
			<script src="js/layui.all.js" ></script>
			<link rel="stylesheet" href="css/own_space.css" />
			<link rel="stylesheet" href="css/secreet.css" />
</head>
<body>
<jsp:useBean id="bean" type="model.StudentBean" scope="session" />
			<div class="di">

				<div class="head">

					<ul class="layui-nav layui-bg-cyan ">
						<div class="layui-row">
							<div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
							<form action="Searchs" method="get">
								<li class="layui-nav-item ">
										<div class="layui-input-block">
											<input name="search" class="layui-input" type="text" placeholder="" autocomplete="off" lay-verify="title">
										</div>
								</li>

								<li class="layui-nav-item ">
										<button class="layui-btn 
		    	    		layui-btn-primary 
		    	    		layui-btn-radius
		    	    		layui-btn-sm" type="submit">搜索</button>
								</li>
							</form>
							</div>

							<div class="layui-col-xs4 layui-col-sm5 layui-col-md4">
								<!--<li class="layui-nav-item layui-this">-->
								<li class="layui-nav-item">
									<a href="StuPerson.jsp">个人信息</a>
								</li>
								<li class="layui-nav-item">
									<a href="Coursess">我的课程</a>
								</li>
								<li class="layui-nav-item">
									<a href="StuSetup.jsp">设置</a>
								</li>
								<li class="layui-nav-item">
									<a href="Logout?action=logout">退出</a>
								</li>
								<li class="layui-nav-item">
									<a><jsp:getProperty name="bean" property="sname"/></a>
									
								</li>
							</div>
						</div>
					</ul>

				</div>
								<div class="contern">
					<div class="box">
						

						<div class="box2">
							<span class="span_one">设置 Secret </span>
							
							
							<div class="password">
								<form class="repassword">
									
								  <div class="pwd1">
									<lable class="newpassword">新的密码/New Password: &nbsp;&nbsp;&nbsp;</lable> 
									<div class="inputpassword">
										  <input class="Tpwd" type="password" name="password" lay-verify="tips" autocomplete="off" id="LAY_password" placeholder="***********************" style="letter-spacing: 2px;">
										  <br>
									<div class="words">密码必须在6个字符以上，可由数字和字母或符号混合组成。</div>
									</div>
									<br>
									<br>
								  </div>

									<div class="pwd2">
										<lable class="Cpassword">确认密码/Confirm Password: </lable> 
										<div class="inputpassword2">
										  <input class="Tpwd2" type="password" name="repassword" lay-verify="repass" autocomplete="off"  placeholder="***********************" style="letter-spacing: 2px;">
											<br>
										<div class="words">请再输入一遍您上面输入的密码。</div>
									  </div>
										<br>
									</div>
									
								</form>
								
							  <div class="layui-form-item">
								<div class="inputpassword3">
									<button class="btn" lay-submit lay-filter="setmypass">确认修改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn" lay-submit lay-filter="setmypass">返回*//</button>
								</div>
								  <br>
							</div>
								
						  </div>


						</div> 

					</div>
				
				
							</div>
						
						
		
		<div class="foots">
			<p>软件项目管理在线学习网站</p>
		</div>
	</div>	
</body>
</html>