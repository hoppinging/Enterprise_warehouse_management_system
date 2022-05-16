package com.hoppi.controller;

import com.hoppi.pojo.Cargo;
import com.hoppi.pojo.Material;
import com.hoppi.pojo.StandingBook;
import com.hoppi.service.CargoService;
import com.hoppi.service.MaterialService;
import com.hoppi.service.StandingBookService;
import com.hoppi.util.ExportExcelUtil;
import com.hoppi.util.String2Timestamp;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 创建日期：2022-03-22 11:09
 * 出入库及查询台账操作页面
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Controller
@SessionAttributes(names = {"input_success", "output_success", "cargoList", "materialList", "standingBookList", "deleteLog"})
public class WarehouseController {
    @Autowired
    CargoService cargoService;
    @Autowired
    MaterialService materialService;
    @Autowired
    StandingBookService standingBookService;
    //入库
    @RequestMapping("/input")
    public String input(Model model,
                        @RequestParam String art_no,
                        @RequestParam String name,
                        @RequestParam String depo_no,
                        @RequestParam String amount,
                        @RequestParam String unit_price,
                        @RequestParam String target,
                        @RequestParam String direction
                        ) {
        BigDecimal unit_price_temp = new BigDecimal(unit_price);
        Cargo cargo = new Cargo(Integer.parseInt(art_no), depo_no, name, Integer.parseInt(amount), unit_price_temp);
        StandingBook standingBook = new StandingBook(depo_no, Integer.parseInt(art_no), true, Integer.parseInt(amount), unit_price_temp, unit_price_temp.multiply(BigDecimal.valueOf(Long.parseLong(amount))), target);
        if (direction.equals("1")){
            //进货
            cargoService.insertAndUpdate(cargo);
            materialService.insertAndUpdate(cargo);
        } else {
            //退货
            cargo.setAmount(-cargo.getAmount());
            standingBook.setAmount(-standingBook.getAmount());
            cargoService.update(cargo);
            cargoService.deleteAllZero();
            materialService.update(cargo);
        }
        standingBookService.insert(standingBook);
        model.addAttribute("input_success", true);
        return "working";
    }
    //出库
    @RequestMapping("/output")
    public String output(Model model,
                        @RequestParam String art_no,
                        @RequestParam String name,
                        @RequestParam String depo_no,
                        @RequestParam String amount,
                        @RequestParam String unit_price,
                        @RequestParam String target,
                        @RequestParam String direction
    ) {
        BigDecimal unit_price_temp = new BigDecimal(unit_price);
        Cargo cargo = new Cargo(Integer.parseInt(art_no), depo_no, name, Integer.parseInt(amount), unit_price_temp);
        StandingBook standingBook = new StandingBook(depo_no, Integer.parseInt(art_no), false, Integer.parseInt(amount), unit_price_temp, unit_price_temp.multiply(BigDecimal.valueOf(Long.parseLong(amount))), target);
        if (direction.equals("1")){
            //领料
            cargoService.update(cargo);
            cargoService.deleteAllZero();
            materialService.update(cargo);
        } else {
            //退料
            cargoService.insertAndUpdate(cargo);
            materialService.update(cargo);
        }
        standingBookService.insert(standingBook);
        model.addAttribute("output_success", true);
        return "working";
    }
    //查看货物表
    @RequestMapping("/listCargo")
    public String listCargo(Model model) {
        List<Cargo> cargoList = cargoService.select();
        model.addAttribute("cargoList", cargoList);
        return "working";
    }
    //查看单个仓库货物表
    @RequestMapping("/listDepo")
    public String listDepo(Model model, @Param("depo_no") String depo_no) {
        List<Cargo> cargoList = cargoService.selectDepo(depo_no);
        model.addAttribute("cargoList", cargoList);
        return "working";
    }
    //查看物料表
    @RequestMapping("/listMaterial")
    public String listMaterial(Model model) {
        List<Material> materialList = materialService.selectAll();
        model.addAttribute("materialList", materialList);
        return "working";
    }
    //跳转到台账页
    @RequestMapping("/toLogList")
    public String toLogList(Model model) {
        if (!model.containsAttribute("standingBookList")){
            List<StandingBook> standingBookList = standingBookService.select();
            model.addAttribute("standingBookList", standingBookList);
        }
        return "logList";
    }
    //查询某时间段某仓库的所有台账
    @RequestMapping("/selectLog")
    public String selectLog(Model model, @Param("from") String from, @Param("to") String to, @Param("depo_no") String depo_no) {
        if (Objects.equals(from, "") && Objects.equals(to, "") && Objects.equals(depo_no, "")) {
            model.addAttribute("standingBookList", standingBookService.select());
            return "redirect:/toLogList";
        }
        Timestamp fromTimeStamp = String2Timestamp.transform(from);
        if (fromTimeStamp == null) {
            fromTimeStamp = new Timestamp(0);
        }
        Timestamp toTimeStamp = String2Timestamp.transform(to);
        if (toTimeStamp == null) {
            toTimeStamp = new Timestamp(System.currentTimeMillis());
        }
        List<StandingBook> standingBookList = standingBookService.select(fromTimeStamp, toTimeStamp, depo_no);
        model.addAttribute("standingBookList", standingBookList);
        return "redirect:/toLogList";
    }
    //删除某时间段某仓库的所有台账
    @RequestMapping("/deleteLog")
    public String deleteLog(Model model, @Param("from") String from, @Param("to") String to, @Param("depo_no") String depo_no) {
        System.out.println(from);
        if (Objects.equals(from, "") && Objects.equals(to, "") && Objects.equals(depo_no, "")) {
            model.addAttribute("deleteLog", standingBookService.delete());
            return "redirect:/toLogList";
        }
        Timestamp fromTimeStamp = String2Timestamp.transform(from);
        if (fromTimeStamp == null) {
            fromTimeStamp = new Timestamp(0);
        }
        Timestamp toTimeStamp = String2Timestamp.transform(to);
        if (toTimeStamp == null) {
            toTimeStamp = new Timestamp(System.currentTimeMillis());
        }
        int deleteLog = standingBookService.delete(fromTimeStamp, toTimeStamp, depo_no);
        model.addAttribute("deleteLog", deleteLog);
        return "redirect:/toLogList";
    }
    //下载当前页面台账
    @RequestMapping("/export")
    public String export(Model model, HttpServletResponse response) throws Exception {
        response.reset();
        response.setCharacterEncoding("UTF-8");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd-HH_mm_ss");
        List<StandingBook> standingBookList = (List<StandingBook>) model.getAttribute("standingBookList");
        String[] headList = {"时间", "仓库编号", "货号", "出/入库", "数量", "单价", "总价", "来源/去向"};
        if (standingBookList != null) {
            OutputStream out;
            try {
                //获取输出流
                out=response.getOutputStream();
                response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(dateFormat.format(new Date(System.currentTimeMillis())) + ".xlsx", "UTF-8"));
                ExportExcelUtil.createExcel(out, headList, standingBookList);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/toLogList";
    }
}
