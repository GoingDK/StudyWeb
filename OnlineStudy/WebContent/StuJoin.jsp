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
<jsp:useBean id="bean" type="model.StudentBean" scope="session" />
<jsp:useBean id="clabean" type="model.ClassBean" scope="session" />
<jsp:useBean id="seabean" type="model.SearchBean" scope="session" />


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
<% int i=clabean.getCid();
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
		      <div class="boxx">
		      
		      <a onclick="join()" class="layui-btn layui-btn-fluid layui-bg-gray btn_join">加入课程</a>
			</div>
			</div>				
			
</div> 
				</div>
			</div>
		<div class="foots">
			<p>软件项目管理在线学习网站</p>
		</div>
	</div>
	
	
<div id="popSearchRoleTest" style="display:none;">
<% 
List<Integer> claid =clabean.getClaid();//班级id
List<String> classes =clabean.getClasses();//课程班级
List<String> cpass =clabean.getCpass();//密码
int count=claid.size();
%>
<form class="layui-form" action="Joinclick" method="Post" name="joinf">
  <div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
      <select name="classname" lay-filter="classname" >
        <option value="00"></option>
        <%for(int o=0;count>o;o++){%>
        	<option value='<%=o%>'><%=classes.get(o) %></option>
       <% } %>
      </select>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">班级密码</label>
	<div class="layui-input-block">
      <input type="text" name="classpass" autocomplete="off" required="required" placeholder="请输入课程密码" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" type="submit" >立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
	</div>
<script type="text/javascript">
function join(){
	layer.open({
		type:1,
        title:"选择加入班级",
        area: ['50%','45%'],
        content:layui.$("#popSearchRoleTest").html(),
        btn: ['取消'] //可以无限个按钮
    });
	layui.use('form', function(){  //此段代码必不可少
	    var form = layui.form;
	    form.render();
	    
/*		form.on('select(classname)', function(data){
			  console.log(data.value); //得到被选中的值
			  console.log(data.elem[data.elem.selectedIndex].text);
			  form.render('select');
			}); */
	});
}


</script>	

<% if(request.getAttribute("message")=="no"){ %>
<script>
layer.open({
  title: '加入提示'
  ,content: '成功加入该班级，可在我的课程中查看！'
});    
  
</script>

<%	}else if(request.getAttribute("message")=="ok"){%>
<script>
layer.open({
  title: '加入提示'
  ,content: '您已加入该班级，请勿重复加入！'
});    
  
</script>
<%}else if(request.getAttribute("message")=="np"){%>
<script>
layer.open({
  title: '加入提示'
  ,content: '密码错误！'
});    
  
</script>
<%} %>
</body>
</html>