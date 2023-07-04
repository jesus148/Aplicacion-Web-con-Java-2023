package controlador;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import entity.LibroExcel;

@WebServlet("/generaLibroPDF")
public class LibroPDFServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CrudLibroServlet.class.getName());

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info(">> LibroPDFServlet >> service");
        String[] columnText = { "Id Libro", "Título", "Año", "Serie", "Fecha Registro", "Estado", "Categoría" };
        int numColumns = columnText.length;

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

        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            Document document = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter.getInstance(document, baos);
            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLACK);
            Font subtitleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
            Font tableHeaderFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10, BaseColor.WHITE);
            Font tableCellFont = FontFactory.getFont(FontFactory.HELVETICA, 10, BaseColor.BLACK);

            // Title
            Paragraph title = new Paragraph("Reporte de Libros", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Subtitle
            document.add(new Paragraph("Total de libros", subtitleFont));

            // Add information of the consulta
            document.add(new Paragraph("Título: " + (titulo.equals("") ? "No definido" : titulo)));
            document.add(new Paragraph("Año: " + (anio.equals("") ? "No definido" : anio)));
            document.add(new Paragraph("Serie: " + (serie.equals("") ? "No definido" : serie)));
            document.add(new Paragraph("Estado: " + (estado.equals("1") ? "Activo" : "Inactivo")));
            document.add(new Paragraph("Categoría: " + (categoria.equals("[Seleccione]") ? "No definido" : categoria)));
            
            document.add(new Paragraph("\n")); // Add spacing after the information

            // Table
            PdfPTable table = new PdfPTable(numColumns);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            // Set table headers
            for (String columnHeader : columnText) {
                PdfPCell headerCell = new PdfPCell();
                headerCell.setBackgroundColor(new BaseColor(0, 0, 128));
                headerCell.setPadding(5);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                headerCell.setPhrase(new Phrase(columnHeader, tableHeaderFont));
                table.addCell(headerCell);
            }

            // Fill table rows with data
            for (LibroExcel libro : listaLibros) {
                table.addCell(createCell(String.valueOf(libro.getIdLibro()), tableCellFont));
                table.addCell(createCell(libro.getTitulo(), tableCellFont));
                table.addCell(createCell(String.valueOf(libro.getAnio()), tableCellFont));
                table.addCell(createCell(libro.getSerie(), tableCellFont));
                table.addCell(createCell(libro.getFechaRegistro(), tableCellFont));
                table.addCell(createCell(libro.getEstado().equals("1") ? "Activo" : "Inactivo", tableCellFont));
                table.addCell(createCell(libro.getCategoria().getDescripcion(), tableCellFont));
            }

            document.add(table);
            document.close();

            response.setContentType("application/pdf");
            response.setHeader("Content-disposition", "attachment; filename=Reporte_Libros.pdf");
            response.setHeader("Set-Cookie", "fileDownload=true; path=/");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            OutputStream out = response.getOutputStream();
            baos.writeTo(out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Se produjo un error al generar el archivo PDF.");
        }
    }

    private PdfPCell createCell(String value, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(value, font));
        cell.setPadding(5);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        return cell;
    }
}
