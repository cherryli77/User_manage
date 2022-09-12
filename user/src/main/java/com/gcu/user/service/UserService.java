package com.gcu.user.service;

import com.gcu.user.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User queryUserByActAndPwd(Map<String, Object> map);

    List<User> getAllUser();

    User getUserByCode(Integer code);

    int removeUserByCode(Integer code);

    int addUser(User user);

    int updateUser(User user);
}
