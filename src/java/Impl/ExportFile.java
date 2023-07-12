/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Impl;

import Dal.ManagerDAO;
import Model.Products;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.BuiltinFormats;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author laptop
 */
public class ExportFile {

    public static void main(String[] args) throws IOException {
        ManagerDAO dao = new ManagerDAO();

        final ArrayList<Products> product = dao.getProduct();
        final String excelFilePath = "C:/demo/books.xlsx";
        writeExcel(product, excelFilePath);
    }

    public static void writeExcel(ArrayList<Products> product, String excelFilePath) throws IOException {
        ManagerDAO dao = new ManagerDAO();
        dao.getAllProduct();
        Workbook workbook = new XSSFWorkbook();

        // Create sheet
        Sheet sheet = workbook.createSheet("Sheet1"); // Create sheet with sheet name

        int rowIndex = 0;
        String[] headers = {"ID", "Tên sản phẩm", "Giá", "Số lượng"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }
        int rowNum = 1;
        for (Products p : product) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(p.getProductID());
            row.createCell(1).setCellValue(p.getName());
            row.createCell(2).setCellValue(p.getPrice());
            row.createCell(3).setCellValue(p.getQuantity());
        }

        // Ghi workbook vào tệp Excel
        try ( FileOutputStream outputStream = new FileOutputStream("product_list.xlsx")) {
            workbook.write(outputStream);
            System.out.println("File Excel đã được xuất thành công!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static Workbook getWorkbook(String excelFilePath) throws IOException {
        Workbook workbook = null;

        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook();
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook();
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

}

// Write header with format
//private static void writeHeader(Sheet sheet, int rowIndex) {
//        CellStyle cellStyle = createStyleForHeader(sheet);
//
//        // Create row
//        Row row = sheet.createRow(rowIndex);
//
//        // Create cells
//        Cell cell = row.createCell(COLUMN_INDEX_ID);
//        cell.setCellStyle(cellStyle);
//        cell.setCellValue("Id");
//
//        cell = row.createCell(COLUMN_INDEX_TITLE);
//        cell.setCellStyle(cellStyle);
//        cell.setCellValue("Title");
//
//        cell = row.createCell(COLUMN_INDEX_PRICE);
//        cell.setCellStyle(cellStyle);
//        cell.setCellValue("Price");
//
//        cell = row.createCell(COLUMN_INDEX_QUANTITY);
//        cell.setCellStyle(cellStyle);
//        cell.setCellValue("Quantity");
//
//        cell = row.createCell(COLUMN_INDEX_TOTAL);
//        cell.setCellStyle(cellStyle);
//        cell.setCellValue("Total money");
//    }
//
//    // Write data
//    private static void writeBook(Products product, Row row) {
//        if (cellStyleFormatNumber == null) {
//            // Format number
//            short format = (short) BuiltinFormats.getBuiltinFormat("#,##0");
//            // DataFormat df = workbook.createDataFormat();
//            // short format = df.getFormat("#,##0");
//
//            //Create CellStyle
//            Workbook workbook = row.getSheet().getWorkbook();
//            cellStyleFormatNumber = workbook.createCellStyle();
//            cellStyleFormatNumber.setDataFormat(format);
//        }
//
//        Cell cell = row.createCell(COLUMN_INDEX_ID);
//        cell.setCellValue(product.getProductID());
//
//        cell = row.createCell(COLUMN_INDEX_TITLE);
//        cell.setCellValue(product.getName());
//
//        cell = row.createCell(COLUMN_INDEX_PRICE);
//        cell.setCellValue(product.getPrice());
//        cell.setCellStyle(cellStyleFormatNumber);
//
//        cell = row.createCell(COLUMN_INDEX_QUANTITY);
//        cell.setCellValue(product.getQuantity());
//
//        // Create cell formula
//        // totalMoney = price * quantity
//        cell = row.createCell(COLUMN_INDEX_TOTAL, CellType.FORMULA);
//        cell.setCellStyle(cellStyleFormatNumber);
//        int currentRow = row.getRowNum() + 1;
//        String columnPrice = CellReference.convertNumToColString(COLUMN_INDEX_PRICE);
//        String columnQuantity = CellReference.convertNumToColString(COLUMN_INDEX_QUANTITY);
//        cell.setCellFormula(columnPrice + currentRow + "*" + columnQuantity + currentRow);
//    }
//
//    private static CellStyle createStyleForHeader(Sheet sheet) {
//        Font font = sheet.getWorkbook().createFont();
//        font.setFontName("Times New Roman");
//        font.setBold(true);
//        font.setFontHeightInPoints((short) 14); // font size
//        font.setColor(IndexedColors.WHITE.getIndex()); // text color
//
//        // Create CellStyle
//        CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
//        cellStyle.setFont(font);
//        cellStyle.setFillForegroundColor(IndexedColors.BLUE.getIndex());
//        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//        cellStyle.setBorderBottom(BorderStyle.THIN);
//        return cellStyle;
//    }
//
//    // Write footer
//    private static void writeFooter(Sheet sheet, int rowIndex) {
//        // Create row
//        Row row = sheet.createRow(rowIndex);
//        Cell cell = row.createCell(COLUMN_INDEX_TOTAL, CellType.FORMULA);
//        cell.setCellFormula("SUM(E2:E6)");
//    }
//
//    // Auto resize column width
//    private static void autosizeColumn(Sheet sheet, int lastColumn) {
//        for (int columnIndex = 0; columnIndex < lastColumn; columnIndex++) {
//            sheet.autoSizeColumn(columnIndex);
//        }
//    }
//
//    // Create output file
//    private static void createOutputFile(Workbook workbook, String excelFilePath) throws IOException {
//        try ( OutputStream os = new FileOutputStream(excelFilePath)) {
//            workbook.write(os);
//        }
//    }
//}
