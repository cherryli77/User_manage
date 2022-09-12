package com.gcu.user.controller;
import com.gcu.user.bean.User;
import com.gcu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping ("/index.do")
    public String toLogin(){
        return "login";
    }
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String doLogin(String loginAct, String loginPwd, HttpServletRequest request, HttpSession session){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("loginAct",loginAct);
        map.put("loginPwd",loginPwd);
        User user = userService.queryUserByActAndPwd(map);
        if (user!=null){
            System.out.println(user);
            session.setAttribute("sessionUser",user);
            return "forward:/getAllUser.do";
        }else {
            return "redirect:/index.do";
        }
    }
    @RequestMapping(value = "/getAllUser.do")
    public String getAllUserByPeople(HttpServletRequest request){
        List<User> list = userService.getAllUser();
        request.setAttribute("userList",list);
        System.out.println(list.iterator());
        return "login_action";
    }
    @RequestMapping(value = "/getUserByCode.do/{code}")
    public String getUserByCode(@PathVariable Integer code,HttpServletRequest request){
        System.out.println(code);
        User user = userService.getUserByCode(code);
        request.setAttribute("user",user);
        System.out.println(user);
        return "detail";
    }
    @RequestMapping(value = "/deleteUserByCode.do/{code}",method = RequestMethod.POST)
    @ResponseBody
    public String deleteUserByCode(@PathVariable Integer code){
        int i = userService.removeUserByCode(code);
        if(i>0){
            System.out.println("删除成功");
            return "1";
        }else {
            return "0";
        }
    }
    @RequestMapping(value = "/addUser.do")
    public String addUser(){
        return "addUser";
    }
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public @ResponseBody Object add(User user){
        System.out.println(user.toString());
        if (userService.addUser(user)==1){
            return "1";
        }else {
            return "0";
        }
    }
    //编辑页面
    @RequestMapping(value = "/update/{code}")
    public String updateUser(@PathVariable Integer code,HttpServletRequest request){
        User user = userService.getUserByCode(code);
        request.setAttribute("user",user);
        return "update";
    }
    //更新
    @RequestMapping(value = "/user/update.do",method = RequestMethod.POST)
    public @ResponseBody Object update(User user){
        int i = userService.updateUser(user);
        if (i>0){
            return "1";
        }else {
            return "0";
        }
    }
}
