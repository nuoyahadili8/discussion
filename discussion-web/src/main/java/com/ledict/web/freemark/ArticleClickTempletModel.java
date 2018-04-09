package com.ledict.web.freemark;

import com.ledict.core.service.BlogArticleService;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * todo:文章点击量标签
 */
@Component
public class ArticleClickTempletModel implements TemplateMethodModelEx {

    @Autowired
    private BlogArticleService blogArticleService;
    @Override
    public Object exec(@SuppressWarnings("rawtypes")List list) {
        if(list == null || list.size() == 0){
            throw new RuntimeException("参数为空");
        }
        SimpleNumber simpleNumber = (SimpleNumber) list.get(0);
        Long articleId = simpleNumber.getAsNumber().longValue();

        return blogArticleService.getArticleClick(articleId);
    }
}
