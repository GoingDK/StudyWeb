<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import='java.util.*' import='java.sql.Date' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>课程作业</title>
		<link rel="stylesheet" href="css/layui.css"  media="all">
		<script src="js/layui.all.js" charset="utf-8" ></script>
		<link rel="stylesheet" href="css/Classinfo.css" />
		<link href="css/layer.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<jsp:useBean id="bean" type="model.StudentBean" scope="session" />
<jsp:useBean id="hwbean" type="model.HomeworkBean" scope="session" />
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
					<div class="img" id="img1" style="">
					<a href="">
						<img src="img/1.jpg" height="100%" width="100%" alt="" style="border-radius: 20px;" />
					</a>
					<span><b>班级信息</b></span>
				</div>
				
				<div class="img" id="img2" style="">
					<a href="">
						<img src="img/2.jpg" height="100%" width="100%" alt="" style="border-radius: 20px;"/>
					</a>
					<span><b>教学资源</b></span>
				</div>
				
				<div class="img" id="img3" style=";">
					<a href="StuHomeWork.jsp">
						<img src="img/3.jpg" height="100%" width="100%" alt="" style="border-radius: 20px;"/>
					</a>
					<span><b>课程作业</b></span>
				</div>
				
				<div class="img" id="img4" style="">
					<a href="">
						<img src="img/4.jpg" height="100%" width="100%" alt="" style="border-radius: 20px;"/>
					</a>
					<span><b>互动交流</b></span>
				</div>
		
				</div>
				
				<div class="box2">
					<div class="biaoti">
						<span class="span_one">课程作业</span>
					</div>
<%
int count;
List<Integer> wid=hwbean.getWid() ;//作业id
List<String> state=hwbean.getState() ;//作业状态
List<String> stitle=hwbean.getStitle() ;//作业标题
List<Date> deadtime=hwbean.getDeadtime();
count=wid.size();


%>
					<div>

<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th></th>
      <th>状态</th>
      <th>作业标题</th>
      <th>截止时间</th>
      <th>操作</th>
      <th></th>
      <th></th>
    </tr> 
  </thead>
  <tbody>
<% for(int i=0;i<count;i++){%>	
<form action="Uploads" method="post" enctype="multipart/form-data">
    <tr>
      <td><div style="display:none;"><input name=i value="<%=i %>"/></div></td>
      <td><%=state.get(i) %></td>
      <td><%=stitle.get(i) %></td>
      <td><%=deadtime.get(i) %></td>
      <td><input type="file" name="file"/></td>
      <td><input type="submit" value="上传文件"/></td>
      <td><a href="Uploads?wid=<%=wid.get(i) %>">下载</a></td>
    </tr>
</form>	
<%}%> 
    
  </tbody>
</table>
			</div>
				</div>
				</div>
				</div>
		<div class="foots">
			<p>软件项目管理在线学习网站</p>
		</div>
		</div>
		
<% if(request.getAttribute("info")=="no"){ %>
<script>
layer.open({
  title: '上传提示'
  ,content: '上传文件失败！'
});    
  
</script>

<%	}else if(request.getAttribute("info")=="ok"){%>
<script>
layer.open({
  title: '上传提示'
  ,content: '上传文件成功！'
  ,yes: function(index, layero){
    window.location.href="StuHomeWork.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%}else if(request.getAttribute("info")=="okk"){%>
<script>
layer.open({
  title: '文件修改提示'
  ,content: '文件修改成功！'
  ,yes: function(index, layero){
    window.location.href="StuHomeWork.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%}else if(request.getAttribute("info")=="upno"){%>
<script>
layer.open({
  title: '文件下载提示'
  ,content: '下载失败！'
  ,yes: function(index, layero){
    window.location.href="StuHomeWork.jsp";
    layer.close(index); //如果设定了yes回调，需进行手工关闭
  }
});    
  
</script>
<%}%>
</body>
</html>