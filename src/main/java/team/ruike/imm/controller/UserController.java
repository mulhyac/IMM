package team.ruike.imm.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.dao.ProcurementInformationDao;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.ProcurementService;
import team.ruike.imm.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@RequestMapping(value = "/user")
@Controller
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    ProcurementInformationService procurementInformationService;
    @Autowired
    ProcurementService procurementService;
    /**
     * 登录验证
     * @param user
     * @param session
     * @return
     */
    @RequestMapping(value="/login.do")
    public  String login(Model model,User user, HttpSession session, HttpServletRequest request){
            User u=userService.selectUser(user);
            int procurementSize=procurementService.procurementSize().size();
            if (u.getUserName()!="无"){
              int stock=  merchandiseService.sumstock();
              List<Merchandise> merchandiseList=merchandiseService.insufficientMerchandise(null);
              List<ProcurementInformation> procurlist=procurementInformationService.rankingProcurement();
              session.setAttribute("user",u);
              model.addAttribute("procurlist",procurlist);
              model.addAttribute("procurementSize",procurementSize);
                //获得小于商品安全存量的商品数量
                request.setAttribute("stock",stock);
                if (merchandiseList.size()>0) {
                   merchandiseService.insufficient(merchandiseList);
                }
                return "index";
            }
            session.setAttribute("hint","请输入正确的用户名和密码");
        return "login";
    }

    /**
     * 退出到登录页面
     * @return
     */
    @RequestMapping(value = "/retreat.do")
    public String retreat(HttpSession session){
        session.removeAttribute("user");
        return "login";
    }

    /**
     * 批量添加
     * @return
     */
    @RequestMapping("/doinsetadt.do")
    public void Doaddatdrecore(String stuattendancelists,PrintWriter printWriter){
        ArrayList<User> userArrayList =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<User>>(){});
        for (User user : userArrayList) {
            System.out.println(user.getUserName());
            System.out.println(user.getUserPassword());
        }
      int i= userService.insertAdd(userArrayList);
        if(i>0){
            //返回值
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }



}
