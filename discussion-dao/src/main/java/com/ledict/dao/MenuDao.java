package com.ledict.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.Menu;
import com.ledict.entity.VO.ShowMenu;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 */

public interface MenuDao extends BaseMapper<Menu> {

    List<Menu> showAllMenusList(Map map);

    List<Menu> getMenus(Map map);

    List<ShowMenu> selectShowMenuByUser(Map<String, Object> map);

    List<ShowMenu> selectShowMenuByUserAndTopMenu(Map<String, Object> map);
}