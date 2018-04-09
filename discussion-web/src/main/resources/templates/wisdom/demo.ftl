<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>博客内容--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="${site.description}"/>
    <meta name="keywords" content="${site.keywords}"/>
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all" />
    <link rel="stylesheet" href="${base}/static/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${base}/static/icon/css/font-awesome.min.css">
    <!--[if IE]>
    <link rel="stylesheet" href="${base}/static/icon/fonts/font-awesome-ie7.min.css">
    <![endif]-->
    <style>
        .detail-body{
            margin: 20px 0 0;
            min-height: 306px;
            line-height: 26px;
            font-size: 16px;
            color: #333;
            word-wrap: break-word;
        }
        /* blockquote 样式 */
        blockquote {
            display: block;
            border-left: 8px solid #d0e5f2;
            padding: 5px 10px;
            margin: 10px 0;
            line-height: 1.4;
            font-size: 100%;
            background-color: #f1f1f1;
        }

        /***
        *  ztree 图标变成黄色
        */
        .ztree .line{
            line-height: 0;
            border-top:none;
            float: none;
        }
        .ztree li span.button.ico_docu {
            background-position: -110px 0;
            margin-right: 2px;
            vertical-align: top;
        }

        /* code 样式 */
        code {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            background-color: #f1f1f1;
            border-radius: 3px;
            padding: 3px 5px;
            margin: 0 3px;
        }
        pre code {
            display: block;
        }

    </style>
</head>
<body class="childrenBody">
<div class="layui-col-xs3">
    <fieldset class="layui-elem-field">
        <legend>卷宗目录</legend>
        <form class="layui-form" action="">
            <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="智慧阅卷" checked=""/>
                <input type="radio" name="sex" value="2" title="档案管理"/>
            </div>
        </form>
        <div class="layui-collapse" lay-accordion>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">起诉状或口诉笔录</h2>
                <div class="layui-colla-content layui-show">起诉状1</div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">答辩状及附件</h2>
                <div class="layui-colla-content layui-show">原告提交证据目录及材料</div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">原告提交证据目录及材料</h2>
                <div class="layui-colla-content layui-show">证据目录</div>
                <div class="layui-colla-content layui-show">道路交通事故责任认定书</div>
                <div class="layui-colla-content layui-show">保险单</div>
            </div>
        </div>
    </fieldset>
</div>
<div class="layui-col-xs5">
    <fieldset class="layui-elem-field">
        <legend>卷宗内容</legend>
        <div class="layui-btn-group" style="float:right;padding-right:8px">
            <button class="layui-btn layui-btn-primary layui-btn-sm">工具栏</button>
            <!-- 编辑 -->
            <button class="layui-btn layui-btn-primary layui-btn-sm"><a href="#" title="编辑"><i class="fa fa-edit"></i></a></button>
            <button class="layui-btn layui-btn-primary layui-btn-sm"><a href="#" title="打印"><i class="fa fa-print"></i></a></button>
            <button class="layui-btn layui-btn-primary layui-btn-sm"><a href="#" title="导出"><i class="fa fa-save"></i></a></button>
        </div>
        <br/>
        <div class="layui-field-box">
            <form class="layui-form" id="searchForm">
                <div class="layui-inline" style="margin-left: 15px">
                    <label>标题:</label>
                    <div class="layui-input-inline">
                        <input type="text" value="" name="s_title" placeholder="请输入标题" class="layui-input search_input">
                    </div>
                </div>
                <div class="layui-inline" style="margin-left: 15px">
                    <label>发布时间:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="s_beginPublistTime" id="beginPublistTime" lay-verify="date"  autocomplete="off" class="layui-input">
                    </div>
                    <span>-</span>
                    <div class="layui-input-inline">
                        <input type="text" name="s_endPublistTime" id="endPublistTime" lay-verify="date"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="margin-left: 15px">
                    <label>内容:</label>
                    <div class="layui-input-inline">
                        <input type="text" value="" name="s_content" placeholder="请输入内容" class="layui-input search_input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
                </div>
                <div class="layui-inline" >
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-normal" data-type="addBlogArticle">添加博客内容</a>
                </div>
            </form>
        </div>
    </fieldset>
</div>
<div class="layui-col-xs4">
    <fieldset class="layui-elem-field">
        <legend>智慧阅卷</legend>
        <div class="layui-btn-group" style="float:right;padding-right:8px">
            <button class="layui-btn layui-btn-primary layui-btn-sm">工具栏</button>
            <!-- 编辑 -->
            <button class="layui-btn layui-btn-primary layui-btn-sm"><a href="#" title="批注">批注</a></button>
            <button class="layui-btn layui-btn-primary layui-btn-sm"><a href="#" title="庭审提纲生成">庭审提纲生成</a></button>
        </div>
        <br /><br />
        <h1>22222222222222</h1>
    </fieldset>
</div>
<#--<script type="text/javascript" src="${base}/static/zTree/v3/js/jquery-1.4.4.min.js"></script>-->
<script type="text/javascript" src="${base}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script type="text/javascript" src="${base}/static/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script>
    layui.use(['element', 'layer', 'form'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

//        //监听折叠
//        element.on('collapse(test)', function(data){
//            layer.msg('展开状态：'+ data.show);
//        });
    });
</script>
</body>
</html>