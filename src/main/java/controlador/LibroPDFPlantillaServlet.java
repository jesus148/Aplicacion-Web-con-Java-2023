package controlador;
import java.awt.Color;
import java.io.ByteArrayInputStream;
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

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentCatalog;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm;
import org.apache.pdfbox.pdmodel.interactive.form.PDField;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import entity.LibroExcel;

@WebServlet("/generaLibroPDFPlantilla")
public class LibroPDFPlantillaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CrudLibroServlet.class.getName());

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info(">> LibroPDFServlet >> service");
        String[] columnText = { "Id Libro", "Título", "Año", "Serie", "Fecha Registro", "Estado", "Categoría" };
        //int numColumns = columnText.length;

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

        try (PDDocument document = PDDocument.load(getClass().getResourceAsStream("./plantilla.pdf"))) {

            // Obtén el formulario interactivo de la plantilla PDF
            PDDocumentCatalog catalog = document.getDocumentCatalog();
            PDAcroForm acroForm = catalog.getAcroForm();

            // Rellena los campos de formulario en base a los parámetros recibidos
            fillFormField(acroForm, "titulo", titulo.equals("") ? "No definido" : titulo);
            fillFormField(acroForm, "anio", anio.equals("") ? "No definido" : anio);
            fillFormField(acroForm, "serie", serie.equals("") ? "No definido" : serie);
            fillFormField(acroForm, "estado", estado.equals("1") ? "Activo" : "Inactivo");
            fillFormField(acroForm, "categoria", categoria.equals("[Seleccione]") ? "No definido" : categoria);

            // Guarda el documento PDF con los campos llenos
            ByteArrayOutputStream filledDocumentStream = new ByteArrayOutputStream();
            document.save(filledDocumentStream);
            document.close();

            // Genera el documento PDF final con la tabla agregada
            PDDocument filledDocument = PDDocument.load(new ByteArrayInputStream(filledDocumentStream.toByteArray()));

            ByteArrayOutputStream finalDocumentStream = new ByteArrayOutputStream();
            addTableToDocument(filledDocument, finalDocumentStream, columnText, listaLibros);

            // Envía el documento PDF al cliente
            response.setContentType("application/pdf");
            response.setHeader("Content-disposition", "attachment; filename=Reporte_Libros.pdf");
            response.setHeader("Set-Cookie", "fileDownload=true; path=/");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            OutputStream out = response.getOutputStream();
            finalDocumentStream.writeTo(out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Se produjo un error al generar el archivo PDF.");
        }
    }

    private void fillFormField(PDAcroForm acroForm, String fieldName, String value) throws IOException {
        PDField field = acroForm.getField(fieldName);
        if (field != null) {
            field.setValue(value);
        }
    }
    
    private void addTableToDocument(PDDocument document, OutputStream outputStream, String[] columnText,
            List<LibroExcel> listaLibros) throws IOException {
        // Obtener la primera página del documento
        PDPage firstPage = document.getPage(0);
        PDRectangle mediaBox = firstPage.getMediaBox();
        float pageWidth = mediaBox.getWidth();
        float pageHeight = mediaBox.getHeight();

        // Calcular las dimensiones para la tabla en la mitad de la primera página
        float margin = 10;
        float tableWidth = pageWidth - (2 * margin);
        float tableHeight = 15f * listaLibros.size() + 5;
        float yPosition = pageHeight / 2 - tableHeight - 20;

        // Crear una nueva página para la tabla si no hay suficiente espacio en la mitad de la primera página
        if (yPosition < margin) {
            firstPage = new PDPage(mediaBox);
            document.addPage(firstPage);
            yPosition = pageHeight - 2 * margin - tableHeight;
        }

        PDPageContentStream contentStream = new PDPageContentStream(document, firstPage, PDPageContentStream.AppendMode.APPEND, true);

        drawTable(contentStream, yPosition, margin, tableWidth, tableHeight, columnText, listaLibros);

        contentStream.close();

        document.save(outputStream);
        document.close();
    }

    private void drawTable(PDPageContentStream contentStream, float yPosition, float margin, float tableWidth,
            float tableHeight, String[] columnText, List<LibroExcel> listaLibros) throws IOException {
        // Configurar las dimensiones de las celdas
        float[] columnWidths = { 50f, 125f, 40f, 100f, 120f, 45f, 60f };

        // Dibujar las celdas del encabezado de la tabla
        float xPosition = margin;
        int numColumns = columnText.length;
        for (int i = 0; i < numColumns; i++) {
            drawCell(contentStream, xPosition, yPosition, columnWidths[i], tableHeight, columnText[i], true);
            xPosition += columnWidths[i];
        }

        // Dibujar las celdas de los datos de la tabla
        for (LibroExcel libro : listaLibros) {
            xPosition = margin;
            yPosition -= tableHeight;

            drawCell(contentStream, xPosition, yPosition, columnWidths[0], tableHeight, String.valueOf(libro.getIdLibro()), false);
            drawCell(contentStream, xPosition + columnWidths[0], yPosition, columnWidths[1], tableHeight, libro.getTitulo(), false);
            drawCell(contentStream, xPosition + columnWidths[0] + columnWidths[1], yPosition, columnWidths[2], tableHeight, String.valueOf(libro.getAnio()), false);
            drawCell(contentStream, xPosition + columnWidths[0] + columnWidths[1] + columnWidths[2], yPosition, columnWidths[3], tableHeight, libro.getSerie(), false);
            drawCell(contentStream, xPosition + columnWidths[0] + columnWidths[1] + columnWidths[2] + columnWidths[3], yPosition, columnWidths[4], tableHeight, libro.getFechaRegistro(), false);
            drawCell(contentStream, xPosition + columnWidths[0] + columnWidths[1] + columnWidths[2] + columnWidths[3] + columnWidths[4], yPosition, columnWidths[5], tableHeight, libro.getEstado().equals("1") ? "Activo" : "Inactivo", false);
            drawCell(contentStream, xPosition + columnWidths[0] + columnWidths[1] + columnWidths[2] + columnWidths[3] + columnWidths[4] + columnWidths[5], yPosition, columnWidths[6], tableHeight, libro.getCategoria().getDescripcion(), false);
        }
    }

    private void drawCell(PDPageContentStream contentStream, float xPosition, float yPosition, float cellWidth,
            float cellHeight, String text, boolean isHeader) throws IOException {
        contentStream.setFont(PDType1Font.HELVETICA_BOLD, 10);
        contentStream.setNonStrokingColor(Color.WHITE);
        contentStream.setStrokingColor(Color.BLACK);

        // Dibujar el relleno de la celda
        contentStream.addRect(xPosition, yPosition, cellWidth, cellHeight);
        contentStream.fill();

        // Dibujar el borde de la celda
        contentStream.addRect(xPosition, yPosition, cellWidth, cellHeight);
        contentStream.stroke();

        // Configurar el color y la fuente del texto
        contentStream.setNonStrokingColor(Color.BLACK);
        contentStream.setFont(PDType1Font.HELVETICA, 10);

        // Ajustar la posición del texto según si es encabezado o dato
        float textXPosition = xPosition + 2;
        float textYPosition = yPosition + cellHeight / 2 - 5;

        if (isHeader) {
            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 10);
            contentStream.setNonStrokingColor(Color.BLACK);
            contentStream.setStrokingColor(Color.WHITE);
            textYPosition += 3;
        }

        // Escribir el texto en la celda
        contentStream.beginText();
        contentStream.newLineAtOffset(textXPosition, textYPosition);
        contentStream.showText(text);
        contentStream.endText();
    }
}
