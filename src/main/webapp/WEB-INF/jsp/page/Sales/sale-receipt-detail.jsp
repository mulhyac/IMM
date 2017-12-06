<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-06
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet"
          href="../../js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet"
          href="../../js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script>
    <script src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/json3.min.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="../../js/common.js"></script>
    <script src="../../js/grid.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/jquery.dialog.js"></script>
    <script src="../../js/shopping.js"></script>
    <link rel="stylesheet" href="../../css/report.css">
    <style>
        .ui-icon-ellipsis {
            right: 5px;
        }

        #grid tr {
            cursor: pointer;
        }

        .no-query {
            background: url("../../img/no_query.png") no-repeat scroll 100px 60px #fff;
            background-position: center;
            border: 1px solid #ddd;
            border-top: none;
            height: 402px;
            margin-right: 0;
        }

        .box-flex {
            overflow: hidden;
            zoom: 1;
        }

        .box-flex .flex {
            float: left;
            width: 33.3%;
        }

        .grid-title {
            font-size: 24px;
            text-align: center;
            clear: none;
        }
    </style>
</head>
<body style="">
<div class="wrapper">
    <!-- header -->
    <div class="mod-search cf" id="report-search">
        <div class="l" id="filter-menu">
            <ul class="ul-inline fix" id="filterItems">
                <li id="date" style="display: list-item;"><label>单据日期:</label>
                    <input id="hello" class=""><span
                            class="todate"> 至 </span> <input id="end" class=""></li>
                <li id="billsNo"><label>客户类别:</label><input type="text" class="ui-input ui-input-ph" id="billsNoAuto">
                </li>
                <li id="sale-rank-filter"><span id="sale-rank-catorage"></span></li>

                <li id="supplier" style="display: list-item;">
                    <label>客户:</label>
                    <span class="mod-choose-input" id="filter-supplier">
                    <input type="text" class="ui-input" id="supplierAuto" autocomplete="off">
                    <span class="ui-icon-ellipsis"></span>
                    </span>
                </li>

                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
        </div>
    </div>
    <!-- no data -->
    <div class="no-query"></div>
    <!-- grid begin -->
    <div class="ui-print" style="display: none;">
        <!-- 列配置 -->
        <div class="cf box-flex">
            <div class="flex">
                <span id="config" class="ui-config"><a
                        href="http://vip2-gd.youshang.com/report/pu-detail-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a></span>
            </div>
            <div class="grid-title flex">销售收款一览表</div>
            <div class="fr">
                <a href="http://vip2-gd.youshang.com/report/pu-detail-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-export btn-sm mrb fl" id="btn-export">导出</a>
                <a href="http://vip2-gd.youshang.com/report/pu-detail-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-print btn-sm fl" id="btn-print">打印</a>
            </div>
        </div>
        <div class="grid-wrap" id="grid-wrap" style="height: 1160px;">
            <div class="grid-subtitle">日期: 2017-11-01 至 2017-11-27</div>
            <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                 style="width: 1205px;">
                <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
                <div class="ui-jqgrid-view" id="gview_grid" style="width: 1205px;">
                    <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                         style="display: none;"><a role="link"
                                                   class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                   style="right: 0px;"><span
                            class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span>
                    </div>
                    <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1205px;">
                        <div class="ui-jqgrid-hbox">
                            <table class="ui-jqgrid-htable" style="width: 1130px;" role="grid"
                                   aria-labelledby="gbox_grid" cellspacing="0" cellpadding="0" border="0">
                                <thead>
                                <tr class="ui-jqgrid-labels" role="rowheader">
                                    <th id="grid_FCUSTTYPE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FCUSTTYPE" class="ui-jqgrid-sortable">客户类别<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FCUSTNAME" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FCUSTNAME" class="ui-jqgrid-sortable">客户<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FEMPNAME" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FEMPNAME" class="ui-jqgrid-sortable">销售员<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FTRANSTYPENAME" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 110px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FTRANSTYPENAME" class="ui-jqgrid-sortable">业务类别<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FDATE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 110px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDATE" class="ui-jqgrid-sortable">单据日期<span class="s-ico"
                                                                                                       style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FBILLNO" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FBILLNO" class="ui-jqgrid-sortable">单据编号<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FTOTALAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FTOTALAMOUNT" class="ui-jqgrid-sortable">销售金额<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FDISAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDISAMOUNT" class="ui-jqgrid-sortable">优惠金额<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FAMOUNT" class="ui-jqgrid-sortable">优惠后金额<span class="s-ico"
                                                                                                          style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FPOSTFEE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FPOSTFEE" class="ui-jqgrid-sortable">客户承担费用<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FRPAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FRPAMOUNT" class="ui-jqgrid-sortable">本次收款<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_YSAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_YSAMOUNT" class="ui-jqgrid-sortable">应收款余额<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_BACKRATE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_BACKRATE" class="ui-jqgrid-sortable">回款率<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FDESC" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDESC" class="ui-jqgrid-sortable">备注<span class="s-ico"
                                                                                                     style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FBILLID" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 150px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FBILLID" class="ui-jqgrid-sortable">FBILLID<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FBILLTYPE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 150px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FBILLTYPE" class="ui-jqgrid-sortable">FBILLTYPE<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-bdiv" style="height: 267.551px; width: 1205px;">
                        <div style="position:relative;">
                            <div></div>
                            <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                   aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                   style="width: 1130px;">
                                <tbody>
                                <tr class="jqgfirstrow" role="row" style="height:auto">
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height: 0px; width: 110px; display: none;"></td>
                                    <td role="gridcell" style="height:0px;width:110px;"></td>
                                    <td role="gridcell" style="height:0px;width:120px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height: 0px; width: 100px; display: none;"></td>
                                    <td role="gridcell" style="height: 0px; width: 100px; display: none;"></td>
                                    <td role="gridcell" style="height: 0px; width: 100px; display: none;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height: 0px; width: 100px;"></td>
                                    <td role="gridcell" style="height: 0px; width: 100px; display: none;"></td>
                                    <td role="gridcell" style="height:0px;width:200px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                </tr>
                                <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTTYPE">
                                        国内公司
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTNAME">222
                                        231231
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FEMPNAME">
                                        &nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none;"
                                        aria-describedby="grid_FTRANSTYPENAME">销售退回
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FDATE">
                                        2017-11-27
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FBILLNO">
                                        XS20171127002
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FTOTALAMOUNT">
                                        -11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none;"
                                        aria-describedby="grid_FDISAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none;"
                                        aria-describedby="grid_FAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none;"
                                        aria-describedby="grid_FPOSTFEE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FRPAMOUNT">
                                        &nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center;" aria-describedby="grid_YSAMOUNT">
                                        -11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none;"
                                        aria-describedby="grid_BACKRATE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FDESC">
                                        &nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;"
                                        aria-describedby="grid_FBILLID">79139242986480
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;"
                                        aria-describedby="grid_FBILLTYPE">SALE
                                    </td>
                                </tr>
                                <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FCUSTTYPE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FCUSTNAME">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FEMPNAME">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold; display: none;"
                                        aria-describedby="grid_FTRANSTYPENAME">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FDATE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FBILLNO">小计
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FTOTALAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold; display: none;"
                                        aria-describedby="grid_FDISAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold; display: none;"
                                        aria-describedby="grid_FAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold; display: none;"
                                        aria-describedby="grid_FPOSTFEE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FRPAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_YSAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold; display: none;"
                                        aria-describedby="grid_BACKRATE">0.00%
                                    </td>
                                    <td role="gridcell" style="text-align: center; font-weight: bold;"
                                        aria-describedby="grid_FDESC">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none; font-weight: bold;"
                                        aria-describedby="grid_FBILLID">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; display: none; font-weight: bold;"
                                        aria-describedby="grid_FBILLTYPE">&nbsp;
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-sdiv" style="width: 1205px;">
                        <div class="ui-jqgrid-hbox">
                            <table role="grid" style="width: 1130px;" class="ui-jqgrid-ftable" cellspacing="0"
                                   cellpadding="0" border="0">
                                <tbody>
                                <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTTYPE">合计:
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTNAME">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 100px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FEMPNAME">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255); display: none;"
                                        aria-describedby="grid_FTRANSTYPENAME">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FDATE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 120px;"
                                        aria-describedby="grid_FBILLNO">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FTOTALAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; width: 100px; display: none;"
                                        aria-describedby="grid_FDISAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; width: 100px; display: none;"
                                        aria-describedby="grid_FAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; width: 100px; display: none;"
                                        aria-describedby="grid_FPOSTFEE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FRPAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align: center; width: 100px;"
                                        aria-describedby="grid_YSAMOUNT">-11.70
                                    </td>
                                    <td role="gridcell" style="text-align: center; width: 100px; display: none;"
                                        aria-describedby="grid_BACKRATE">0.0%
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 200px;"
                                        aria-describedby="grid_FDESC">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLID">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLTYPE">&nbsp;
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            </div>

        </div>
    </div>
    <!-- grid end -->
