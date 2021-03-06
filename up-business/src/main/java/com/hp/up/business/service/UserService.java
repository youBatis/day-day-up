package com.hp.up.business.service;

import com.hp.up.core.Entity.User;
import com.hp.up.core.web.page.PageDto;
import com.hp.up.core.web.page.PagingList;

import java.io.InputStream;
import java.util.List;

/**
 * com.hp.up.business.service
 * Created by haopeng on 2017/8/7  21:52.
 */
public interface UserService extends BaseService<User>{

    /**
     * 通过用户名查询用户 -- 用于登录
     * @param userName 用户名
     * @return User实体
     */
    User getUserByName(String userName);

    /**
     * 分页查询用户信息
     * @param pageDto pageDto
     * @param user User实体
     * @return PagingList
     */
    PagingList<User> getUserPage(PageDto pageDto,User user);


    /**
     * 更新用户最后登录时间
     * @param id id
     * @return int
     */
    int updateLastLoginTime(Long id);

    /**
     * 保存或者更新用户
     * @param user
     * @return
     */
    int saveOrUpdateUser(User user);

    /**
     * excel
     * @return
     * @throws Exception
     */
    InputStream getInputStream() throws Exception;

}
