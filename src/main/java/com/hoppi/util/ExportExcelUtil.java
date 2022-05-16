package com.hoppi.util;

import com.hoppi.pojo.StandingBook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.OutputStream;
import java.util.List;

/**
 * <p>
 * 创建日期：2022-05-16 15:40
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
public class ExportExcelUtil {
    public static void createExcel(OutputStream out, String[] headList, List<StandingBook> dataList) throws Exception {
        // 创建新的Excel 工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 在Excel工作簿中建一工作表，其名为缺省值
        XSSFSheet sheet = workbook.createSheet();
        // 在索引0的位置创建行（最顶端的行）
        XSSFRow row = sheet.createRow(0);
        // 设置excel头（第一行）的头名称
        for (int i = 0; i < headList.length; i++) {
            // 在索引0的位置创建单元格（左上端）
            XSSFCell cell = row.createCell(i);
            // 定义单元格为字符串类型
            cell.setCellType(CellType.STRING);
            // 在单元格中输入一些内容
            cell.setCellValue(headList[i]);
        }
        //添加数据
        for (int n = 0; n < dataList.size(); n++) {
            // 在索引1的位置创建行（最顶端的行）
            XSSFRow row_value = sheet.createRow(n + 1);
            StandingBook standingBook = dataList.get(n);
            XSSFCell[] cells = new XSSFCell[8];
            for (int i = 0; i < 8; i++) {
                // 在索引0的位置创建单元格（左上端）
                cells[i] = row_value.createCell(i);
                // 定义单元格为字符串类型
                cells[i].setCellType(CellType.STRING);
            }
            cells[0].setCellValue(standingBook.getTime_stamp().toString());
            cells[1].setCellValue(standingBook.getDepo_no());
            cells[2].setCellValue(standingBook.getArt_no());
            cells[3].setCellValue(standingBook.isState()?"入库":"出库");
            cells[4].setCellValue(standingBook.getAmount());
            cells[5].setCellValue(standingBook.getUnit_price().stripTrailingZeros().toPlainString());
            cells[6].setCellValue(standingBook.getTotal().stripTrailingZeros().toPlainString());
            cells[7].setCellValue(standingBook.getTarget());
        }
        // 把相应的Excel工作簿存盘
        workbook.write(out);
        out.flush();
        // 操作结束，关闭文件
        out.close();
    }
}
