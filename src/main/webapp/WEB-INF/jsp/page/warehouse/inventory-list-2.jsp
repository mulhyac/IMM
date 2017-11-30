<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/30
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">

    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script><script src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/json3.min.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="../../js/common.js"></script>
    <script src="../../js/grid.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/jquery.dialog.js"></script>
    <script type="text/javascript">
        var _vds = _vds || [];
        window._vds = _vds;
        (function(){
            _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
            (function() {
                var vds = document.createElement('script');
                vds.type='text/javascript';
                vds.async = true;
                vds.src = 'js/vds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(vds, s);
            })();
        })();
    </script>

    <script type="text/javascript">
        var DOMAIN = document.domain;
        var WDURL = "";
        var SCHEME= "blue";
        try{
            var host = window.location.host;
            var domainDot = host.indexOf('.');
            var domain = host.substring(domainDot + 1,host.length);
            document.domain = domain;
        }catch(e){
        }
        //ctrl+F5 增加版本号来清空iframe的缓存的
        $(document).keydown(function(event) {
            /* Act on the event */
            if(event.keyCode === 116 && event.ctrlKey){
                var defaultPage = Public.getDefaultPage();
                var href = defaultPage.location.href.split('?')[0] + '?';
                var params = Public.urlParam();
                params['version'] = Date.parse((new Date()));
                for(i in params){
                    if(i && typeof i != 'function'){
                        href += i + '=' + params[i] + '&';
                    }
                }
                defaultPage.location.href = href;
                event.preventDefault();
            }
        });
    </script>

    <style>
        .mod-search{ position:relative; }
        #custom{ position:absolute; top:0; right:0; }
        #manager li{margin: 8px 0;}
        #manager .ui-label{width: 204px;display: inline-block;line-height: 18px;font-size: 14px;text-align: center;}
        #manager .ui-label-warning:hover{background-color: #FFBA5A;}
        .no-query{border: none;}
    </style>
</head>

<body class="min-w inventoryList" style="">
<div class="wrapper">
    <div class="mod-search cf">
        <div class="fl">
            <ul class="ul-inline cf">
                <li>
                    <label>盘点时间:</label>
                    <input type="text" id="beginDate" value="" class="ui-input ui-datepicker-input">
                    <i>-</i>
                    <input type="text" id="endDate" value="" class="ui-input ui-datepicker-input">
                </li>
                <li>
                    <label>仓库:</label>
                    <span id="storage"><span class="ui-combo-wrap" style="width: 118px;"><input type="text" class="input-txt" autocomplete="off" readonly="readonly" style="cursor: default; width: 92px;"><span class="trigger"></span></span></span>
                </li>
                <li>
                    <label>商品类别:</label>

                    <span class="ui-tree-wrap" style="width:145px"><input type="text" class="input-txt" style="width:119px" id="category" autocomplete="off" placeholder="类别" value=""><span class="trigger"></span></span></li>
                <li>
                    <label>商品:</label>
                    <span style="position:relative;" id="filter-goods">
            <input type="text" id="goodsAuto_no" name="goods" class="ui-input w150">
          </span>
                </li>
                <li><a class="mrb ui-btn ui-btn-search" id="search">查询</a></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr" style="width: 1370px;"><div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div><div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div><div class="ui-jqgrid-view" id="gview_grid" style="width: 1370px;"><div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix" style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div><div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1370px;"><div class="ui-jqgrid-hbox"><table class="ui-jqgrid-htable" style="width:720px" role="grid" aria-labelledby="gbox_grid" cellspacing="0" cellpadding="0" border="0"><thead><tr class="ui-jqgrid-labels" role="rowheader"><th id="grid_rn" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 30px;"><div id="jqgh_grid_rn"><span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_operating" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_operating" class="ui-jqgrid-sortable">操作<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_pdDate" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_pdDate" class="ui-jqgrid-sortable">盘点时间<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_billNo" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_billNo" class="ui-jqgrid-sortable">盘点编号<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_orderId" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_orderId" class="ui-jqgrid-sortable">盘点orderId<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_billStatus" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_billStatus" class="ui-jqgrid-sortable">跳转表示符<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_oiBillID" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_oiBillID" class="ui-jqgrid-sortable">销售订单号id<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_locationName" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_locationName" class="ui-jqgrid-sortable">盘点仓库<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_pdResult" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 250px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_pdResult" class="ui-jqgrid-sortable">盘点结果<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th></tr></thead></table></div></div><div class="ui-jqgrid-bdiv no-query" style="height: 468px; width: 1370px;"><div style="position:relative;"><div></div><table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable" style="width: 720px;"><tbody><tr class="jqgfirstrow" role="row" style="height:auto"><td role="gridcell" style="height:0px;width:30px;"></td><td role="gridcell" style="height:0px;width:60px;"></td><td role="gridcell" style="height:0px;width:100px;"></td><td role="gridcell" style="height:0px;width:150px;"></td><td role="gridcell" style="height:0px;width:150px;display:none;"></td><td role="gridcell" style="height:0px;width:150px;display:none;"></td><td role="gridcell" style="height:0px;width:100px;display:none;"></td><td role="gridcell" style="height:0px;width:100px;"></td><td role="gridcell" style="height:0px;width:250px;"></td></tr></tbody></table></div></div></div><div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div><div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 1370px;"><div id="pg_page" class="ui-pager-control" role="group"><table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table" style="width:100%;table-layout:fixed;height:100%;" role="row"><tbody><tr><td id="page_left" align="left"><table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table navtable" style="float:left;table-layout:auto;"><tbody><tr><td class="ui-pg-button ui-corner-all" title=""><div class="ui-pg-div"><span class="ui-icon-config">列设置</span></div></td></tr></tbody></table></td><td id="page_center" align="center" style="white-space: pre; width: 282px;"><table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;" class="ui-pg-table"><tbody><tr><td id="first_page" class="ui-pg-button ui-corner-all"><span class="ui-icon ui-icon-seek-first"></span></td><td id="prev_page" class="ui-pg-button ui-corner-all"><span class="ui-icon ui-icon-seek-prev"></span></td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td dir="ltr"> <input class="ui-pg-input" type="text" size="2" maxlength="7" value="0" role="textbox"> 共 <span id="sp_1_page"></span> 页</td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td id="next_page" class="ui-pg-button ui-corner-all"><span class="ui-icon ui-icon-seek-next"></span></td><td id="last_page" class="ui-pg-button ui-corner-all"><span class="ui-icon ui-icon-seek-end"></span></td><td dir="ltr"><select class="ui-pg-selbox" role="listbox"><option role="option" value="100" selected="selected">100</option><option role="option" value="200">200</option><option role="option" value="500">500</option></select></td></tr></tbody></table></td><td id="page_right" align="right"><div dir="ltr" style="text-align:right" class="ui-paging-info"></div></td></tr></tbody></table></div></div></div>

    </div>
