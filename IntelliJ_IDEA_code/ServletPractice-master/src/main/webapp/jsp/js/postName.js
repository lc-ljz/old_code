//# sourceURL=postName.js
$(function(){
    //初始化岗位datagrid
    InitPostListTable();
    //加载岗位信息
    LoadPostName();
    //初始化等级树
    InitClassTree();
    pdf();
});
function pdf(){

    $("#dialog").dialog({
        title:'附件查看',
        width:'85%',
        height:'90%',
        modal:true,
        content:"<iframe scrolling='auto' frameborder='0' src='http://localhost:8080/generic/web/viewer.html?file=http://localhost:8080/resources/production_ssm.pdf' style='width:100%; height:100%; display:block;'></iframe>"
    });
    $("#dialog").dialog("open");
}

//////////////////初始化等级树/////////////////////////
function InitClassTree() {
    $("#tree").tree({
        animate: true,
        // checkbox: true,
        lines: true,//显示虚线效果
    })
}
//////////////////加载岗位信息/////////////////////////
function LoadPostName(){
    $.ajax({
        type: "POST",
        url: "../GetPostNameController",
        dataType: "json",
        success: function (data) {
            $('#postList').datagrid('loadData', data);
        },
        error: function () {
            alert('加载失败！');
        }
    })
}
//////////////////////加载右侧等级树//////////////////////////
function LoadClassTreeByPostName(txtPosName) {
    $.ajax({
        type: "POST",
        url: "../GetClassTreeByPostNameController?txtPosName="+txtPosName,
        dataType: "json",
        success: function (data) {
            $('#tree').tree('loadData', data);
            showAllNode()
        },
        error: function () {
            alert('加载设备树信息失败');
        }
    })
}
////////////////移除全部叶子节点////////////////
function showAllNode() {
    var tts = $('#tree').tree('getChildren');
    for (var i = 0; i < tts.length; i++) {
        if($('#tree').tree('isLeaf',tts[i].target)){
            if (tts[i].text==""||tts[i].text==null)
                tts[i].target.remove();


        }
    }

}

//////////////////初始化岗位datagrid/////////////////////////
function InitPostListTable() {
    $('#postList').datagrid({
        columns: [[
            { field: 'txtPosName', title: '岗位信息', width: "20%", align: 'center' },
        ]],
        rownumbers: true,
        singleSelect: true,
        fit:true,
        pagination : true,
        loadFilter: pagerFilter,
        onClickRow:function (rowIndex, rowData){
          LoadClassTreeByPostName(rowData.txtPosName);
        },

    })
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