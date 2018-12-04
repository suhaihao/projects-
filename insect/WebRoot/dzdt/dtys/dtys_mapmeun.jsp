<%@page language="java" contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<script type="text/javascript">
function chake(rwsjVal,sjd,begin,end,zt,yss,bchVal,fxzbVal,fxfs)
{
if(yss==1)
{
if(zt==1)
{
var sjds=sjd.split(",");
var idx=parseInt(document.getElementById("now").value);
var now=rwsjVal+"-"+sjds[idx]
var dq = new Date(now.replace(/-/,"/")); 
var ks = new Date(begin.replace(/-/,"/")); 
if(dq.getTime()==ks.getTime())
{
alert("已经是开始时间了");
return;
}
document.getElementById("now").value=idx-1;
var rwsj=rwsjVal+"-"+sjds[idx-1];
document.getElementById("bt").innerHTML="当前年度："+rwsj;
document.getElementById("ifr_e").src="/insect/dzdt/dtys/dtys_map.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsj="+rwsj+"&fxfs="+fxfs;
}
else
{
var sjds=sjd.split(",");
var idx=parseInt(document.getElementById("now").value);
var now=rwsjVal+"-"+sjds[idx]
var dq = new Date(now.replace(/-/,"/")); 
var js = new Date(end.replace(/-/,"/"));
if(dq.getTime()==js.getTime())
{
alert("已经是结束时间了");
return;
} 
document.getElementById("now").value=idx+1;
var rwsj=rwsjVal+"-"+sjds[idx+1];
document.getElementById("bt").innerHTML="当前年度："+rwsj;
document.getElementById("ifr_e").src="/insect/dzdt/dtys/dtys_map.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsj="+rwsj+"&fxfs="+fxfs;
}
}
else
{
var sjds=sjd.split(",");
var nd=document.getElementById("nownd").value;
if(zt==1)
{
if(nd==sjds[0])
{
alert("已经是开始年度了");
return;
}
document.getElementById("nownd").value=parseInt(document.getElementById("nownd").value)-1;
var rwsj=(parseInt(document.getElementById("nownd").value)-1)+"-"+rwsjVal;
document.getElementById("bt").innerHTML="当前年度："+rwsj;
document.getElementById("ifr_e").src="/insect/dzdt/dtys/dtys_map.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsj="+rwsj+"&fxfs="+fxfs;
}
else
{
if(nd==sjds[sjds.length-2])
{
alert("已经是最后年度了");
return;
}
var rwsj=(parseInt(document.getElementById("nownd").value)+1)+"-"+rwsjVal;
document.getElementById("bt").innerHTML="当前年度："+rwsj;
document.getElementById("nownd").value=parseInt(document.getElementById("nownd").value)+1;
document.getElementById("ifr_e").src="/insect/dzdt/dtys/dtys_map.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsj="+rwsj+"&fxfs="+fxfs;
}
}
}
</script>
<head>
</head>
<body>
<%
 	String bchVal=request.getParameter("bchVal");
 	String fxzbVal=request.getParameter("fxzbVal");
 	String rwsjVal=request.getParameter("rwsjVal");
 	String sjd=request.getParameter("sjd");
 	String yss=request.getParameter("yss");
 	String fxfs=request.getParameter("fxfs");
 	String[] sjds=sjd.split(",");
 	String rwsj="";
 	String beginsj="";
 	String endsj="";
 	if(yss.equals("1"))
 	{
 	 rwsj=rwsjVal+"-"+sjds[0];
 	 beginsj=rwsjVal+"-"+sjds[0];
 	 endsj=rwsjVal+"-"+sjds[sjds.length-1];
 	}
 	else
 	{
 	 rwsj=sjds[0]+"-"+rwsjVal;
 	 beginsj=sjds[0]+"-"+rwsjVal;
 	 endsj=sjds[sjds.length-1]+"-"+rwsjVal;
 	}
 %>
<div id="content">
	<!-- navigation -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
                    <div>
                    <center>当前年度：<label id="bt"><%=rwsj %></label></center>
                    </div>
					<div class="mod-bd" style="float: left;width: 100%;height: 900px;">
					   <iframe id="ifr_e" name="ifr_e" src="/insect/dzdt/dtys/dtys_map.jsp?bchVal=<%=bchVal%>&fxzbVal=<%=fxzbVal%>&rwsj=<%=rwsj%>&fxfs=<%=fxfs%>"  width="100%" height="100%" frameborder="0"></iframe>
					<div style="margin-left: 120px;margin-top: -45px;">
					   	<input class="btn" type="button" value="上一时间" onclick="chake('<%=rwsjVal %>','<%=sjd %>','<%=beginsj %>','<%=endsj %>','1','<%=yss %>','<%=bchVal%>','<%=fxzbVal%>','<%=fxfs%>')"/>&nbsp;
						<input class="btn" type="button" value="下一时间" onclick="chake('<%=rwsjVal %>','<%=sjd %>','<%=beginsj %>','<%=endsj %>','2','<%=yss %>','<%=bchVal%>','<%=fxzbVal%>','<%=fxfs%>')"/>
						<input id="now"  type="hidden" value="0"/>
						<input id="nownd"  type="hidden" value="<%=sjds[0]%>"/>
					</div>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
</body>
</html>
