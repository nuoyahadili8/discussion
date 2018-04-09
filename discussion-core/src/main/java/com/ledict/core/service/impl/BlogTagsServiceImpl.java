package com.ledict.core.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ledict.core.service.BlogTagsService;
import com.ledict.dao.BlogTagsDao;
import com.ledict.entity.BlogTags;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 博客标签 服务实现类
 * </p>
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class BlogTagsServiceImpl extends ServiceImpl<BlogTagsDao, BlogTags> implements BlogTagsService {

    @Override
    public Integer getCountByName(String name) {
        EntityWrapper<BlogTags> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.eq("name",name);
        return selectCount(wrapper);
    }

    @Override
    public void saveTag(BlogTags tags) {
        Object o = selectObj(Condition.create()
                .setSqlSelect("max(sort)")
                .eq("del_flag",false));
        int sort = 0;
        if(o != null){
            sort =  (Integer)o +1;
        }
        tags.setSort(sort);
        insert(tags);
    }

    @Override
    public List<BlogTags> listAll() {
        EntityWrapper<BlogTags> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.orderBy("sort",false);
        return selectList(wrapper);
    }

    @Cacheable(value = "blogTagsData",key = "'blog_tags_channel_'+#channelId",unless = "#result == null or #result.size() == 0")
    @Override
    public List<BlogTags> getTagsByChannelId(Long channelId) {
        List<BlogTags> list = baseMapper.getTagsByChannelId(channelId);
        return list;
    }

    @Cacheable(value = "blogTagsData",key = "'blog_tags_article_'+#articleId",unless = "#result == null or #result.size() == 0")
    @Override
    public List<BlogTags> getTagsByArticleId(Long articleId) {
        return baseMapper.getTagsByArticleId(articleId);
    }

    @CacheEvict(value = "blogTagsData",allEntries = true)
    @Override
    public void deleteThisTag(Long id) {
        deleteById(id);
        baseMapper.removeArticleTagsByTagId(id);
    }
}
