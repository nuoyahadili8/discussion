package com.ledict.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.BlogChannel;
import com.ledict.entity.VO.ZtreeVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 博客栏目 Mapper 接口
 * </p>
 */
public interface BlogChannelDao extends BaseMapper<BlogChannel> {

    List<ZtreeVO> selectZtreeData(Map<String, Object> map);

    List<BlogChannel> selectChannelData(Map<String, Object> map);
}
