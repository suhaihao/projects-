<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>病虫害数据分析</title>
		<%@ include file="/header.jsp"%>
	</head>
	<body>
		<form name="f1" method="post" action="">
			<table border=0 style="width: 100%" cellpadding="1" cellspacing="1">
				<tr>
					<td class=title>
						病虫害数据分析
						<!-- 暂放，后期再开发 -->
						<!-- 暂放，后期再开发 -->
						<!-- 暂放，后期再开发 -->
						<!-- 暂放，后期再开发 -->
						<!-- 暂放，后期再开发 -->
					</td>
				</tr>
			</table>
			<table border=0 cellspacing=0 cellpadding=0 style="width: 100%"	height=4>
				<tr>
					<td class=forumRowleft style="width: 15%">
						病虫害:
					</td>
					<td class=forumRowright style="width: 85%">
						<input type="text" name="bch">
					</td>
				</tr>
				<tr>
					<td class=forumRowleft style="width: 15%">
						作物:
					</td>
					<td class=forumRowright style="width: 85%">
						<input type="text" name="zw">
					</td>
				</tr>
				<tr>
					<td class=forumRowleft style="width: 15%">
						报表编码:
					</td>
					<td class=forumRowright style="width: 85%">
						<input type="text" name="bbbm">
					</td>
				</tr>
				<tr>
					<td class=forumRowleft style="width: 15%">
						报表名称:
					</td>
					<td class=forumRowright style="width: 85%">
						<input type="text" name="bbmc">
					</td>
				</tr>
				<tr>
					<td class=forumRowleft style="width: 15%">
						报表种类:
					</td>
					<td class=forumRowright style="width: 85%">
						<input type="text" name="bbzl">
					</td>
				</tr>
				<tr>
					<td class=td5 colspan=2 style="text-align: center">
						<input type="button" class="button" value="查询" />
						<input type="button" class="button" value="分析" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
