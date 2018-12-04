<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ssh.user.util.EHCache"%>
<%@page import="com.ssh.user.model.Dsys02_zfzz"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	EHCache eHCache = new EHCache("ehcacheMenu");
	List<Dsys02_zfzz> menulist = (List<Dsys02_zfzz>) eHCache
			.getCacheElement("menu");
	request.setAttribute("menulist", menulist);
%>
<div class="sidebar">
	<div class="sidebar-header t-center">
		<span><img class="text-logo" src="${path}assets/img/logo/1.png"></span>
	</div>
	<div class="sidebar-collapse">
		<div class="sidebar-menu">
			<%
				int first = 0;
				int size = 0;
			%>
			<ul class="nav nav-sidebar">
				<jf:forEach var="menu" items="${menulist}">
					<%
						size++;
					%>
					<jf:if test="${menu.MENU_ID==0}">
						<li id="${menu.ITEM_ID}1">
					</jf:if>
					<jf:if test="${fn:length(menu.ITEM_ID)==2}">
						<jf:if test="${empty menu.ITEM_PATH}">
							<a href="#">
						</jf:if>
						<jf:if test="${not  empty menu.ITEM_PATH}">
							<a href="${menu.ITEM_PATH}">
						</jf:if>
						<i class="${menu.ITEM_PIC_NAME}"></i>
						<span class="text">${menu.ITEM_NAME}</span>
						<jf:if test="${menu.ITEM_CMT==1}">
							<span class="fa fa-angle-down pull-right"></span>
						</jf:if>
						</a>
					</jf:if>
					<jf:if test="${menu.ITEM_CMT==1}">
						<ul id="${menu.ITEM_ID}2" class="nav sub">
					</jf:if>
					<jf:if test="${fn:length(menu.ITEM_ID)==4}">
						<li><a href="${menu.ITEM_PATH}"><i
								class="${menu.ITEM_PIC_NAME}"></i><span class="text">${menu.ITEM_NAME}</span></a></li>
						<%
							first = 1;
						%>
					</jf:if>
					<%
						if (size == menulist.size()) {
								first = 0;
							} else {
								if (Integer.parseInt(menulist.get(size).getMENU_ID()) == 0) {
									first = 0;
								}
							}
					%>
					<jf:if test="${menu.MENU_ID!=0}">
						<%
							if (first != 1) {
						%>
					
			</ul>
			<%
				}
			%>
			</jf:if>
			<jf:if test="${menu.MENU_ID!=0}">
				<%
					if (first != 1) {
				%>
				</li>
				<%
					}
				%>

			</jf:if>
			</jf:forEach>
			</ul>
		</div>
	</div>
	<div class="sidebar-footer">
		<div class="sidebar-brand"><img style="width: 50px;height: 40px;" src="${path}assets/img/logo/gslogo.png"></div>
		<ul class="sidebar-terms">
		</ul>
		<div class="copyright text-center">
			<small><a href="http://www.jifengtx.com/" title="北京际峰天翔信息技术有限公司" target="_blank">北京际峰天翔信息技术有限公司</a></small>
		</div>
	</div>
</div>