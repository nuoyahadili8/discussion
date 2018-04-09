package com.ledict.core.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Maps;
import com.ledict.core.service.BlogCommentService;
import com.ledict.core.util.Constants;
import com.ledict.dao.BlogCommentDao;
import com.ledict.entity.BlogComment;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 博客评论 服务实现类
 * </p>
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class BlogCommentServiceImpl extends ServiceImpl<BlogCommentDao, BlogComment> implements BlogCommentService {

    @Override
    public Integer getMaxFloor(Long articleId) {
        Object o = null;
        if(articleId != null){
            o = selectObj(Condition.create().setSqlSelect("max(floor)").eq("article_id",articleId));
        }else{
            o = selectObj(Condition.create().setSqlSelect("max(floor)").eq("type", Constants.COMMENT_TYPE_LEVING_A_MESSAGE));
        }

        Integer floor = 0;
        if(o != null){
            floor =  (Integer)o;
        }
        return floor;
    }

    @Override
    public Integer getMaxFloorByReply(Long replyId) {
        Object o = selectObj(Condition.create().setSqlSelect("max(floor)").eq("reply_id",replyId));
        Integer floor = 0;
        if(o != null){
            floor =  (Integer)o;
        }
        return floor;
    }

    @Override
    public Page<BlogComment> getArticleComments(Long articleId,Integer type,Page<BlogComment> page) {
        Map<String,Object> map = Maps.newHashMap();
        if(articleId != null){
            map.put("articleId",articleId);
        }
        map.put("type",type);
//        map.put("start",page.getCurrent() == 1 ? 0 : (page.getCurrent()-1)*page.getLimit());
//        map.put("limit",page.getLimit());
//        List<BlogComment> list = baseMapper.selectArticleComments(map);
//        Integer total = baseMapper.selectArticleCommentsCount(map);
//        page.setRecords(list);
//        page.setTotal(total);
        List<BlogComment> list = baseMapper.selectArticleCommentsByPlus(map,page);
        page.setRecords(list);
        return page;
    }

    @CacheEvict(value = "commentData",key = "'article_'+#blogComment.articleId+'_commentcount'")
    @Override
    public void saveOrUpdateBlogComment(BlogComment blogComment) {
        insertOrUpdate(blogComment);
    }

    @Cacheable(value = "commentData",key = "'article_'+#articleId+'_commentcount'")
    @Override
    public Integer getArticleCommentsCount(Long articleId) {
        EntityWrapper<BlogComment> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.eq("type",Constants.COMMENT_TYPE_ARTICLE_COMMENT);
        wrapper.eq("article_id",articleId);
        Integer count = selectCount(wrapper);
        return count;
    }
}
