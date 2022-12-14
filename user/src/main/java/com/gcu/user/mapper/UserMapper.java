package com.gcu.user.mapper;

import com.gcu.user.bean.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    int deleteByPrimaryKey(Integer ucode);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    User selectByPrimaryKey(Integer ucode);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_table
     *
     * @mbggenerated Fri Sep 09 20:33:20 CST 2022
     */
    int updateByPrimaryKey(User record);

    User selectUserByActAndPwd(Map<String, Object> map);

    List<User> getAllByPeople();

    User getUserByCode(Integer code);
}