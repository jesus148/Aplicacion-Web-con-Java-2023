package controlador;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import entity.LibroExcel;

@WebServlet("/generaLibroExcel")
public class LibroExcelServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CrudLibroServlet.class.getName());

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info(">> ExcelLibro>> service");
        String[] columnText_sheet_1 = { "Id Libro", "Título", "Año", "Serie", "Fecha Registro", "Estado", "Categoría" };
        int[] columnWith_sheet_1 = { 4000, 7000, 4000, 6000, 6500, 4000, 4000 };

        InputStream inputStream = null;
        
        //ObjectMapper objectMapper = new ObjectMapper();
        //String requestData = request.getReader().lines().collect(Collectors.joining());
        
        
        String titulo = request.getParameter("titulo");
        String anio = request.getParameter("anio");
        String serie = request.getParameter("serie");
        String estado = request.getParameter("estado");
        String categoria = request.getParameter("categoria");
        
        
        
        log.info(request.getParameter("titulo"));
        String tablaG = request.getParameter("tabla");
        log.info(tablaG);
        Gson gson = new Gson();
        Type listType = new TypeToken<List<LibroExcel>>(){}.getType();
        List<LibroExcel> listaLibros = gson.fromJson(tablaG, listType);
        
        // Obtener los datos de la tabla
        try {
            /*List<LibroExcel> tabla = objectMapper.readValues(RequestData.getTabla(),
                    new TypeReference<List<LibroExcel>>() {
                    });*/
            SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss");
            Date d = new Date();

            String fileName = "Reporte_Libros_" + sdf.format(d) + ".xlsx";

            String titulo_1 = "Reporte de Libros ";
            String titulo_Sheet_1 = "Total de libros";
            try (XSSFWorkbook excel = new XSSFWorkbook()) {
                XSSFFont fuente = excel.createFont();
                fuente.setFontHeightInPoints((short) 10);
                fuente.setFontName("Arial");
                fuente.setBold(true);
                fuente.setColor(IndexedColors.WHITE.getIndex());

                XSSFCellStyle estiloPorcentaje = excel.createCellStyle();
                estiloPorcentaje.setDataFormat(excel.createDataFormat().getFormat("0%"));
                XSSFCellStyle estiloCeldaIzquierda = excel.createCellStyle();
                estiloCeldaIzquierda.setWrapText(true);
                estiloCeldaIzquierda.setAlignment(HorizontalAlignment.LEFT);
                estiloCeldaIzquierda.setVerticalAlignment(VerticalAlignment.CENTER);
                estiloCeldaIzquierda.setFont(fuente);
                estiloCeldaIzquierda.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
                estiloCeldaIzquierda.setFillPattern(FillPatternType.SOLID_FOREGROUND);

                XSSFCellStyle estiloCeldaCentrado = excel.createCellStyle();
                estiloCeldaCentrado.setWrapText(true);
                estiloCeldaCentrado.setAlignment(HorizontalAlignment.CENTER);
                estiloCeldaCentrado.setVerticalAlignment(VerticalAlignment.CENTER);
                estiloCeldaCentrado.setFont(fuente);
                estiloCeldaCentrado.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
                estiloCeldaCentrado.setFillPattern(FillPatternType.SOLID_FOREGROUND);

                //Información de consulta:
                XSSFFont fuenteConsulta = excel.createFont();
                fuenteConsulta.setFontHeightInPoints((short) 10);
                fuenteConsulta.setFontName("Arial");
                fuenteConsulta.setBold(true);
                fuenteConsulta.setColor(IndexedColors.BLACK.getIndex());
                
                XSSFCellStyle estiloCeldaCentradoSinRellenoNegrita = excel.createCellStyle();
                estiloCeldaCentradoSinRellenoNegrita.setWrapText(true);
                estiloCeldaCentradoSinRellenoNegrita.setAlignment(HorizontalAlignment.CENTER);
                estiloCeldaCentradoSinRellenoNegrita.setVerticalAlignment(VerticalAlignment.CENTER);
                estiloCeldaCentradoSinRellenoNegrita.setFont(fuenteConsulta);
                
                //estiloCeldaCentradoSinRellenoNegrita.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                {
                    // SHEET 1
                    XSSFSheet hoja = excel.createSheet(titulo_Sheet_1);
                    hoja.addMergedRegion(new CellRangeAddress(0, 0, 0, columnWith_sheet_1.length - 1));

                    for (int i = 0; i < columnWith_sheet_1.length; i++) {
                        hoja.setColumnWidth(i, columnWith_sheet_1[i]);
                    }

                    // FILA 0: Se crea las cabecera
                    XSSFRow fila1 = hoja.createRow(0);
                    XSSFCell celAuxs = fila1.createCell(0);
                    celAuxs.setCellStyle(estiloCeldaIzquierda);
                    celAuxs.setCellValue(titulo_1);

                    // FILA 2: Se crea la fila en blanco
                    XSSFRow fila2 = hoja.createRow(1);
                    XSSFCell celAuxs2 = fila2.createCell(0);
                    celAuxs2.setCellValue("");

                    // Añadir información de la consulta en celdas adicionales
                    XSSFRow titleRow = hoja.createRow(2);
                    titleRow.createCell(0).setCellValue("Título:");
                    titleRow.createCell(1).setCellValue(titulo.equals("") ? "No definido" : titulo);
                    titleRow.getCell(0).setCellStyle(estiloCeldaIzquierda);
                    titleRow.getCell(1).setCellStyle(estiloCeldaCentradoSinRellenoNegrita);

                    XSSFRow yearRow = hoja.createRow(3);
                    yearRow.createCell(0).setCellValue("Año:");
                    yearRow.createCell(1).setCellValue(anio.equals("") ? "No definido" : anio);
                    yearRow.getCell(0).setCellStyle(estiloCeldaIzquierda);
                    yearRow.getCell(1).setCellStyle(estiloCeldaCentradoSinRellenoNegrita);

                    XSSFRow seriesRow = hoja.createRow(4);
                    seriesRow.createCell(0).setCellValue("Serie:");
                    seriesRow.createCell(1).setCellValue(serie.equals("") ? "No definido" : serie);
                    seriesRow.getCell(0).setCellStyle(estiloCeldaIzquierda);
                    seriesRow.getCell(1).setCellStyle(estiloCeldaCentradoSinRellenoNegrita);

                    XSSFRow statusRow = hoja.createRow(5);
                    statusRow.createCell(0).setCellValue("Estado:");
                    statusRow.createCell(1).setCellValue(estado.equals("1") ? "Activo" : "Inactivo");
                    statusRow.getCell(0).setCellStyle(estiloCeldaIzquierda);
                    statusRow.getCell(1).setCellStyle(estiloCeldaCentradoSinRellenoNegrita);

                    XSSFRow categoryRow = hoja.createRow(6);
                    categoryRow.createCell(0).setCellValue("Categoría:");
                    categoryRow.createCell(1).setCellValue(categoria.equals("[Seleccione]") ? "No definido" : categoria);
                    categoryRow.getCell(0).setCellStyle(estiloCeldaIzquierda);
                    categoryRow.getCell(1).setCellStyle(estiloCeldaCentradoSinRellenoNegrita);
  
                    
                    
                    
                    // FILA 2: Se crea la fila en blanco
                    XSSFRow fila8 = hoja.createRow(7);
                    XSSFCell celAuxs8 = fila8.createCell(0);
                    celAuxs8.setCellValue("");
                    
                    
                    // FILA 2: Se crea las columnas
                    XSSFRow fila3 = hoja.createRow(8);

                    for (int i = 0; i < columnText_sheet_1.length; i++) {
                        XSSFCell celda1 = fila3.createCell(i);
                        celda1.setCellStyle(estiloCeldaCentrado);
                        celda1.setCellValue(columnText_sheet_1[i]);
                    }

                    // FILA 3...n: Se crea las filas
                    XSSFCellStyle celdaCentrar = excel.createCellStyle();
                    celdaCentrar.setAlignment(HorizontalAlignment.CENTER);
                    celdaCentrar.setVerticalAlignment(VerticalAlignment.CENTER);

                    XSSFRow filaX = null;
                    for (int i = 0; i < listaLibros.size(); i++) {
                        LibroExcel libro = listaLibros.get(i); // Obtener el objeto LibroExcel en la posición i

                        filaX = hoja.createRow(i +9); // Crear una nueva fila en la hoja de cálculo

                        // Llenar las celdas con los valores del objeto LibroExcel
                        filaX.createCell(0).setCellValue(libro.getIdLibro());
                        filaX.createCell(1).setCellValue(libro.getTitulo());
                        filaX.createCell(2).setCellValue(libro.getAnio());
                        filaX.createCell(3).setCellValue(libro.getSerie());
                        filaX.createCell(4).setCellValue(libro.getFechaRegistro());
                        filaX.createCell(5).setCellValue(libro.getEstado().equals("1") ? "Activo" : "Inactivo");
                        filaX.createCell(6).setCellValue(libro.getCategoria().getDescripcion());
                    }

                }
                ByteArrayOutputStream boas = new ByteArrayOutputStream();
                excel.write(boas);

                inputStream = new ByteArrayInputStream(boas.toByteArray());

            }

            int fileSize = inputStream.available();

            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            response.setHeader("Set-Cookie", "fileDownload=true; path=/");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("contentLength", String.valueOf(fileSize));

            byte[] buffer = new byte[1048];

            OutputStream out = response.getOutputStream();

            int numBytesRead;
            while ((numBytesRead = inputStream.read(buffer)) > 0) {
                out.write(buffer, 0, numBytesRead);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Se produjo un error al generar el archivo Excel.");
        } finally {
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (IOException e) {
                log.info("Error al cerrar el inputStream: " + e.getMessage());
            }
        }
    }

    
}
