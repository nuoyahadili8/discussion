package com.ledict.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.BlogTags;

import java.util.List;

/**
 * <p>
 * 博客标签 Mapper 接口
 * </p>
 */
public interface BlogTagsDao extends BaseMapper<BlogTags> {

    /**
     * 根据栏目ID获取标签集合
     * @param channelId
     * @return
     */
    List<BlogTags> getTagsByChannelId(Long channelId);

    /**
     * 根据文章ID获取标签集合
     * @param articleId
     * @return
     */
    List<BlogTags> getTagsByArticleId(Long articleId);

    /**
     * 删除跟这个标签相关的所有关系
     * @param tagId 标签ID
     */
    void removeArticleTagsByTagId(Long tagId);
}
