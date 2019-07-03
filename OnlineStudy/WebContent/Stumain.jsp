<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人空间</title>
			<link href="css/layer.css" type="text/css" rel="stylesheet"/>
			<link rel="stylesheet" href="css/layui.css" media="all"/>
			<script src="js/layui.all.js" ></script>
			<link rel="stylesheet" href="css/own_space.css" />
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
						<div class="box1">

						</div>

						<div class="box2">
							<span class="span_one">学术动态 Moments </span>
							<div class="box_class">
								<div class="class_one">
									<a href="">
										<img class="img_all" src="img/0.jpg" alt="计算机网络" title="计算机网络" />
									</a>
									<span class="button_all">
										<a href="">
										<button class="img_button1" type="button" name="img_button1">计算机网络</button>
										</a>
											
										<a href="">
										<button class="img_button2" type="button" name="img_button2">柴进</button>
										</a>
									</div>
	<div class="text_area1">
	<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
	<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
	<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
	<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
</div>
</div>
<div class="box_class">
	<div class="class_one">
		<a href="">
		<img class="img_all" src="img/11.jpg" alt="PHP程序设计" title="PHP程序设计" />
		</a>
		<div class="button_all">
			<a href="">
			<button class="img_button1" type="button" name="img_button1">PHP程序设计</button>
			</a>
			<a href="">
			<button class="img_button2" type="button" name="img_button2">梁进良</button>
			</a>
		</div>
		<div class="text_area1">
			<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
			<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
		</div>
	</div>
</div>
		<div class="box_class">
		<div class="class_one">
			<a href="">
			<img class="img_all" src="img/9.jpg" alt="软件项目管理"title="软件项目管理"/>
			</a>
			 <div class="button_all">
			 <a href="">
			<button class="img_button1" type="button" name="img_button1">软件项目管理</button>
			</a>
			<a href="">
			<button class="img_button2" type="button" name="img_button2">吕老师</button>
			</a>
		      </div>
		      <div class="text_area1">
		    <label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
			<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
		      </div>
		</div>
		</div>
		<div class="box_class">
			<div class="class_one">
				<a href="">
			<img class="img_all" src="img/12.jpg" alt="系统分析与设计"title="系统分析与设计"  />
			</a>
			  <div class="button_all">
			  	<a href="">
			<button class="img_button1" type="button" name="img_button1">系统分析与设计</button>
			</a>
			<a href="">
			<button class="img_button2" type="button" name="img_button2">梁进良</button>
			</a>
		      </div>
		      <div class="text_area1">
		      <label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
			<label class="right_one"> 课程设计报告模板(20页左右).docx </label>
			<label class="right_two"> 发布人：梁进良  | 上传时间：2019-02-24 | 下载次数：72| 大小：140KB </label>
		      </div>
		</div>
		</div>
		


</div> 
				</div>
			</div>
	
		
		<div class="foots">
			<p>软件项目管理在线学习网站</p>
		</div>
	</div>	

<% System.out.println("1");
if(request.getAttribute("message")=="nomess"){ %>
<script>
layer.open({
  title: '错误操作'
  ,content: '搜索失败，不能为空！'
});    
  
</script>
<%	}else if(request.getAttribute("message")=="ok"){
System.out.println("2");%>
<script>
layer.open({
  title: '搜索结果'
  ,content: '搜索成功！'
  ,yes: function(index, layero){
    window.location.href="StuSearch.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%}else if(request.getAttribute("message")=="no"){%>
<script>
layer.open({
  title: '搜索结果'
  ,content: '没有该课程！'
});    
</script>
<%}%>
</body>
</html>