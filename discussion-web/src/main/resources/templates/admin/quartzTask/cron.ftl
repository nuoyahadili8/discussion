﻿<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="${site.description}"/>
    <meta name="keywords" content="${site.keywords}"/>
    <meta name="author" content="${site.author}"/>
    <title>Cron 表达式</title>
    <link rel="stylesheet" href="${base}/static/cron/bootstrap.min.css" >
    <link rel="stylesheet" href="${base}/static/cron/fontas/css/font-awesome.min.css">
    <script src="${base}/static/cron/jquery.min.js"></script>
    <script src="${base}/static/cron/bootstrap.min.js"></script>
    <link href="${base}/static/cron/icheck/skin/blue.css" rel="stylesheet">
    <link href="${base}/static/cron/button/buttons.css" rel="stylesheet">
    <script src="${base}/static/cron/icheck/icheck.min.js"></script>
    <script src="${base}/static/cron/spinner/jquery.spinner.min.js"></script>
    <script src="${base}/static/cron/init.js"></script>
    <script src="${base}/static/cron/cronboot.js"></script>
</head>

<div class="container-fluid">
    <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">生成器</h3>
            </div>
            <div class="panel-body">

                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#t_second" data-toggle="tab">秒</a></li>
                    <li><a href="#t_min" data-toggle="tab">分</a></li>
                    <li><a href="#t_hour" data-toggle="tab">时</a></li>
                    <li><a href="#t_day" data-toggle="tab">日</a></li>
                    <li><a href="#t_month" data-toggle="tab">月</a></li>
                    <li><a href="#t_quarter" data-toggle="tab">季</a></li>
                    <li><a href="#t_week" data-toggle="tab">周</a></li>
                    <li><a href="#t_year" data-toggle="tab">年</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="t_second">

                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_second" name="second"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每秒</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="second" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="second">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 秒
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="second">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        秒
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="second" class="loopradio">
                                        &nbsp; &nbsp;循环&nbsp; 从
                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="second">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 秒 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每

                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="second">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        秒 执行一次
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p><input type="radio" name="second" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="secondList" id="l_second">

                                </div>
                            </div>
                            </p>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="t_min">
                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_minute" name="min"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每分</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="min" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="min">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 分
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="min">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        分
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="min" class="loopradio">
                                        &nbsp; &nbsp;循环&nbsp; 从
                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="min">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 分 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每

                                        <input type="text" data-max="59" value="0" style="wid50px;" class="numberspinner"
                                               name="min">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        分 执行一次
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p><input type="radio" name="min" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="minList" id="l_min">

                                </div>
                            </div>
                            </p>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="t_hour">

                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_hour" name="hour"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每时</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="hour" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" data-rule="hour" style="wid50px;" class="numberspinner"
                                               name="hour">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 时
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" data-rule="hour" style="wid50px;" class="numberspinner"
                                               name="hour">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        时
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="hour" class="loopradio">
                                        &nbsp; &nbsp;循环&nbsp; 从
                                        <input type="text" data-rule="hour" style="wid50px;" class="numberspinner"
                                               name="hour">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 时 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每

                                        <input type="text" data-rule="hour" style="wid50px;" class="numberspinner"
                                               name="hour">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        时 执行一次
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p><input type="radio" name="hour" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="hourList" id="l_hour">

                                </div>
                            </div>
                            </p>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="t_day">
                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_day" name="day"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每日</p></div>

                        <div class="radiocheck"><p><input type="radio" name="day" class="noconfirmradio">&nbsp;
                            &nbsp; 不指定(指定周时，日 需设置为不指定)</p></div>

                        <div class="radiocheck"><p><input type="radio" name="day" class="lastdayradio">&nbsp;
                            &nbsp; 月最后一日</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="day" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" data-rule="day" style="wid50px;" class="numberspinner"
                                               name="day">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 日
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" data-rule="day" style="wid50px;" class="numberspinner"
                                               name="day">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        日
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="day" class="loopradio">
                                        &nbsp; &nbsp;循环&nbsp; 从
                                        <input type="text" data-rule="day" style="wid50px;" class="numberspinner"
                                               name="day">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 日 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每

                                        <input type="text" data-rule="day" style="wid50px;" class="numberspinner"
                                               name="day">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        日 执行一次
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-6">
                                    <div data-trigger="spinner" class="nearspin">
                                        <input type="radio" name="day" class="nearradio">
                                        &nbsp; &nbsp;每月&nbsp; 离
                                        <input type="text" data-rule="day" style="wid50px;" class="numberspinner"
                                               name="day">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 日 最近工作日
                                    </div>
                                </div>

                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p><input type="radio" name="day" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="dayList" id="l_day">

                                </div>
                            </div>
                            </p>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="t_month">

                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_month" name="month"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每月</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="month" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" data-rule="month" style="wid50px;" class="numberspinner"
                                               name="month">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 月
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" data-rule="month" style="wid50px;" class="numberspinner"
                                               name="month">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        月
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="month" class="loopradio">
                                        &nbsp; &nbsp;循环&nbsp; 从
                                        <input type="text" data-rule="month" style="wid50px;" class="numberspinner"
                                               name="month">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 月 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每

                                        <input type="text" data-rule="month" style="wid50px;" class="numberspinner"
                                               name="month">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        月 执行一次
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p><input type="radio" name="month" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="monthList" id="l_month">

                                </div>
                            </div>
                            </p>
                        </div>

                    </div>


                    <div class="tab-pane fade" id="t_quarter">
                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_quarter" name="quarter"
                                                          class="firstradioreactor">&nbsp;
                            &nbsp; 不指定</p></div>


                        <div class="radiocheck">
                            <p><input type="radio" name="quarter" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="qtList" id="quarter_spe">
                                    <div class='col-xs-1 col-sm-1 col-md-4'><label><input type='checkbox'
                                                                                          value="1,4,7,10"> &nbsp;每季度第一个月</label>
                                    </div>
                                    <div class='col-xs-1 col-sm-1 col-md-4'><label><input type='checkbox'
                                                                                          value="2,5,8,11"> &nbsp;每季度第二个月</label>
                                    </div>
                                    <div class='col-xs-1 col-sm-1 col-md-4'><label><input type='checkbox'
                                                                                          value="3,6,9,12"> &nbsp;每季度第三个月</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="monthList" id="l_quarter">
                                </div>
                            </div>
                            </p>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="t_week">
                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_week" name="week"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每周</p></div>

                        <div class="radiocheck"><p><input type="radio" name="week" class="noconfirmradio">&nbsp;
                            &nbsp; 不指定(指定日时，周 需设置为不指定)</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="week" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从周
                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到周

                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>

                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        <input type="radio" name="week" class="loopradio">
                                        &nbsp; &nbsp;循环 &nbsp;从周
                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 开始
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="loopspin">
                                        每隔

                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>
                                        天执行一次

                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="designspin">
                                        <input type="radio" name="week" class="designradio">
                                        &nbsp; &nbsp;指定&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第
                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a> 周的
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-3">
                                    <div data-trigger="spinner" class="designspin">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;周

                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>

                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-6">
                                    <div data-trigger="spinner" class="lastspin">
                                        <input type="radio" name="week" class="lastradio">
                                        &nbsp; &nbsp;本月最后一个周
                                        <input type="text" data-rule="percent" style="wid50px;" class="numberspinner"
                                               name="week">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a>
                                    </div>
                                </div>

                            </div>
                            </p>
                        </div>

                        <div class="radiocheck">
                            <p><input type="radio" name="week" class="choiceradio">&nbsp; &nbsp;自定义

                            <div class="row">
                                <div class="weekList" id="l_week">

                                </div>
                            </div>
                            </p>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="t_year">
                        <div class="radiocheck"><p><input type="radio" checked="checked" id="r_year" name="year"
                                                          class="unselectradio">&nbsp;
                            &nbsp; 不指定</p></div>
                        <div class="radiocheck"><p><input type="radio" name="year"
                                                          class="firstradio">&nbsp;
                            &nbsp; 每年</p></div>


                        <div class="radiocheck">
                            <p>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        <input type="radio" name="year" class="cycleradio">
                                        &nbsp; &nbsp;周期&nbsp; 从
                                        <input type="text" style="wid50px;" class="numberspinner"
                                               name="year" value="2015">
                                        <a href="javascript:;" data-spin="down"><i
                                                class=" icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i
                                                class="  icon-plus-sign icon-large"></i></a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div data-trigger="spinner" class="cyclespin">
                                        到

                                        <input type="text" style="wid50px;" class="numberspinner"
                                               name="year" value="2016">
                                        <a href="javascript:;" data-spin="down"><i
                                                class="  icon-minus-sign icon-large "></i></a>
                                        <a href="javascript:;" data-spin="up"><i class="icon-plus-sign icon-large"></i></a>

                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>


                    </div>


                </div>


                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">表达式结果</h3>
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">

                                <thead>
                                <tr>
                                    <th>秒</th>
                                    <th>分</th>
                                    <th>时</th>
                                    <th>日</th>
                                    <th>月</th>
                                    <th>周</th>
                                    <th>年</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><span name="v_second">*</span></td>
                                    <td><span name="v_min">*</span></td>
                                    <td><span name="v_hour">*</span></td>
                                    <td><span name="v_day">*</span></td>
                                    <td><span name="v_month">*</span></td>
                                    <td><span name="v_week">?</span></td>
                                    <td><span name="v_year"></span></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>

                        <div class="well well-sm">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                    <b>Cron表达式：</b>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-8">
                                    <input type="text" name="cron" style="wid 100%;" value="* * * * * ?" id="cron"/>
                                    <input type="hidden" id="transCron" name="transCron" value=""/>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2">
                                    <a id="explain" href="javascript:void(0)"
                                       class="button button-3d button-primary button-rounded button-small">解析到生成器</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</html>
