<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人信息</title>
			<link href="css/layer.css" type="text/css" rel="stylesheet"/>
			<link rel="stylesheet" href="css/layui.css" media="all"/>
			<script src="js/layui.all.js" ></script>
			<link rel="stylesheet" href="css/own_space.css" />
			<link rel="stylesheet" href="css/personal_message.css" />
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
							<span class="span_one">个人信息 Message </span>
							
							
							<div class="image_massage">
								<div class="layedit-tool-image">
									<div style="width: 20%; height: 250px; margin-left: 4%; margin-top: 3%; border: 4px solid #FFFFFF;"></div>
								</div>
								<div class="href_area">
								<div class="layui-input-inline layui-btn-container">
									<div class="button_three"><button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">上传照片</button></div>
								</div>
								</div>
								<br>
								<div class="words"><div class="layui-form-mid layui-word-aux">上传图片注意事项（图片格式、图片大小）</div></div>
								
							</div>
							
							<div class="line" ></div>

							
							<div class="information">
							<div class="message">
							<div class="layui-form-item">
								<div class="lable"><label class="layui-form-labe">姓名/Name*</label></div>
								<div class="inptt">
									<input type="text" name="username" value="yiyi" lay-verify="username" autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
								</div>
								<br>
							</div>
								
							<div class="layui-form-item">
								<div class="lable"><label class="layui-form-labe">English Name</label></div>
								<div class="inptt">
									<input type="text" name="englishname" value lay-verify="englishname" autocomplete="off" placeholder="请输入Englishname" class="layui-input">
								</div>
								<br>
							</div>
								
							<div class="layui-form-item">
							<label class="lable">性别/Gender</label>
							<div class="inptt2">
							  <input type="radio" name="sex" checked="">男/Male
							  <div class="layui-unselect layui-form-radio layui-form-radioed">
								
							  </div>  
							  <input type="radio" name="sex" > 女/Female
							  <div class="layui-unselect layui-form-radio">
							 
							</div>
								<br>
						   </div>
							
						   </div>
								
							<div class="layui-form-item">
								<div class="lable"><label class="layui-form-labe">学历/Degree</label></div>
								<div class="inptt">
									<!--<select name="role" lay-verify>
										<option value="1" disabled>请选择学历</option>
										<option value="2">研究生</option>
										<option value="3" selected>本科</option>
										<option value="4">专科</option>
									</select>-->
									<div class="layui-unselect layui-form-select ">	<!--展开时加上 layui-form-selected-->
										<div class="layuii-select-title">
											<input type="text" placeholder="请选择" value="请选择学历" class="layui-input layui-unselect">
											<i class="layui-edge"></i>
										</div>
										<dl class="layui-anim layui-anim-upbit">
											<dd lay-value="1" class="layui-disabled">请选择学历</dd>
											<dd lay-value="2" class="layui-disabled">研究生</dd>
											<dd lay-value="3" class="layui-this">本科</dd>
											<dd lay-value="4" class="layui-disabled">专科</dd>
										</dl>
									</div>
								   <br>
								</div>
								
							</div>
								
							<div class="layui-form-item">
								<div class="lable"><label class="layui-form-labe">专业/Major</label></div>
								<div class="inptt">
									<input type="text" name="degree" value="" lay-verify="degree" autocomplete="off" placeholder="如有多个用“，”隔开" class="layui-input">
								</div>
								<br>
							</div>
								
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="layui-btn" lay-submit lay-filter="setmypass">返回*//</button>
								</div>
								  <br>
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