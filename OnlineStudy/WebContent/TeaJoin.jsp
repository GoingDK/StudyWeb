<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import='java.util.*'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>加入课程</title>
			<link rel="stylesheet" href="css/layui.css" media="all">
			
			<link rel="stylesheet" href="css/join_class.css" />
			<link href="css/layer.css" type="text/css" rel="stylesheet"/>
		    <script src="js/layui.all.js" ></script>
</head>
<body>
<jsp:useBean id="teabean" type="model.TeacherBean" scope="session" />
<jsp:useBean id="seabean" type="model.SearchBean" scope="session" />


			<div class="di">

				<div class="head">

					<ul class="layui-nav layui-bg-cyan ">
						<div class="layui-row">
							<div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
							<form action="Searchts" method="get">
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
									<a href="">个人信息</a>
								</li>
								<li class="layui-nav-item">
									<a href="Coursest">我的课程</a>
								</li>
								<li class="layui-nav-item">
									<a href="">设置</a>
								</li>
								<li class="layui-nav-item">
									<a href="Logout?action=logout">退出</a>
								</li>
								<li class="layui-nav-item">
									<a><jsp:getProperty name="teabean" property="tname"/></a>
									
								</li>
							</div>
						</div>
					</ul>

				</div>
<% 

int i=Integer.parseInt(request.getParameter("i"));
List<Integer> cid=seabean.getCid();
List<String> cname=seabean.getCname();
List<Integer> cpic=seabean.getCpic();
List<String> cin=seabean.getCin();
List<String> tname=seabean.getTname();
%>	
				<div class="contern">
					<div class="box">
						<div class="box1">
					
						</div>

						<div class="box2">
							<div class="class_area">
							<div class="class_one">
		<lable class="cla_name"><%= cname.get(i) %></lable>
		<lable class="tea_name"><%= tname.get(i) %></lable>
		   </div>
		   <img class="img_cla" src="img/<%= cpic.get(i) %>.jpg" alt="计算机网络"title="计算机网络"  />
		   <div class="text_area1">
		      	<p class="p_area"><%= cin.get(i) %></p>
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