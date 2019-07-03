<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import='java.util.*'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的课程</title>
			<link rel="stylesheet" href="css/layui.css" media="all">
			<script src="js/layui.js" charset="utf-8"></script>
			<link rel="stylesheet" href="css/search_class.css" />
</head>
<body>
<jsp:useBean id="bean" type="model.StudentBean" scope="session" />
<jsp:useBean id="mybean" type="model.MyCourseBean" scope="session" />

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
						<div class="box1">

						</div>

						<div class="box2">
							<span class="span_one">我的课程 </span>
<% int count;
List<Integer> csid=mybean.getCsid(); //
List<String> cname=mybean.getCname();//课程名字
List<Integer> cpic=mybean.getCpic();//课程图片
count=csid.size();
for(int i=0;i<count;i++){%>	
<div class="box_class">
								<div class="class_one">
								
										<img class="img_all" src="img/<%= cpic.get(i) %>.jpg" />
									<div class="button_all">	
										<a href="Homework?i=<%=i%>" class="img_button1"><%= cname.get(i) %></a>
										<a class="img_button2">退出课程</a>
									</div>

</div>
</div>	

<%}%>							


</div> 
				</div>
			</div>
	
		
		<div class="foots">
			<p>软件项目管理在线学习网站</p>
		</div>
	</div>	
</body>
</html>