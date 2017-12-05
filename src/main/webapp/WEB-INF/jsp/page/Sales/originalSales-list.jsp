<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-11-30
  Time: 8:57
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

    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
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

    <script src="${pageContext.request.contextPath }/js/lightbox.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/lightbox.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .mod-toolbar-top strong.txt, #period {
            font-size: 14px;
            margin-right: 10px;
        }

        .ul-inline li label {
            vertical-align: middle;
        }

        .ul-inline li input {
            vertical-align: middle;
        }

        a.modeBtn {
            vertical-align: middle;
            width: 25px;
            height: 25px;
            display: inline-block;
            background: url("/css/img/ov_icons_2.png") no-repeat 0 0;
        }

        a.modeBtn.toPic.enable {
            background-position: -20px 2px;
        }

        a.modeBtn.toPic {
            background-position: 2px 2px;
        }

        a.modeBtn.toList.enable {
            background-position: -20px -22px;
        }

        a.modeBtn.toList {
            background-position: 2px -22px;
        }

        /*.cbox{background: #979292; font-size: 12px; color: #fff;  padding: 1px;  line-height: 12px;   border-radius: 3px;   z-index: 1;  border: 2px solid #fff;}*/
        /*.checked .cbox{background: #408BB5;}*/
        .container {
            margin: 0 15px;
            position: relative;
        }

        /*左侧分类栏样式*/
        #bsCategory {
            width: 200px;
            background: #fff;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            border: 1px solid #dedede;
            overflow: hidden;
        }

        #bsCategory h3 {
            background: #EEEEEE url(/css/default/img/ui-th.png) 0 0 repeat-x;
            border-bottom: 1px solid #dedede;
            color: #555;
            line-height: 30px;
            text-align: center;
        }

        /*右侧内容区样式*/
        /*.container .dataWrapper{ margin-left: 210px;}*/
        .container .dataWrapper {
            margin-top: 30px;
        }

        /*图片视图的样式*/
        #picGridWrap {
            background: #fff;
            padding: 10px;
            border: 1px solid #E4E3E3;
        }

        #picGridWrap .cbox {
            width: 20px;
            height: 20px;
            display: inline-block;
            background: url("/css/img/ov_icons_1.png") no-repeat -1px 2px #fff;
            border-radius: 3px;
            z-index: 1;
        }

        #picGridWrap .cbox:hover {
            background-position: -27px 2px;
        }

        #picGridWrap .checked .cbox {
            background-position: -53px 2px;
        }

        #picGridWrap .groupchk .cbox {
            position: relative;
            top: 4px;
        }

        #picGridWrap .chkAll .cbox {
            position: relative;
            top: 4px;
        }

        #innerCenter a {
            float: none;
        }

        #innerRight {
            float: right;
        }

        #picGridWrap .changeBtns {
            background: #fff;
            padding: 0 0 10px 5px;
            border-bottom: 1px solid #E4E3E3;
        }

        #checkAll {
            margin-right: 10px;
            cursor: pointer;
        }

        #checkAll i {
            border: none;
            margin-right: 3px;
        }

        #sortDate {
            padding-right: 15px;
            cursor: pointer;
            margin-top: 3px;
            z-index: 2;
            vertical-align: middle;
        }

        #sortDate:hover {
            color: #408BB5;
        }

        #sortDate.asc {
            background: url("/css/img/asc.png") no-repeat 52px 2px;
        }

        #sortDate.desc {
            background: url("/css/img/desc.png") no-repeat 52px 2px;
        }

        #picGrid {
            overflow: auto;
            zoom: 1;
        }

        #picGrid .group h3 {
            font-size: 12px;
            font-weight: bold;
            padding-top: 15px;
        }

        #picGrid .group h3 span:hover {
            cursor: pointer;
        }

        #picGrid .group h3 span i {
            margin: 0 5px;
            border: none;
        }

        #picGrid .list {
            padding: 0 10px;
        }

        #picGrid .picItem {
            position: relative;
            float: left;
            width: 160px;
            height: 150px;
            border: 1px solid #ccc;
            margin: 5px; /*overflow: hidden;*/
        }

        #picGrid .picItem:hover {
            cursor: pointer;
            border-color: #408BB5;
        }

        #picGrid .picItem .itemInner {
            position: relative;
            height: 150px;
            width: 160px;
            zoom: 1;
        }

        #picGrid .picItem .itemInner .imgWrap {
            position: absolute;
            bottom: 0;
            right: 0;
            left: 0;
            top: 0;
            margin: auto;
        }

        #picGrid .picItem .img {
            max-width: 140px;
            max-height: 140px;
        }

        #picGrid .picItem img:hover {
        }

        #picGrid .picItem .imgWrap.first {
            top: 0;
            left: -6px;
            bottom: 10px;
            right: 0px;
            /*border: 2px solid #fff;*/
        }

        #picGrid .picItem .imgWrap.first .img {
            max-width: 140px;
            max-height: 110px;
        }

        #picGrid .picItem .imgWrap.second {
            top: 10px;
            left: 10px;
            bottom: 0;
            right: 0;
            border: 2px solid #fff;
        }

        #picGrid .picItem .imgWrap.second .img {
            max-width: 140px;
            max-height: 110px;
        }

        #picGrid .picItem .cbox {
            position: absolute;
            top: 5px;
            left: 5px;
        }

        #picGrid .picItem.selected {
            border-color: #408BB5;
        }

        #picGrid .picItem .tools {
            position: absolute;
            /*background: #ccc;*/
        }

        #picGrid .picItem .tools.top {
            right: 3px;
            top: 3px;
        }

        #picGrid .picItem .tools.top .btn {
            display: none;
            width: 25px;
            height: 25px;
            /*display: inline-block;*/
            background: url("/css/img/ov_icons_1.png") no-repeat 0 0 #fff;
            border-radius: 3px;
            z-index: 1;
            border: none;
        }

        #picGrid .picItem .tools.top .split {
            background-position: 2px -41px;
        }

        #picGrid .picItem .tools.top .split:hover {
            background-position: -23px -41px;
        }

        #picGrid .picItem .tools.top .del {
            background-position: 2px -18px;
        }

        #picGrid .picItem .tools.top .del:hover {
            background-position: -23px -18px;
        }

        #picGrid .picItem:hover .tools.top .btn {
            display: inline-block;
        }

        #picGrid .picItem .tools.bottom {
            bottom: 0;
            background: #e1e1e1;
            width: 100%;
        }

        #picGrid .picItem .tools.bottom a {
            cursor: default;
            display: inline-block;
            padding: 0px 3px;
            color: #fff;
            border: 2px solid #fff;
        }

        #picGrid .picItem .tools .btn {
            cursor: pointer;
            color: #fff;
        }

        #picGrid .picItem .tools.bottom a {
            border: none;
            padding: 0 10px;
            color: #666;
        }

        #picGrid .picItem .tools.bottom .btn:hover {
            text-decoration: underline;
        }

        #picGrid .picItem .tools.bottom .cleanUp {
            float: right;
        }

        /*左侧树的特殊样式限制*/
        #ztree {
            width: 190px;
            overflow: auto;
        }

        #ztree_1_switch {
            display: none;
        }

        #ztree_1_ul {
            padding: 0;
        }

        /*生成凭证选项*/
        .createVoucherPop li {
            margin: -1px 0;
        }

        .createVoucherPop li a {
            width: 200px;
            margin: 0;
            cursor: pointer;
        }

        /*列表视图的样式*/
        .autoGrid {
            padding: 0;
        }

        .autoGrid tr.jqgroup td {
            padding: 5px;
        }

        #checkboxWrap {
            padding-left: 10px;
        }

        .picItem .bottom {
            text-align: center;
            height: 19px;
            line-height: 19px;
            overflow: hidden;
        }
    </style>
