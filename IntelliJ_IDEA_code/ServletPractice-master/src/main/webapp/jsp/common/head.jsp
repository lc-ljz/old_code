<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>文件上传系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" charset="UTF-8"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" charset="UTF-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/calendar/WdatePicker.js"charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/gray/easyui.css"charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/icon.css"charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtIcon.css"charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtCss.css"charset="UTF-8" />

</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>文件上传系统</h1>
        <div class="publicHeaderR">
            <p><span>您好！</span><span style="color: #fff21b"> ${adminSession.iAdminID}</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath }/jsp/logout.do">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <a href="#">温馨提示：为了能正常浏览，请使用火狐浏览器！</a>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left" >
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
<%--              <li><a href="${pageContext.request.contextPath }/jsp/postName.jsp">岗位等级对应</a></li>--%>
              <li><a href="${pageContext.request.contextPath }/jsp/upload1.jsp">应知应会等文件上传</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/upload.jsp">安全等教育文件上传</a></li>
               <li><a href="${pageContext.request.contextPath }/jsp/logout.do">退出系统</a></li>
             </ul>
         </nav>
     </div>

     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>