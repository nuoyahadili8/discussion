<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- 页面描述 -->
    <meta name="description" content="${site.description}"/>
    <!-- 页面关键词 -->
    <meta name="keywords" content="${site.keywords}"/>
    <!-- 网页作者 -->
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/main.css" media="all" />
    <style>
        .layui-layout-left{
            left: 230px
        }

        .nav ul {
            width: 100%;
            text-align: center;
        }
        .nav ul li {
            display: inline-block;
            list-style: none;
            width:30px;
        }
    </style>
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo">会审办系统平台</a>
            <!-- 显示/隐藏菜单 -->
            <a href="javascript:" class="iconfont hideMenu icon-menu1"></a>
            <!-- 搜索 -->
            <#--<div class="layui-form component">-->
                <#--<select name="modules" lay-verify="required" lay-search="">-->
                    <#--<option value="">直接选择或搜索选择</option>-->
                    <#--<#if (userMenu?size>0)>-->
                        <#--<#list userMenu as items>-->
                        <#--<option value="${items.href}">${items.name}</option>-->
                        <#--</#list>-->
                    <#--</#if>-->
                <#--</select>-->
                <#--<i class="layui-icon">&#xe615;</i>-->
            <#--</div>-->
            <ul class="layui-nav layui-layout-left" id="top_menus">

            </ul>

            <!-- 天气信息 -->
            <#--<div class="weather" pc>-->
                <#--<div id="tp-weather-widget"></div>-->
                <#--<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>-->
                <#--<script>tpwidget("init", {-->
                    <#--"flavor": "slim",-->
                    <#--"location": "WX4FBXXFKE4F",-->
                    <#--"geolocation": "enabled",-->
                    <#--"language": "zh-chs",-->
                    <#--"unit": "c",-->
                    <#--"theme": "chameleon",-->
                    <#--"container": "tp-weather-widget",-->
                    <#--"bubble": "disabled",-->
                    <#--"alarmType": "badge",-->
                    <#--"color": "#FFFFFF",-->
                    <#--"uid": "U9EC08A15F",-->
                    <#--"hash": "039da28f5581f4bcb5c799fb4cdfb673"-->
                <#--});-->
                <#--tpwidget("show");</script>-->
            <#--</div>-->

            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="javascript:"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
                </li>
                <li class="layui-nav-item" pc>
                    <a href="javascript:" onclick="clearStorage()"><i class="iconfont icon-prohibit"></i><cite>清除缓冲</cite></a>
                </li>
            <#--<li class="layui-nav-item" mobile>-->
            <#--<a href="${base}/systemLogout" class="signOut"><i class="iconfont icon-loginout"></i> 退出</a>-->
            <#--</li>-->
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
                </li>
                <li class="layui-nav-item" pc>
                    <a href="javascript:">
                    <#--<img src="<#if (currentUser.icon??)>${currentUser.icon}<#else>${base}/static/images/face.jpg</#if>" class="layui-circle" width="35" height="35">-->
                        <i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i>
                        <cite><#if currentUser.nickName!''>${currentUser.nickName}<#else>${currentUser.loginName}</#if></cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:" data-url="${base}/admin/system/user/userinfo"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
                        <dd><a href="javascript:" data-url="${base}/admin/system/user/changePassword"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
                        <dd><a href="javascript:" class="changeSkin"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="${base}/systemLogout" class="signOut"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像" ><img src="<#if (currentUser.icon??)>${currentUser.icon}<#else>${base}/static/images/face.jpg</#if>"></a>
            <p>你好！<span class="userName"><#if currentUser.nickName!''>${currentUser.nickName}<#else>${currentUser.loginName}</#if></span>, 欢迎登录</p>
        </div>
        <div class="navBar layui-side-scroll"></div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">

                <li class="layui-this" lay-id="" style="margin-left:0px;"><a href=""><span><i class="iconfont icon-computer" style="margin-right: 10px"></i></span> <span>后台首页</span></span></a></li>

            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:"><i class="iconfont icon-caozuo"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${base}/main"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p>Copyright © 2018北京市律典通科技有限公司  Design By ledict <a href="http://www.ledict.com/" target="_blank">山西省太原市高新区高新街9号瑞杰科技中心A座9层 </a></p>
    </div>
</div>
<script>
    var baseUrl = "${base}";
</script>
<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/leftNav.js?v=2.0"></script>
<script type="text/javascript" src="${base}/static/js/index.js?t=3.0"></script>
</body>
</html>