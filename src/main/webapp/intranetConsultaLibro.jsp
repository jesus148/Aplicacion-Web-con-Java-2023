<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<!-- Css de fileDowload y javascript -->
<script type="text/javascript" src="js/jquery.fileDownload.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css" />
<title>Esteffany Lucia Huamanraime Maquin</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Consulta Libro</h4>

		<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
					<label class="control-label" for="id_titulo">Título</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_titulo">
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-success fileDownloadForm">Generar Excel</button>

				</div>	
		</div>
		
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_anio">Año</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="number" id="id_anio" min="0" max="2100">
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-danger fileDownloadFormPDF" >Generar PDF</button>
				</div>	
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_serie">Serie</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_serie">
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-warning fileDownloadFormPlantilla" >Generar Plantilla PDF</button>
				</div>	
		</div>
		
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-md-5">
					<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
				</div>
		</div>
		
		
				
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
					<label class="control-label" for="id_categoria">Categoría</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_categoria">
						<option value="-1">[Seleccione]</option>
					</select>
				</div>
			
			
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Título</th>
						<th>Año</th>
						<th>Serie</th>
						<th>Fecha Registro</th>
						<th>Estado</th>
						<th>Categoría</th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		<!-- INICIO MODAL VER DETALLE -->
		<div class="modal fade" id="id_div_ver_detalle" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Ver Detalle</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idCliente" id="idCliente">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el Titulo" type="text" maxlength="100" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
											  <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
											  <div class="col-lg-8">
											    <input class="form-control" id="id_act_anio" name="anio" placeholder="Ingrese el Año" type="text" readonly="readonly">
											  </div>
											</div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese el Serie" type="text" maxlength="100" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado" disabled="disabled">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_categoria" name="categoria" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Salir</button>
		                                        </div>
		                                    </div>   
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	
		<!-- FIN MODAL DE VER DETALLE -->
	</div>


	<script type="text/javascript">
		$.getJSON("cargaCategoria", {}, function (data){
			$.each(data, function(index, item){
				$("#id_categoria").append("<option value=" +  item.idCategoria +" >" +  item.descripcion + "</option>");
				$("#id_act_categoria").append("<option value=" +  item.idCategoria +" >" +  item.descripcion + "</option>");
			});	
		});	
	
		$("#id_btn_filtro").click(function() {
			var vtitulo = $("#id_titulo").val();
			var vanio = $("#id_anio").val();
			var vserie = $("#id_serie").val();
			var vestado = $("#id_estado").is(":checked") ?  1 : 0;
			var vcategoria = $("#id_categoria").val();
			
			
			
			console.log(">> vtitulo >> " + vtitulo);
			console.log(">> vanio >> " + vanio);
			console.log(">> vserie >> " + vserie);
			console.log(">> vestado >> " + vestado);
			console.log(">> vcategoria >> " + vcategoria);
			
			
			$.getJSON("listaLibroComplejo", {"titulo":vtitulo, "anio":vanio,"serie":vserie, "estado": vestado,"categoria":vcategoria}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
				 data: lista,
					//language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        
			        },
					columns:[
						{data: "idLibro",className:'text-center'},
						{data: "titulo",className:'text-center'},
						{data: "anio",className:'text-center'},
						{data: "serie",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "categoria.descripcion",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\''+row.titulo+ '\',\'' +  row.anio  + '\',\'' +  row.serie + '\',\'' +  row.estado + '\',\'' +  row.categoria.idCategoria +'\');">Ver</button>';  
						},className:'text-center'},
					]                                     
			    });
		}
		
		
		
	
			
			$(".fileDownloadForm").click(function() {
			    // Obtener los parámetros de consulta
			    var vtitulo = $("#id_titulo").val();
			    var vanio = $("#id_anio").val();
			    var vserie = $("#id_serie").val();
			    var vestado = $("#id_estado").is(":checked") ? 1 : 0;
			    var vcategoria = $("#id_categoria option:selected").text();


			    // Obtener la tabla generada
			    var table = $("#id_table").DataTable();

			    // Obtener los datos de la tabla sin la última columna
			    
			    var data = table.rows().data().toArray();
				 data.forEach(function(row) {
				   var rowArray = Array.from(row); // Convertir el objeto row en un arreglo
				   rowArray.pop(); // Eliminar la última columna del arreglo
				 });

			    // Crear la URL de la solicitud con los parámetros de consulta y los datos de la tabla
			    var url = "generaLibroExcel";
			    url += "?titulo=" + encodeURIComponent(vtitulo);
			    url += "&anio=" + encodeURIComponent(vanio);
			    url += "&serie=" + encodeURIComponent(vserie);
			    url += "&estado=" + encodeURIComponent(vestado);
			    url += "&categoria=" + encodeURIComponent(vcategoria);
			    url += "&tabla=" + encodeURIComponent(JSON.stringify(data));
			    console.table(JSON.stringify(data))
			    // Realizar la solicitud al servlet
			    window.location.href = url;
			});
		
		$(".fileDownloadFormPDF").click(function() {
			// Obtener los parámetros de consulta
		    var vtitulo = $("#id_titulo").val();
		    var vanio = $("#id_anio").val();
		    var vserie = $("#id_serie").val();
		    var vestado = $("#id_estado").is(":checked") ? 1 : 0;
		    var vcategoria = $("#id_categoria option:selected").text();


		    // Obtener la tabla generada
		    var table = $("#id_table").DataTable();

		    // Obtener los datos de la tabla sin la última columna
		    
		    var data = table.rows().data().toArray();
			 data.forEach(function(row) {
			   var rowArray = Array.from(row); // Convertir el objeto row en un arreglo
			   rowArray.pop(); // Eliminar la última columna del arreglo
			 });

		    // Crear la URL de la solicitud con los parámetros de consulta y los datos de la tabla
		    var url = "generaLibroPDF";
		    url += "?titulo=" + encodeURIComponent(vtitulo);
		    url += "&anio=" + encodeURIComponent(vanio);
		    url += "&serie=" + encodeURIComponent(vserie);
		    url += "&estado=" + encodeURIComponent(vestado);
		    url += "&categoria=" + encodeURIComponent(vcategoria);
		    url += "&tabla=" + encodeURIComponent(JSON.stringify(data));
		    console.table(JSON.stringify(data))
		    // Realizar la solicitud al servlet
		    window.location.href = url;
			});
		
		$(".fileDownloadFormPlantilla").click(function() {
			// Obtener los parámetros de consulta
		    var vtitulo = $("#id_titulo").val();
		    var vanio = $("#id_anio").val();
		    var vserie = $("#id_serie").val();
		    var vestado = $("#id_estado").is(":checked") ? 1 : 0;
		    var vcategoria = $("#id_categoria option:selected").text();


		    // Obtener la tabla generada
		    var table = $("#id_table").DataTable();

		    // Obtener los datos de la tabla sin la última columna
		    
		    var data = table.rows().data().toArray();
			 data.forEach(function(row) {
			   var rowArray = Array.from(row); // Convertir el objeto row en un arreglo
			   rowArray.pop(); // Eliminar la última columna del arreglo
			 });

		    // Crear la URL de la solicitud con los parámetros de consulta y los datos de la tabla
		    var url = "generaLibroPDFPlantilla";
		    url += "?titulo=" + encodeURIComponent(vtitulo);
		    url += "&anio=" + encodeURIComponent(vanio);
		    url += "&serie=" + encodeURIComponent(vserie);
		    url += "&estado=" + encodeURIComponent(vestado);
		    url += "&categoria=" + encodeURIComponent(vcategoria);
		    url += "&tabla=" + encodeURIComponent(JSON.stringify(data));
		    console.table(JSON.stringify(data))
		    // Realizar la solicitud al servlet
		    window.location.href = url;
			});
		function verFormulario(titulo,anio,serie,estado, categoria){

			console.log(">> verFormulario >> ");

			console.log(">> titulo >> " + titulo);
			console.log(">> año >> " + anio);
			console.log(">> serie >> " + serie);

			console.log(">> estado >> " + estado);

			console.log(">> categoria >> " + categoria);
			
			$("#id_act_titulo").val(titulo);
			$("#id_act_anio").val(anio);
			$("#id_act_serie").val(serie);
			$("#id_act_estado").val(estado);
			$("#id_act_categoria").val(categoria);
			$("#id_div_ver_detalle").modal("show");

		}
	</script>
</body>
</html>