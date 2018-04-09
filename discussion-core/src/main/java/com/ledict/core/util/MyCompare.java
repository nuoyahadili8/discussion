package com.ledict.core.util;


import com.ledict.entity.Menu;

import java.util.Comparator;

/**
 * todo:菜单排序
 */
public class MyCompare implements Comparator<Menu> {
    @Override
    public int compare(Menu a, Menu b) {
        if(a.getParentIds().contains(b.getParentIds())){
            return -1;
        }else{
            return 1;
        }
    }
}
