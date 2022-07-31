<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/postName.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtCss.css" />
    <link href="${pageContext.request.contextPath }/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/uploadfile.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery.uploadfile.js"></script>
    <script src="${pageContext.request.contextPath }/js/malsup.github.iojquery.form.js"></script>
    <script src="${pageContext.request.contextPath }/js/pdf.js"></script>
    <script src="${pageContext.request.contextPath }/js/pdf.worker.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>
<body style="background:#fafafa">

<div class="easyui-layout" id="MainLayout" data-options="fit:true,border:false" >
    <div id="OrganizationTreePanel" data-options="region:'east',collapsed:false,split:true,title:'岗位一级'" style="width: 80%;">
        <ul class="easyui-tree" id="tree">
        </ul>
    </div>

    <div data-options="region:'center',border:false,fit:true" style="padding: 0px;">
        <div class="easyui-layout" data-options="fit:true,border:true"  id="MainRightLayout">
            <div data-options="region:'center',border:true,fit:true"  id="DataCenterPanel">
                <div class="easyui-layout" data-options="fit:true,border:true"  id="DataShowLayout">
                    <div id="DetailArea"  data-options="region:'north',split:true" style="height:100%;">

                        <table class="easyui-datagrid" id="postList" title="岗位列表"
                               data-options="collapsible:true,pagination:true,rownumbers:true,striped: true, singleSelect: true,
                            method:'get',fitColumns:true,pageSize : 10,pageList : [10,20]">
                        </table>

                    </div>
                </div>
            </div>
        </div>




    </div>
</div>
</div>

<div id="dialog"  class="easyui-dialog" closed="true" style="position:relative;top:0px;left:0px"></div>



</body>
</html>



