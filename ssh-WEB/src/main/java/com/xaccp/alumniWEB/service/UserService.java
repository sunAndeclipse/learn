package com.xaccp.alumniWEB.service;

import java.util.List;

import com.xaccp.alumniWEB.entity.User;

/**
 * 商品操作-服务层接口
 *
 */
public interface UserService {
     
    void saveProduct(User user);
    /**
     * 
     * @param userName
     * @param UserPwd
     * @return
     */
    List<User> findUserByUnameAndUpwd(String userName,String upwd);
    /**
     * 获取表单中的name属性判断用户名是否存在
     * @param userName
     * @return
     */
    User getUserByUsername(String userName);
   
 
}