package com.ledict.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.ledict.entity.base.DataEntity;

/**
 * <p>
 * 博客标签
 * </p>
 */
@TableName("blog_tags")
public class BlogTags extends DataEntity<BlogTags> {

    private static final long serialVersionUID = 1L;

    /**
     * 标签名字
     */
	private String name;
    /**
     * 排序
     */
	private Integer sort;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}


	@Override
	public String toString() {
		return "BlogTags{" +
			", name=" + name +
			", sort=" + sort +
			"}";
	}
}
