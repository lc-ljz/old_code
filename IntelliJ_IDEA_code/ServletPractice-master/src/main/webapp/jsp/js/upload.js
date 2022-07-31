//# sourceURL=upload.js
$(function(){

    //加载任务列表
    InitOrderListTable();
    //初始化岗位添加下拉框
    InitAddCbo();
    //加载下拉框的岗位信息
    LoadPostName();
    //初始化模块添加下拉框
     //InitTxtTypeCbo();
    //加载下拉框的模块信息
     //LoadTxtType();
    //初始化左侧岗位-等级信息
    InitTree();
    //加载岗位等级信息
    LoadTxtPostTree();


});
function formatFile(value, row, index){
    if(value !=null && value != ''){
        return  str = "<a href='../FileDownloadController?fileName="+value+"'>"+value+"</a>";
    }else{
        return "无";
    }
}

function f() {
    var form = new FormData($("#upload")[0]);
    var startDate = $('#startDate').datetimebox('getValue');//开始时间
    var endDate = $('#endDate').datetimebox('getValue');//结束时间
    //时间
    if (startDate > endDate) {
        $.messager.alert('警告', '结束时间不能大于开始时间！');
        return;
    }
    var win = $.messager.progress({
        title: '请稍后',
        msg: '上传中...',
    });

    $.ajax({
        url: "../UplodeServlet",
        type: "post",
        data: form,
        dataType: "json",
        processData: false,
        contentType: false,
        async: true,
        success: function (data) {
            $.messager.progress('close');
            if(data.data=="success"){
                $.messager.alert('提示','任务添加成功!');
                InitOrderListTable();
                clearOrderADDForm();
                $("#orderAddWindow").window('close');


            }else{
                $.messager.alert('提示',data.msg);
            }

        }
    })

}


function InitTree() {
    $("#tree").tree({
        animate: true,
        // checkbox: true,
        lines: true,//显示虚线效果
        onDblClick:function(node){
            if (node.text=="root"){
                InitOrderListTable();
                return;
            }
            else
                LoadAccountInfoGridByTree(node.text);
        }
    })
}

function LoadAccountInfoGridByTree(txtPosName) {
    $('#orderList').datagrid({
        columns: [[
            { field: 'iLrnID', title: '学习ID', width: "5%", align: 'center' },
            { field: 'txtLrnTitle', title: '学习资料标题', width: "15%", align: 'center' },
            { field: 'txtLrnType', title: '学习类别', width: "5%", align: 'center' },
            { field: 'txtLrnPath', title: '存储路径', width: "23%", align: 'center',formatter:formatFile },
            { field: 'm_date', title: '上传时间', width: "10%", align: 'center',formatter:formatDateTime },
            { field: 'iAdminID', title: '上传者用户ID', width: "10%", align: 'center' },
            { field: 'txtType', title: '模块', width: "7%", align: 'center' },
            { field: 'txtPosName', title: '岗位', width: "7%", align: 'center' },
            { field: 'iLrnLen', title: '学习时长', width: "5%", align: 'center',formatter:function(data){return data+'天'} },
            {field: 'txtRemark', title: '评论',hidden:true,width: 1, align: 'center'}
        ]],
        title: '任务列表',
        collapsible: true,
        singleSelect: true,
        rownumbers: true,
        url: '../SelectTaskListByTree1Controller?txtPosName='+txtPosName,
        fitColumns: true,
        pagination : true,
        onClickRow:function (rowIndex, rowData){
            document.getElementById("Remark").value=rowData.txtRemark;

        },
        loadFilter: pagerFilter,
        pageSize : 10,
        pageList : [10,20]//允许表格自动缩放,以适应父容器
    })
}
/////////////////////移除全部叶子节点/////////////////////////
function showAllNode() {
    var tts = $('#tree').tree('getChildren');
    for (var i = 0; i < tts.length; i++) {
       if($('#tree').tree('isLeaf',tts[i].target)){
           if (tts[i].text==""||tts[i].text==null)
               InitOrderListTable();

        }
    }

}
/////////////////////加载左侧岗位树/////////////////////////
function LoadTxtPostTree() {
    $.ajax({
        type: "POST",
        url: "../PostClassTree1",
        dataType: "json",
        success: function (data) {
           $('#tree').tree('loadData', data);
            showAllNode();
        },
        error: function () {
            alert('加载信息失败');
        }
    })

}


//////////////////////加载岗位信息/////////////////////////
function LoadPostName(){
    $.ajax({
        type: "POST",
        url: "../GetPostNameController?PostText=",
        dataType: "json",
        success: function (data) {
            $('#postName').combobox('loadData', data);
        },
        error: function () {
            alert('加载失败！');
        }
    })
}
//////////////////////加载模块信息/////////////////////////
function LoadTxtType(){
    $.ajax({
        type: "POST",
        url: "../GetTxtTypeController?txtType=",
        dataType: "json",
        success: function (data) {
            $('#txtTypeCbo').combobox('loadData', data);
        },
        error: function () {
            alert('加载失败！');
        }
    })


}

function InitAddCbo() {
    /////////////////////////////////岗位信息/////////////////////////////////////////
    $('#postName').combobox({
        valueField: 'txtPosName',
        textField: 'txtPosName',
        onLoadSuccess: function () { //加载完成后,设置选中第一项
            var val = $(this).combobox("getData");
            for (var item in val[0]) {
                if (item == "txtPosName") {
                    $(this).combobox("select", val[0][item]);
                }
            }},
    });

}
function InitTxtTypeCbo() {
    /////////////////////////////////模块信息/////////////////////////////////////////
    $('#txtTypeCbo').combobox({
        valueField: 'txtType',
        textField: 'txtType',
        onLoadSuccess: function () { //加载完成后,设置选中第一项
            var val = $(this).combobox("getData");
            for (var item in val[0]) {
                if (item == "txtType") {
                    $(this).combobox("select", val[0][item]);
                }
            }},
    });

}

