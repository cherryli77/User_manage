package com.gcu.user.service;

import com.gcu.user.bean.User;
import com.gcu.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    public User queryUserByActAndPwd(Map<String, Object> map) {

        return userMapper.selectUserByActAndPwd(map);
    }

    public List<User> getAllUser() {
        return userMapper.getAllByPeople();
    }

    public User getUserByCode(Integer code) {
        return userMapper.getUserByCode(code);
    }

    public int removeUserByCode(Integer code) {
        return userMapper.deleteByPrimaryKey(code);
    }

    public int addUser(User user) {
        return userMapper.insert(user);
    }

    public int updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }


}
