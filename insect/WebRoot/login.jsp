<%@ page language="java" pageEncoding="GBK"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<%
	String t = request.getParameter("t");
	String style = "Msg-error Msg-hidde dib";
	if ("timeout".equals(t)) { // session timeout
		style = "Msg-error dib";
	}
%>
<!DOCTYPE html >
<style>
html { overflow-x:hidden ;}
</style>
<html>
	<head>
		<title>������ֲ�ﱣ��վ</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<link rel="stylesheet" href="/insect/css/bootstrap.min.css" />
	    <script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	    <script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script type="text/javascript" src="/insect/js/bootstrap.min.js"></script>
		<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <script type="text/javascript" src="/insect/javascript/My97DatePicker/WdatePicker.js"></script>

	    <script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	    <script type="text/javascript" src="/insect/javascript/common.js"></script>
	</head>
<script type="text/javascript">
window.onload=function(){
  var height = Math.max(document.documentElement.clientHeight, document.body.offsetHeight);
  height=height-84;
  document.getElementById('container').style.height=height+'px';
}
</script>
<body>
		<div id="container" class="container">
		    <div class="login">
			<form  class="form-horizontal">
				<div class="form-group">
					<div class="col-md-5">
						<span class="glyphicon glyphicon-user " style="float: left;margin-top: 10px;"></span><input  name="username" id="username" maxlength="50" type="text" style="float: left;margin-left: 16px;height: 34px;width: 155px;" class="form-control" placeholder="�û���" autofocus="autofocus"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-5">
						<span class="glyphicon glyphicon-lock " style="float: left;margin-top: 10px;"></span><input name="password" id="password" maxlength="50" type="password" style="float: left;margin-left: 16px;height: 34px;width: 155px;" class="form-control" placeholder="����"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-5" style="width: 340px">
						<span class="glyphicon glyphicon-picture" style="float: left;margin-top: 10px;"></span><input id="yzm" name="yzm" maxlength="4" type="text" style="float: left;margin-left: 16px;width: 70px;" class="form-control" placeholder="��֤��"/>
						<a href="javascript:void(0);" onclick="hqyzm()" style="margin-left: 5px"><img id="yzmtp" src="/insect/hqyzm.do?ACT_TYPE=QUERY"/></a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-1" style="margin-left: 60px;">
						<a href="javascript:void(0);"  class="btn btn_normal" id="btnLogin" ><span><i></i>��¼</span></a>
					</div>
				</div>
				<div class="form-group">
					<div>
					 <p id="errMsg" class="<%=style %>">�Ự�ѳ�ʱ�������µ�¼</p>
					</div>
				</div>
			</form>
			</div>
			<!-- ���� -->
			   <div class="box">
                 <div class="test">
                 <img class="img-rounded" src="/insect/images/piaochong.png">
                 </div>
                 <div class="test1">
                 <img class="img-rounded" src="/insect/images/yachong.png">
                 </div>
                 <div class="test2">
                 <img class="img-rounded" src="/insect/images/mazha.png">
                 </div>
                 <div class="test3">
                 <img class="img-rounded" src="/insect/images/renwu.png">
                 </div>
                 <div class="test4">
                 <img class="img-rounded" src="/insect/images/yanjiu.png">
                 </div>
               </div>
		</div>
		<script type="text/javascript">
function hqyzm()
{
document.getElementById("yzmtp").src="/insect/hqyzm.do?ACT_TYPE=QUERY&"+Math.random();
}
	$(document).ready(function(){
		$("#btnLogin").on("click", function(){
			var $uname = $("#username");
			var $passwd = $("#password");
			var $yzm = $("#yzm");
			var $errMsg = $("#errMsg");
			if ($uname.val() == "") {
				$errMsg.html("�û�������Ϊ��");
				$errMsg.removeClass().addClass("Msg-error dib");
				$uname.focus();
				return;
			}
			if ($passwd.val() == "") {
				$errMsg.html("���벻��Ϊ��");
				$errMsg.removeClass().addClass("Msg-error dib");
				$passwd.focus();
				return;
			}
			if ($yzm.val() == "") {
				$errMsg.html("��������֤��");
				$errMsg.removeClass().addClass("Msg-error dib");
				$yzm.focus();
				return;
			}
			$errMsg.html("").removeClass();
			$.ajax({
			    url: "/insect/login.do?ACT_TYPE=QUERY",
			    dataType: "text",
			    data: {"username": $uname.val(), "password":$passwd.val(),"yzm":$yzm.val()},
			    type: "GET",
			    success: function(result){
				    if(result == "SUCCESS"){
			        	window.location = "/insect/index.jsp";
				    } else if(result == "NAMERR"){
			        	$errMsg.html("�û������������");
						$errMsg.removeClass().addClass("Msg-error dib");
				    } else if(result == "SYSERR"){
			        	$errMsg.html("ϵͳ�������Ժ�����");
						$errMsg.removeClass().addClass("Msg-error dib");
				    }else if(result == "YZMERR"){
				        $errMsg.html("�Բ�����֤�벻��ȷ���������");
						$errMsg.removeClass().addClass("Msg-error dib");
				    }
			    },
			    error: function(){
			    	$errMsg.html("ϵͳ������ˢ������");
					$errMsg.removeClass().addClass("Msg-error dib");
			    }
			});
		});
		$("#username, #password").on("keyup",function(e){
			if (e.keyCode == 13) {
				$("#btnLogin").click();
			}
		});
	});
		</script>
    <div id="footer" class="footer">
        <div class="section">
        	<p class="copyright tc"><span>����ֲ�ﱣ��վ��Ȩ����</span></p>
            <p class="support tc">
                <span>�й�ũҵ��ѧ����֧��</span>
                <span><a href="#">�����ʷ�������Ϣ�������޹�˾</a>����<span>
            </p>
        </div>
    </div>		
</body>
</html>