function LoadAccountInfoGrid() {
    myEquipmentName = $('#tb_EquipmentName').textbox('getValue');
    $('#orderList').datagrid({
        columns: [[
            { field: 'iLrnID', title: '学习ID', width: "5%", align: 'center' },
            { field: 'txtLrnTitle', title: '学习资料标题', width: "15%", align: 'center' },
            { field: 'txtLrnType', title: '学习类别', width: "5%", align: 'center' },
            { field: 'txtLrnPath', title: '存储路径', width: "23%", align: 'center',formatter:formatFile },
            { field: 'm_date', title: '上传时间', width: "10%", align: 'center',formatter:formatDateTime },
            { field: 'iAdminID', title: '上传者用户ID', width: "10%", align: 'center' },
            { field: 'txtType', title: '模块', width: "7%", align: 'center' },
            { field: 'txtPosName', title: '岗位', width: "7%", align: 'center' },
            { field: 'iLrnLen', title: '学习时长', width: "5%", align: 'center',formatter:function(data){return data+'天'} },
            {field: 'txtRemark', title: '评论',hidden:true,width: 1, align: 'center'}
        ]],
        title: '任务列表',
        collapsible: true,
        singleSelect: true,
        rownumbers: true,
         url: '../SelectTaskList1Controller?myEquipmentName='+myEquipmentName,
        fitColumns: true,
        pagination : true,
        onClickRow:function (rowIndex, rowData){
            document.getElementById("Remark").value=rowData.txtRemark;

        },
        loadFilter: pagerFilter,
        pageSize : 10,
        pageList : [10,20]//允许表格自动缩放,以适应父容器
    })
}

function InitOrderListTable() {
    $('#orderList').datagrid({
        columns: [[
            { field: 'iLrnID', title: '学习ID', width: "5%", align: 'center' },
            { field: 'txtLrnTitle', title: '学习资料标题', width: "15%", align: 'center' },
            { field: 'txtLrnType', title: '学习类别', width: "5%", align: 'center' },
            { field: 'txtLrnPath', title: '存储路径', width: "23%", align: 'center',formatter:formatFile },
            { field: 'm_date', title: '上传时间', width: "10%", align: 'center',formatter:formatDateTime },
            { field: 'iAdminID', title: '上传者用户ID', width: "10%", align: 'center' },
            { field: 'txtType', title: '模块', width: "7%", align: 'center' },
            { field: 'txtPosName', title: '岗位', width: "7%", align: 'center' },
            { field: 'iLrnLen', title: '学习时长', width: "5%", align: 'center',formatter:function(data){return data+'天'} },
            {field: 'txtRemark', title: '评论',hidden:true,width: 1, align: 'center'}
        ]],
        data: [],
        url:'../GetTaskList1Controller',
        rownumbers: true,
        singleSelect: true,
        fit:true,
        toolbar: '#toolbar_orderDemo',
        pagination : true,
        loadFilter: pagerFilter,
        onClickRow:function (rowIndex, rowData){
            document.getElementById("Remark").value=rowData.txtRemark;

        }//调用分页过滤器方法
        // onDblClickRow: AddDetailItemsGrid
    })
}
function clearOrderADDForm(){
   // document.getElementById("orderAddFile").value="";
    $('#upload').form('reset');
    LoadPostName();
    // LoadTxtType();
}

function order_addDemo(){
 $("#orderAddWindow").window("open");
}

/////////////////////////////////////分页////////////////////////////////////////
function pagerFilter(data) {
    if (typeof data.length == 'number' && typeof data.splice == 'function') {   // is array
        data = {
            total: data.length,
            rows: data
        }
    }
    var dg = $(this);
    var opts = dg.datagrid('options');
    var pager = dg.datagrid('getPager');
    pager.pagination({
        onSelectPage: function (pageNum, pageSize) {
            opts.pageNumber = pageNum;
            opts.pageSize = pageSize;
            pager.pagination('refresh', {
                pageNumber: pageNum,
                pageSize: pageSize
            });
            dg.datagrid('loadData', data);
        }
    });
    if (!data.originalRows) {
        data.originalRows = (data.rows);
    }
    var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
    var end = start + parseInt(opts.pageSize);
    data.rows = (data.originalRows.slice(start, end));
    return data;
}

/////////////////////////////////////删除功能////////////////////////////////////////
function  order_deleteDemo(){
    var mySelectRow = $('#orderList').datagrid('getSelected');
    if (mySelectRow == null) {
        alert('请选中一行');
        return;
    }
    var iLrnID = mySelectRow.iLrnID;
    var txtLrnPath = mySelectRow.txtLrnPath;
    $.messager.confirm('提示', '确认要删除该条记录?', function (r) {
            if (r) {
                $.ajax({
                    type: "POST",
                    url: '../DeleteFormController?iLrnID='+iLrnID+"&txtLrnPath="+txtLrnPath,
                    dataType: "json",
                    success: function (data) {
                        $('#orderList').datagrid('unselectAll');//清除所有选中
                        if(data&&data.error==0){
                            $.messager.alert('提示','删除成功!');
                            $('#Remark').val("");
                            InitOrderListTable();
                        }else
                                {
                            $.messager.alert('提示','删除失败!');
                            }


                    },
                    error: function () {
                        alert('删除失败！');
                    }
                })
            }
        }
    )
}

function formatDateTime(val,row)
{
//shijianchuo是整数，否则要parseInt转换
    var time = new Date(val);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
}
function add0(m){return m<10?'0'+m:m }



