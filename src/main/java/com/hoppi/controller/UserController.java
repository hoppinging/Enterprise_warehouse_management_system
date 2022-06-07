package com.hoppi.controller;

import com.hoppi.pojo.Cargo;
import com.hoppi.pojo.Material;
import com.hoppi.pojo.User;
import com.hoppi.service.CargoService;
import com.hoppi.service.MaterialService;
import com.hoppi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * <p>
 * 创建日期：2022-03-22 11:08
 * 用于用户登录页面
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Controller
@SessionAttributes(names = {"user", "cargoList", "materialList", "userList", "userVariable", "update", "delete"})
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    CargoService cargoService;
    @Autowired
    MaterialService materialService;
    @RequestMapping("/login")
    public String login(Model model, int id, String password){
        String pwd = userService.getPwd(id);
        if (password.equals(pwd)) {
            if (userService.getInfo(id).isRbac()) {
                List<Cargo> cargoList = cargoService.select();
                List<Material> materialList = materialService.selectAll();
                model.addAttribute("cargoList", cargoList);
                model.addAttribute("materialList", materialList);
            }
            model.addAttribute("user", userService.getInfo(id));
            return "working";
        }
        return "backToIndex";
    }
    @RequestMapping("/working")
    public String gotoWorking(){
        return "working";
    }
    @RequestMapping("/account")
    public String gotoAccount(){
        return "account";
    }
    //跳转到员工页
    @RequestMapping("/toStaffList")
    public String toLogList(Model model) {
        List<User> userList = userService.select();
        model.addAttribute("userList", userList);
        return "staffList";
    }
    //跳转到添加员工页
    @RequestMapping("/toAddStaff")
    public String toAddStaff() {
        return "staffAdd";
    }
    //添加员工
    @RequestMapping("/addStaff")
    public String addStaff(Model model,
                           @RequestParam String name,
                           @RequestParam String rbac,
                           @RequestParam String pwd) {
        userService.insert(new User(name, Boolean.parseBoolean(rbac), pwd));
        List<User> userList = userService.select();
        model.addAttribute("userList", userList);
        return "redirect:/toStaffList";
    }
    //跳转到修改员工页
    @RequestMapping("/toUpdateStaff/{id}")
    public String toUpdateStaff(Model model, @PathVariable int id) {
        User userVariable = userService.getInfo(id);
        model.addAttribute("userVariable", userVariable);
        return "staffUpdate";
    }
    //修改员工
    @RequestMapping("/updateStaff")
    public String updateStaff(Model model,
                              @RequestParam String id,
                              @RequestParam String name,
                              @RequestParam String rbac,
                              @RequestParam String pwd) {
        //成功则返回1 失败返回0
        int update = userService.update(Integer.parseInt(id), new User(name, Boolean.parseBoolean(rbac), pwd));
        model.addAttribute("update", update);
        User userVariable = userService.getInfo(Integer.parseInt(id));
        model.addAttribute("userVariable", userVariable);
        User user = (User) model.getAttribute("user");
        assert user != null;
        if (userVariable.getId() == user.getId()) {
            model.addAttribute("user", userVariable);
        }
        return "staffUpdate";
    }
    //删除员工
    @RequestMapping("/deleteStaff/{id}")
    public String deleteStaff(Model model, @PathVariable int id) {
        //成功则返回1 失败返回0
        int delete = userService.delete(id);
        model.addAttribute("delete", delete);
        return "redirect:/toStaffList";
    }
}