</head>
<body style="">
<div class="wrapper">
    <div class="mod-toolbar-top">
        <div class="fl">
            <ul class="ul-inline">
                <li>
                    <span id="billType"></span>
                </li>

                <li id="checkboxWrap">
                    <label class="chk" style="margin-top:6px; "><input type="checkbox" name="box" value="isVoucher">已生成销售单</label>
                </li>
                <li><a class="ui-btn ui-btn-refresh" id="search" title="刷新"><b></b></a></li>
            </ul>
        </div>
        <div class="fr">

            <a class="ui-btn" id="uploadAttachment">导入附件</a>

            <a class="ui-btn ui-btn-sp" id="create">生成销货单</a>
            <!--       <a class="modeBtn enable toPic"></a>
                  <a class="modeBtn toList"></a> -->
        </div>
    </div>
    <div class="container">

        <div class="dataWrapper" id="picGridWrap">
            <p class="changeBtns">
                <span class="cboxWrap chkAll" id="checkAll"><i class="cbox"></i>全选</span>
                <span id="sortDate" class="desc">上传日期</span>
            </p>
            <div id="picGrid" style="height: 511.4px;"></div>
        </div>
        <div class="dataWrapper autoGrid grid-wrap dn" id="dataGrid">
            <table id="grid">
            </table>
            <div id="page"></div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath }/js/judgment/originalSalesList.js"></script>

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
                            <td class="ui_main" style="width: 432px; height: 143px;">
                                <div class="ui_content" style="padding: 10px;"></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="ui_buttons"></div>
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
<div id="ldg_lockmask"
     style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1977; display: none;"></div>
</body>
</html>
