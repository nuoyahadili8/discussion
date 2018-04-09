package com.ledict.core.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.BlogComment;

/**
 * <p>
 * 博客评论 服务类
 * </p>
 */
public interface BlogCommentService extends IService<BlogComment> {

    /**
     * 根据文章ID查找最大楼层
     * @param articleId
     * @return
     */
    Integer getMaxFloor(Long articleId);

    /**
     * 根据回复ID查找最大楼层
     * @param replyId
     * @return
     */
    Integer getMaxFloorByReply(Long replyId);

    /**
     * 不采用mybatisPlus自动分页
     * @param articleId
     * @param type
     * @param page
     * @return
     */
    Page<BlogComment> getArticleComments(Long articleId, Integer type, Page<BlogComment> page);



    void saveOrUpdateBlogComment(BlogComment blogComment);

    Integer getArticleCommentsCount(Long articleId);
}
