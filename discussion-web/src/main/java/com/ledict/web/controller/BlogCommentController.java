package com.ledict.web.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ledict.core.annotation.SysLog;
import com.ledict.core.service.BlogCommentService;
import com.ledict.core.util.LayerData;
import com.ledict.core.util.RestResponse;
import com.ledict.entity.BlogComment;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 博客评论  前端控制器
 * </p>
 */
@Controller
@RequestMapping("/admin/blogComment")
public class BlogCommentController {
    private static final Logger LOGGER = LoggerFactory.getLogger(BlogCommentController.class);

    @Autowired
    private BlogCommentService blogCommentService;

    @GetMapping("list")
    @SysLog("跳转博客评论列表")
    public String list(){
        return "/admin/blogComment/list";
    }

    @RequiresPermissions("blog:comment:list")
    @PostMapping("list")
    @ResponseBody
    public LayerData<BlogComment> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                       @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                       ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<BlogComment> layerData = new LayerData<>();
        EntityWrapper<BlogComment> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String content = (String) map.get("content");
            if(StringUtils.isNotBlank(content)) {
                wrapper.like("content",content);
            }else{
                map.remove("content");
            }

            String ip = (String) map.get("ip");
            if(StringUtils.isNotBlank(ip)) {
                wrapper.like("ip",ip);
            }else{
                map.remove("ip");
            }

            String isAdminReply = (String) map.get("isAdminReply");
            if(StringUtils.isNotBlank(isAdminReply)) {
                if(isAdminReply.equalsIgnoreCase("true")){
                    wrapper.eq("is_admin_reply",true);
                }else if(isAdminReply.equalsIgnoreCase("false")){
                    wrapper.eq("is_admin_reply",false);
                }else{
                    map.remove("isAdminReply");
                }
            }else{
                map.remove("isAdminReply");
            }

        }
        Page<BlogComment> pageData = blogCommentService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    public String add(){
        return "/admin/blogComment/add";
    }

    @PostMapping("add")
    @ResponseBody
    public RestResponse add(BlogComment blogComment, HttpServletRequest request){
        if(StringUtils.isBlank(blogComment.getContent())){
            return RestResponse.failure("评论内容不能为空");
        }
        blogCommentService.insert(blogComment);
        return RestResponse.success();
    }

    @GetMapping("edit")
    public String edit(Long id,Model model){
        BlogComment blogComment = blogCommentService.selectById(id);
        model.addAttribute("blogComment",blogComment);
        return "/admin/blogComment/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    public RestResponse edit(BlogComment blogComment){
        if(null == blogComment.getId() || 0 == blogComment.getId()){
            return RestResponse.failure("ID不能为空");
        }
        if(StringUtils.isBlank(blogComment.getContent())){
            return RestResponse.failure("评论内容不能为空");
        }
        blogCommentService.updateById(blogComment);
        return RestResponse.success();
    }

    @RequiresPermissions("blog:comment:delete")
    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除博客评论数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        BlogComment blogComment = blogCommentService.selectById(id);
        blogComment.setDelFlag(true);
        blogCommentService.updateById(blogComment);
        return RestResponse.success();
    }

    @RequiresPermissions("blog:comment:reply")
    @PostMapping("adminReplay")
    @ResponseBody
    @SysLog("管理员回复")
    public RestResponse adminReplay(BlogComment blogComment){
        if(null == blogComment.getId() || 0 == blogComment.getId()){
            return RestResponse.failure("ID不能为空");
        }
        if(StringUtils.isBlank(blogComment.getReplyContent())){
            return RestResponse.failure("回复内容不能为空");
        }
        String content = blogComment.getReplyContent().replace("\"", "\'");
        blogComment.setReplyContent(content);
        blogComment.setAdminReply(true);
        blogCommentService.saveOrUpdateBlogComment(blogComment);
        return RestResponse.success();
    }

}