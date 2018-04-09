package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Menu;
import com.ledict.entity.VO.ShowMenu;
import com.ledict.entity.VO.ZtreeVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface MenuService extends IService<Menu> {

    List<Menu> selectAllMenus(Map<String, Object> map);

    List<ZtreeVO> showTreeMenus();

    List<ShowMenu> getShowMenuByUser(Long id,String pid);

    List<ShowMenu> getShowMenuByUserAndTopMenu(Long id);

    void saveOrUpdateMenu(Menu menu);

    int getCountByPermission(String permission);

    int getCountByName(String name);

}