</div>


<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 175px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 26px;">
            <div class="list-item" data-value="129609203891259700">CK001 默认仓库</div>
        </div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree9043" class="ztree ztreeCombo showRoot" style="max-height: 200px; top: 143px; left: 524px; width: 250px;">
    <li id="tree9043_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree9043_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree9043_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree9043_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree9043_1_span"></span></a></li>
</ul>
<div style="position: absolute; left: -9999em; top: 208px; visibility: visible; width: auto; z-index: 1976;">
    <table class="ui_border ui_state_visible ui_state_focus">
        <tbody>
        <tr>
            <td class="ui_lt"></td>
            <td class="ui_t"></td>
            <td class="ui_rt"></td>
        </tr>
        <tr>
            <td class="ui_l"></td>
            <td class="ui_c">
                <div class="ui_inner">
                    <table class="ui_dialog">
                        <tbody>
                        <tr>
                            <td colspan="2">
                                <div class="ui_title_bar">
                                    <div class="ui_title" unselectable="on" style="cursor: move;">视窗</div>
                                    <div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);"
                                                                     title="最小化" style="display: none;"><b
                                            class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);"
                                                                        title="最大化" style="display: none;"><b
                                            class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);"
                                                                        title="还原"><b class="ui_res_b"></b><b
                                            class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);"
                                                                        title="关闭(esc键)" style="display: inline-block;">×</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ui_icon" style="display: none;"></td>
                            <td class="ui_main" style="width: auto; height: auto;">
                                <div class="ui_content" style="padding: 10px;">
                                    <div class="ui_loading"><span>loading...</span></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="ui_buttons" style="display: none;"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
            <td class="ui_r"></td>
        </tr>
        <tr>
            <td class="ui_lb"></td>
            <td class="ui_b"></td>
            <td class="ui_rb" style="cursor: auto;"></td>
        </tr>
        </tbody>
    </table>
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../js/content.min.js?v=1.0.0"></script>
<script src="../../js/plugins/layer/laydate/laydate.js"></script>
<script>
    laydate({elem: "#hello", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
<script>
    laydate({elem: "#end", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
</body>
</html>
