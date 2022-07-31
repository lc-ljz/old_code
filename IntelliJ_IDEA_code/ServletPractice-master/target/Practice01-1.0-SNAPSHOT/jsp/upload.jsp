<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" charset="UTF-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/calendar/WdatePicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/upload.js" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/gray/easyui.css" charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/ealib/themes/icon.css" charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtIcon.css" charset="UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/extlib/themes/syExtCss.css" charset="UTF-8"/>
    <script src="${pageContext.request.contextPath }/js/malsup.github.iojquery.form.js" charset="UTF-8"></script>

</head>

    <script type="text/javascript">
        function formSubmit(){
            var action="${pageContext.request.contextPath }/UploadServlet";
            action+="?postName="+document.upload.postName.innerText;
            document.upload.action=action;
            document.upload.submit();
        }


</script>

<body style="background:#fafafa">
<div id="MainGrid_ToolBar" style="background:#fafafa">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="text-align: center;">学习资料标题: </td>
                        <td>
                            <input id="tb_EquipmentName" class="easyui-textbox" />
                        </td>

                        <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="LoadAccountInfoGrid()">查询</a></td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
</div>
<!--头部-->
<div  id="toolbar_orderDemo" style=" height: 22px; padding: 3px 11px; background: #fafafa;">
    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="order_addDemo()">新增</a>
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="order_deleteDemo()">删除</a>
<%--        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="order_editDemo()">编辑</a>--%>
    </div>
</div>
<div class="easyui-layout" id="MainLayout" data-options="fit:true,border:false" >
    <div id="OrganizationTreePanel" data-options="region:'west',collapsed:false,split:true,title:'岗位'" style="width:13%;height: 85%">
        <ul class="easyui-tree" id="tree">
        </ul>
    </div>

    <div data-options="region:'center',border:false,fit:true" style="padding: 0px;">
        <div class="easyui-layout" data-options="fit:true,border:true"  id="MainRightLayout">
<%--            <div data-options="region:'west',border:true,split:true" style="width:10%;padding: 5px">--%>
<%--                <ul class="easyui-tree" id="EquipmentCatalogTree"></ul>--%>
<%--            </div>--%>
            <div data-options="region:'center',border:true,fit:true"  id="DataCenterPanel">
                <div class="easyui-layout" data-options="fit:true,border:true"  id="DataShowLayout">
                    <div id="DetailArea"  data-options="region:'north',split:true" style="height:65%;">
                      <table class="easyui-datagrid" id="orderList" title="任务列表"
                          data-options="collapsible:true,pagination:true,rownumbers:true,striped: true, singleSelect: true,
<%--                             url:'../GetTaskListController',method:'get',fitColumns:true">--%>
                            method:'get',fitColumns:true,pageSize : 10,pageList : [10,20]">
                        </table>

                    </div>
                    <div id="gaiInfo" data-options="region:'center',border:true,title:'备注信息',split:true"style="height:35%" >
                        <textarea name="Remark" id="Remark" style="height: 75%;width: 100%" readonly style="font-size:15px"></textarea>
                    </div>
                </div>
            </div>
        </div>




       </div>
    </div>
</div>

<div id="orderAddWindow" class="easyui-dialog" title="添加任务" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',buttons:'#addDialog-buttons'" style="width:700px;height:400px;">
    <div>

        <form id="upload" name="upload"  action='${pageContext.request.contextPath }/UploadServlet' method="post" ENCTYPE="multipart/form-data"/>
        <table  style="border-spacing:8px;margin:0 auto" >
            <tr>
                <td>学习资料标题:</td>
                <td>
                    <input id="lrnTitle" name="lrnTitle" data-options="multiline:true,prompt:'请输入标题'"   class="easyui-textbox" type="text" style="width:150px" />
                </td>
            </tr>
            <tr>
                <td>学习开始日期:</td>
                <td>
                    <input class="easyui-datetimebox" id="startDate" name="startDate" data-options="required:true,showSeconds:true"
                           value="date.format('yyyy-MM-dd hh:mm:ss')"style="width:150px">
                </td>
            </tr>
            <tr>
                <td>学习结束日期:</td>
                <td>
                    <input class="easyui-datetimebox" id="endDate" name="endDate" data-options="required:true,showSeconds:true"
                           value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
                </td>
            </tr>
            <tr>
                <td>模块:</td>
                <td>
<%--                    <input id="txtTypeCbo" name="txtTypeCbo" class="easyui-combobox"  />--%>
                    <select id="txtTypeCbo" name="txtTypeCbo" class="easyui-combobox">
                                                <option value="安全教育培训系统" selected="selected">安全教育培训系统</option>
                                                <option value="环保教育培训系统">环保教育培训系统</option>
                     </select>
                </td>
            </tr>
            <tr>
                <td>岗位:</td>
                <td>
                    <input id="postName" name="postName" class="easyui-combobox"  />
                </td>
            </tr>


            <tr>
                <td>备注:</td>
                <td colspan="3" style ="width:420px;">
                    <textarea name="TextBox_Remark" rows="2" cols="20" id="TextBox_Remark" style="height:100px;width:430px;" data-options="multiline:true,prompt:'请输入备注信息'" ></textarea>
                </td>
            </tr>
            <tr>
                <td>附件:</td>
                <td>
                    <!-- <iframe src="file_upload.jsp"></iframe>  -->
                    <input type="file" id="file1" name="file1" value="" size="40" class="sbttn"/>
                    <%--                        <input type="hidden" id="orderAddFile" name="file"/>--%>
                </td>
            </tr>

        </table>

        </form>
        <div id="addDialog-buttons" style="">
<%--            <a href="#"  class="easyui-linkbutton" onclick="document.getElementById('upload').submit();return false;">上传</a>--%>
          <a href="#"  class="easyui-linkbutton" onclick="f();return false;">上传</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#orderAddWindow').dialog('close')">取消</a>
        </div>
    </div>
</div>




</body>
</html>



