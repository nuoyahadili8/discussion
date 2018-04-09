简介：
Discussion是一套基于Spring Boot 1.5.9开发的部署系统，依赖简单，一套MS SQL Server和redis即可运行，操作简单明了，适用于百台规模以下机器的部署运维操作。
主要功能：
系统用户,角色,权限增删改查,权限分配，权限配色
系统字典
配置网站基本信息，包括博客数据限制
查看系统关键操作的日志(可在系统后台自动定制需要监控的模板)
在线新增数据库并直接生成 前，后台基本源码，放到源码相应目录中重启tomcat可直接使用，预览
系统定时任务的新增改查 立即启动 暂停 恢复
使用Maven对项目进行模块化管理，提高项目的易开发性、扩展性。
可以无限的扩展子系统，子系统之间使用Dubbo或MQ进行通信。

技术框架：
核心框架：SpringBoot
安全框架：Apache Shiro 1.3.2
缓存框架：Redis 4.0
搜索框架：Lucene 7.1
任务调度：Spring + Quartz
持久层框架：MyBatis + MyBatis-Plus
数据库连接池：Alibaba Druid 1.0.2
日志管理：SLF4J 1.7、Log4j
前端框架：layui
后台模板：layuicms 2.0。
富文本：wangEditor
云存储：七牛云存储
分布式文件系统：Fastdfs

开发环境：
IDE:idea
DB:Mysql5.7 Redis(Window版本,Linux版本)
JDK:JAVA 8
WEB:Tomcat8 （采用springboot框架开发时,并没有用到额外的tomcat 用的框架自带的）

目录结构：
Discussion:
      ├─Discussion-core `(通用模块)`
      ├─Discussion-dao    (持久层模块)
      ├─Discussion-vo    `(实体类模型)`
      └─Discussion-web `(基于layui的前端实现, 使用layuicms2.0脚手架:8080)`
          ├─build (项目构建配置)
          ├─src/main
             ├─java
             ├─resouces (静态资源)
             ├─log (日志文件)
             ├─mapper (mybatis的xml文件)
             ├─sql (mysql数据库文件)
             ├─static (静态资源文件)
             └─templates  (页面文件)

缓冲管理：
基于spring-boot-starter方式引入redis缓存管理组件（基于注解），通过endpoint向外暴露服务的所有缓存，从而实现集中统一管理。
快速体验：
将源码导入IDE
将源码路径下的src/main/resources/sql 中的discussion.sql导入到数据库中(qrtz.sql为定时任务的几张jibenbiao mysiteforme.sql已经包含)
将src\main\resources目录下的application.yml配置文件里的mysql用户名密码改成你本地的
安装redis数据库 默认数据库密码为空(注*** 必须安装redis 否则本系统会报错)
redis的window版本有些地方下载可以下不下来,可以到这里下载https://pan.baidu.com/s/1dG22JQT
注册redis系统服务 打开cmd--->切换到安装redis的目录--->redis-server.exe --service-install redis.windows-service.conf
启动系统 预览地址为:http://localhost:8080 管理员用户名：admin 密码：1

系统截图：



