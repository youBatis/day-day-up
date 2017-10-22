package com.hp.up.backend.controller.socket;

import com.google.gson.GsonBuilder;
import com.hp.up.backend.controller.BaseController;
import com.hp.up.core.Entity.Message;
import com.hp.up.core.Entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * com.hp.up.backend.controller.socket
 * @author haopeng
 * @date 2017/10/21  21:36
 */
@Controller
@RequestMapping("/socket")
public class TalkController extends BaseController{

    @Resource
    MyWebSocketHandler handler;

    Map<Long, User> users = new HashMap<>();

    // 模拟一些数据
    @ModelAttribute
    public void setReqAndRes() {
        User u1 = new User();
        u1.setId(1L);
        u1.setName("张三");
        users.put(u1.getId(), u1);

        User u2 = new User();
        u2.setId(2L);
        u2.setName("李四");
        users.put(u2.getId(), u2);

    }

    @RequestMapping
    public  String index(){
        return "socket/login";
    }
    // 用户登录
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView doLogin(User user, HttpServletRequest request) {
        request.getSession().setAttribute("uid", user.getId());
        request.getSession().setAttribute("name", users.get(user.getId()).getName());
        return new ModelAndView("redirect:/socket/talk");
    }

    // 跳转到交谈聊天页面
    @RequestMapping(value = "talk", method = RequestMethod.GET)
    public ModelAndView talk() {
        return new ModelAndView("socket/talk");
    }

    // 跳转到发布广播页面
    @RequestMapping(value = "broadcast", method = RequestMethod.GET)
    public ModelAndView broadcast() {
        return new ModelAndView("socket/broadcast");
    }

    // 发布系统广播（群发）
    @ResponseBody
    @RequestMapping(value = "broadcast", method = RequestMethod.POST)
    public void broadcast(String text) throws IOException {
        Message msg = new Message();
        msg.setDate(new Date());
        msg.setFrom(-1L);
        msg.setFromName("系统广播");
        msg.setTo(2L);
        msg.setText(text);
        handler.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
        //handler.sendMessageToUser(2L,new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
    }

}



