<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-05
  Time: 9:20
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
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">

    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script type="text/javascript">
        var _vds = _vds || [];
        window._vds = _vds;
        (function () {
            _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
            (function () {
                var vds = document.createElement('script');
                vds.type = 'text/javascript';
                vds.async = true;
                vds.src = 'https://dn-growing.qbox.me/vds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(vds, s);
            })();
        })();
    </script>

    <script type="text/javascript">
        var DOMAIN = document.domain;
        var WDURL = "";
        var SCHEME = "blue";
        try {
            var host = window.location.host;
            var domainDot = host.indexOf('.');
            var domain = host.substring(domainDot + 1, host.length);
            document.domain = domain;
        } catch (e) {
        }
        //ctrl+F5 增加版本号来清空iframe的缓存的
        $(document).keydown(function (event) {
            /* Act on the event */
            if (event.keyCode === 116 && event.ctrlKey) {
                var defaultPage = Public.getDefaultPage();
                var href = defaultPage.location.href.split('?')[0] + '?';
                var params = Public.urlParam();
                params['version'] = Date.parse((new Date()));
                for (i in params) {
                    if (i && typeof i != 'function') {
                        href += i + '=' + params[i] + '&';
                    }
                }
                defaultPage.location.href = href;
                event.preventDefault();
            }
        });
    </script>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report.css">
    <style type="text/css">
        .filter-menu .mod-choose-input {
            position: relative;
            *zoom: 1;
        }

        .filter-menu .mod-choose-input .ui-input {
            padding-right: 25px;
            width: 226px;
            font-family: "宋体";
        }

        .filter-menu .ui-datepicker-input {
            width: 105px;
            font-family: "宋体";
        }

        .ui-icon-ellipsis {
            right: 3px;
        }

        .ul-inline li {
            position: relative;
        }

        .no-query {
            background: url("/css/img/no_query.png") no-repeat scroll 100px 60px #fff;
            background-position: center;
            border: 1px solid #ddd;
            border-top: none;
            height: 402px;
            margin-right: 0;
        }

        #chk-wrap {
            line-height: 30px;
        }

        .frozen-sdiv {
            display: none;
        }

        #grid tr {
            cursor: pointer;
        }

    </style>