</div>
<script src="inventoryList.js"></script>

<div id="COMBO_WRAP"><div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 118px; display: none;"><div class="droplist" style="position: relative; overflow: auto; height: 51px;"><div class="list-item" data-value="-1">所有仓库</div><div class="list-item" data-value="129609203891259700">默认仓库</div></div></div></div><div class="pika-single is-hidden is-bound" style=""></div><div class="pika-single is-hidden is-bound" style=""></div><ul id="tree185" class="ztree ztreeCombo showRoot" style="top: 143px; left: 524px; width: 250px;"><li id="tree185_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree185_1_switch" title="" class="button level0 switch root_docu" treenode_switch=""></span><a id="tree185_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree185_1_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree185_1_span"></span></a></li></ul><div class="ui-widget ui-widget-content ui-corner-all ui-jqdialog" id="alertmod_grid" dir="ltr" tabindex="-1" role="dialog" aria-labelledby="alerthd_grid" aria-hidden="true" style="width: 200px; height: auto; z-index: 950; overflow: hidden; left: 603.5px; top: 293.5px;"><div class="ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" id="alerthd_grid" style="cursor: move;"><span class="ui-jqdialog-title" style="float: left;">注意</span><a href="javascript:void(0)" class="ui-jqdialog-titlebar-close ui-corner-all" style="right: 0.3em;"><span class="ui-icon ui-icon-closethick"></span></a></div><div class="ui-jqdialog-content ui-widget-content" id="alertcnt_grid"><div>请选择记录</div><span tabindex="0"><span tabindex="-1" id="jqg_alrt"></span></span></div></div><div style="left: 0px; top: 0px; visibility: hidden; position: absolute;" class=""><table class="ui_border"><tbody><tr><td class="ui_lt"></td><td class="ui_t"></td><td class="ui_rt"></td></tr><tr><td class="ui_l"></td><td class="ui_c"><div class="ui_inner"><table class="ui_dialog"><tbody><tr><td colspan="2"><div class="ui_title_bar"><div class="ui_title" unselectable="on" style="cursor: move;"></div><div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);" title="最小化" style="display: none;"><b class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);" title="最大化" style="display: none;"><b class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);" title="还原"><b class="ui_res_b"></b><b class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);" title="关闭(esc键)" style="display: inline-block;">×</a></div></div></td></tr><tr><td class="ui_icon" style="display: none;"></td><td class="ui_main" style="width: auto; height: auto;"><div class="ui_content" style="padding: 10px;"></div></td></tr><tr><td colspan="2"><div class="ui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="ui_r"></td></tr><tr><td class="ui_lb"></td><td class="ui_b"></td><td class="ui_rb" style="cursor: auto;"></td></tr></tbody></table></div></body></html>