</head>
<body style="">
<div class="wrapper">
    <!-- header -->
    <div class="mod-search cf" id="report-search">
        <div class="l" id="filter-menu">
            <ul class="ul-inline fix" id="filterItems">
                <li id="filter-billDate"><label>开票日期:</label><input type="text" value=""
                                                                    class="ui-input ui-datepicker-input"
                                                                    name="filter-billFromDate" id="filter-billFromDate"
                                                                    maxlength="10"><span class="todate"> 至 </span><input
                        type="text" value="" class="ui-input ui-datepicker-input" name="filter-billToDate"
                        id="filter-billToDate" maxlength="10"></li>
                <li id="date" style="display: list-item;"><label>单据日期:</label><input type="text" value=""
                                                                                     class="ui-input ui-datepicker-input"
                                                                                     name="filter-fromDate"
                                                                                     id="filter-fromDate"
                                                                                     maxlength="10"><span
                        class="todate"> 至 </span><input type="text" value="" class="ui-input ui-datepicker-input"
                                                        name="filter-toDate" id="filter-toDate" maxlength="10"></li>
                <li id="billsNo"><label>单据编号:</label><input type="text" class="ui-input ui-input-ph" id="billsNoAuto">
                </li>
                <li id="sale-rank-filter"><span id="sale-rank-catorage"></span></li>
                <li id="filter" style="display: list-item;"><label>客户类别</label><span class="ui-tree-wrap"
                                                                                     style="width:198px"><input
                        type="text" class="input-txt" style="width:172px" id="catorage" autocomplete="off"
                        placeholder="类别" value=""><span class="trigger"></span></span></li>
                <li id="customer" style="display: list-item;"><label>客户:</label><span class="mod-choose-input"
                                                                                      id="filter-customer"><input
                        type="text" class="ui-input" id="customerAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="supplier"><label>供应商:</label><span class="mod-choose-input" id="filter-supplier"><input
                        type="text" class="ui-input" id="supplierAuto"><span class="ui-icon-ellipsis"></span></span>
                </li>
                <li id="goods"><label>商品:</label><span class="mod-choose-input" id="filter-goods"><input type="text"
                                                                                                         class="ui-input"
                                                                                                         id="goodsAuto"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="sales" style="display: list-item;"><label>销售人员:</label><span class="mod-choose-input"
                                                                                     id="filter-saler"><input
                        type="text" class="ui-input" id="salerAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="remarks"><label>备注(分录):</label><input type="text" value="请输入备注查询" class="ui-input ui-input-ph"
                                                              name="remarkCon" id="remarkCon"></li>
                <li id="billNum" style="display: list-item;"><label>销售单号</label><input type="text" value="请输入单号查询"
                                                                                       style="width:115px;"
                                                                                       class="ui-input ui-input-ph"
                                                                                       name="matchCon" id="matchCon">
                </li>
                <li id="bill_no"><label>发票号:</label><input type="text" class="ui-input ui-input-ph" id="billNoAuto">
                </li>
                <li id="bill_title"><label>发票抬头:</label><input type="text" class="ui-input ui-input-ph"
                                                               id="billTitleAuto"></li>
                <li id="goodsfilter"><label>商品类别:</label><input type="text" value="" class="ui-input" name="filterCat"
                                                                id="filterCat"></li>
                <li class="chk-list" id="chk-stock"><span class="chk"><input type="checkbox" value="profit"
                                                                             name="showSto">零库存商品</span></li>
                <li id="deliveryDate"><label>预计交货日:</label><input type="text" value=""
                                                                  class="ui-input ui-datepicker-input"
                                                                  name="filter-fromDeliveryDate"
                                                                  id="filter-fromDeliveryDate" maxlength="10"><span
                        class="todate"> 至 </span><input type="text" value="" class="ui-input ui-datepicker-input"
                                                        name="filter-toDeliveryDate" id="filter-toDeliveryDate"
                                                        maxlength="10"></li>
                <li id="storage"><label>仓库:</label><span class="mod-choose-input" id="filter-storage"><input type="text"
                                                                                                             class="ui-input"
                                                                                                             id="storageAuto"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="account"><label>结算账户:</label><span class="mod-choose-input" id="filter-settlementAccount"><input
                        type="text" class="ui-input" id="settlementAccountAuto"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="buName"><label>往来单位:</label><span class="mod-choose-input" id="filter-buName"><input type="text"
                                                                                                             class="ui-input"
                                                                                                             id="buName"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="payerAndPayee"><label>收/付款人:</label><span class="mod-choose-input"
                                                                  id="filter-payerAndPayee"><input type="text"
                                                                                                   class="ui-input"
                                                                                                   id="payerAndPayee"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="saleCustomer"><label>销货单位/购货单位:</label><span class="ui-combo-wrap" id="customerSale"><input
                        type="text" name="" class="input-txt" autocomplete="off" value="" data-ref="date"><i
                        class="ui-icon-ellipsis"></i></span></li>
                <li id="serial"><label>序列号:</label><span class="mod-choose-input"><input type="text" class="ui-input"
                                                                                         id="serNumAuto"
                                                                                         autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li class="chk-list" id="profit-wrap"><span class="chk"><input type="checkbox" value="warehouse"
                                                                               name="warehouse" id="warehouse">在库</span><span
                        class="chk"><input type="checkbox" value="outbound" name="outbound"
                                           id="outbound">已出库</span><span class="chk"><input type="checkbox"
                                                                                            value="isCheck"
                                                                                            name="isCheck" id="isCheck">查询未审核单据</span>
                </li>
                <li id="status-wrap" style="display: list-item;"><label style="display: none;">状态:</label><span
                        class="chk"><input type="checkbox" value="0" name="status"><i>销货</i></span><span
                        class="chk"><input type="checkbox" value="1" name="status"><i>退货</i></span><span class="chk"
                                                                                                         style="display: none;"><input
                        type="checkbox" value="2" name="status"><i>已入库</i></span></li>
                <li id="match"><span class="chk" title="是否显示商品明细"><input type="checkbox" name="match">是否显示商品明细</span>
                </li>
                <li id="chk-realQty"><span class="chk" title="显示可用库存"><input type="checkbox"
                                                                             name="showRealQty">显示可用库存</span></li>
                <li class="chk-list" id="chk-blank" style="display: list-item;"><span class="chk"><input type="checkbox"
                                                                                                         value="profit"
                                                                                                         name="showBlank"><i>回款率100%不显示</i></span>
                </li>
                <li class="chk-list" id="chk-wrap"><span class="chk"><input type="checkbox" value="profit"
                                                                            name="profit"><i>计算毛利</i></span><span
                        class="chk"><input type="checkbox" value="showSku" name="showSku"><i>显示辅助属性</i></span></li>
                <li id="classes"><label class="radio"><input type="radio" name="classes" value="150601">销货</label><label
                        class="radio"><input type="radio" name="classes" value="150602">退货</label></li>
                <li id="billType"><label class="radio"><input type="radio" name="billType" value="0">已全部开票</label><label
                        class="radio checked"><input type="radio" name="billType" value="1" checked="">未全部开票</label>
                </li>
                <li class="chk-list" id="chk-ischecked"><span class="chk"><input type="checkbox" value="ischecked"
                                                                                 name="ischecked">无发生额不显示</span></li>
                <li id="othertype1">
                    <div id="incomeExpenseType"></div>
                </li>
                <li id="othertype2">
                    <div id="incomeName" class="dn"></div>
                </li>
                <li id="othertype3">
                    <div id="expenseName" class="dn"></div>
                </li>
                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
            <a href="http://vip2-gd.youshang.com/report/sale-receipt-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
               id="conditions-trigger" class="ui-btn conditions-trigger" tabindex="-1">&nbsp;更多条件<b></b></a></div>
    </div>
    <!-- no data -->
    <div class="no-query"></div>
    <!-- grid begin -->
    <div class="ui-print" style="display: none;">
        <!-- 列配置 -->
        <div class="cf box-flex">
            <div class="flex">
                <span id="config" class="ui-config"><a
                        href="http://vip2-gd.youshang.com/report/sale-receipt-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a>列设置</span>
            </div>
            <div class="grid-title flex">销售收款一览表</div>
            <div class="fr">
                <a href="http://vip2-gd.youshang.com/report/sale-receipt-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-export btn-sm mrb fl" id="btn-export">导出</a>
                <a href="http://vip2-gd.youshang.com/report/sale-receipt-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-print btn-sm fl" id="btn-print">打印</a>
            </div>
        </div>
        <div class="grid-wrap" id="grid-wrap" style="height: 591px;">
            <!-- <div class="grid-title">销售收款一览表</div> -->
            <div class="grid-subtitle">日期: 2017-11-01 至 2017-11-21</div>
            <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                 style="width: 1334px;">
                <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
                <div class="ui-jqgrid-view" id="gview_grid" style="width: 1334px;">
                    <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                         style="display: none;"><a role="link"
                                                   class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                   style="right: 0px;"><span
                            class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span>
                    </div>
                    <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1334px;">
                        <div class="ui-jqgrid-hbox">
                            <table class="ui-jqgrid-htable" style="width:1640px" role="grid" aria-labelledby="gbox_grid"
                                   cellspacing="0" cellpadding="0" border="0">
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
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 110px;"><span
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
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDISAMOUNT" class="ui-jqgrid-sortable">优惠金额<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
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
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
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
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
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
                    <div class="ui-jqgrid-bdiv" style="height: 434px; width: 1334px;">
                        <div style="position:relative;">
                            <div></div>
                            <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                   aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                   style="width: 1640px;">
                                <tbody>
                                <tr class="jqgfirstrow" role="row" style="height:auto">
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:110px;"></td>
                                    <td role="gridcell" style="height:0px;width:110px;"></td>
                                    <td role="gridcell" style="height:0px;width:120px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:200px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-sdiv" style="width: 1334px;">
                        <div class="ui-jqgrid-hbox">
                            <table role="grid" style="width:1640px" class="ui-jqgrid-ftable" cellspacing="0"
                                   cellpadding="0" border="0">
                                <tbody>
                                <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTTYPE">合计:
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTNAME">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 100px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FEMPNAME">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FTRANSTYPENAME">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FDATE">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 120px;"
                                        aria-describedby="grid_FBILLNO">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FTOTALAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FDISAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FPOSTFEE">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FRPAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_YSAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_BACKRATE">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 200px;"
                                        aria-describedby="grid_FDESC">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLID">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLTYPE">&nbsp;</td>
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


<script src="${pageContext.request.contextPath }/js/judgment/saleAndReceipt.js"></script>

<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree2828" class="ztree ztreeCombo showRoot"
    style="max-height: 200px; top: 143px; left: 524px; width: 250px; display: none;">
    <li id="tree2828_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree2828_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree2828_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree2828_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree2828_1_span"></span></a></li>
</ul>
<div style="left: 0px; top: 0px; visibility: hidden; position: absolute;" class="">
    <table class="ui_border">
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
                                    <div class="ui_title" unselectable="on" style="cursor: move;"></div>
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
                                <div class="ui_content" style="padding: 10px;"></div>
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
</body>

</html>
