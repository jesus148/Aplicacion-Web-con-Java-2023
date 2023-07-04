<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>


<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>


<link rel="stylesheet" type="text/css" href="css/styles.css">





<title>Sistemas - Jorge Jacinto Gutarra</title>
<style>
    body {
background: rgb(31,129,142);
background: radial-gradient(circle, rgba(31,129,142,0.9977240896358543) 11%, rgba(155,218,228,1) 85%);
			}
  </style>
</head>
<body>


<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Consulta Revista</h4>
<h6>Autor: Jonhy Mitchel Bobadilla Ocampo</h6>
</div>
	<div class="container">
		

		<div class="row" style="margin-top: 5%">
			<div class="col-md-2">
				<label class="control-label">Nombre</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="nombre" id="id_nombre" >
			</div>			
		</div>
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-2">
				<label class="control-label">Frecuencia</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="frecuencia" id="id_frecuencia" >
			</div>			
		</div>

		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-2">
				<label class="control-label ">Modalidad</label> 
			</div>	
			<div class="col-md-5">
				<select class="form-control" id="id_modalidad" name="modalidad">
					<option value="-1">[Seleccione]</option>
				</select>
			</div>			
		</div>
		
		
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-2">
				<label class="control-label" for="id_estado">Estado</label> 
			</div>	
			<div class="col-md-5">
				<input type="checkbox" class="custom-control-input" id="id_estado"   name="estado" value="1"/>	
			<div id="estadoTexto"></div>	
			</div>	
		</div>
		
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-1">
				<label class="control-label" for="id_filtro">Fecha de Creación</label> 
			</div>	
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_inicio">
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_fin">
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<button type="button" class="btn-numero1" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed agrandar-letra" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>Frecuencia</th>
						<th>Fecha Creación</th>
						<th>Estado</th>
						<th>Modalidad</th>
						<th></th>
						
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		
		<!-- INICIO MODAL DE VER REVISTA -->
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos de Revista</h4>
					</div>
					<div class="modal-body id_ver_modal1" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idEmpleado" id="idEmpleado" >
			                   			<div class="panel-body id_ver_modal1">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_frecuencia">Frecuencia</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_frecuencia" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	 	
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaFormateada">Fecha Creación</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaFormateada" type="date" name="fechaFormateada" disabled="disabled"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_modalidad">Modalidad</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_modalidad" name="modalidad" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	
		                                    
		
		                                     
		                                    <div class="form-group"  >
		                                        <div class="col-lg-12" style="margin-top: 2%"  align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_salir" class="btn-salir" data-dismiss="modal">Salir</button>
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
		<!-- FIN MODAL DE VER RESVISTA -->
		

	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vnombre = $("#id_nombre").val();
			var vfrecuencia = $("#id_frecuencia").val();
			var vmodalidad = $("#id_modalidad").val();
			var vestado = $("#id_estado").is(':checked') ? 1 : 0;
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
		
			
			console.log("Nombre : "  + vnombre);
			console.log("Frecuencia : "  + vfrecuencia);
			console.log("Modalidad :"  + vmodalidad);
			console.log("Estado :"  + vestado);
			console.log("FechaInicio :"  + vfecIni);
			console.log("FechaFinal :"  + vfecFin);
			
			$.getJSON("listaRevistaComplejo", {"nombre": vnombre, "frecuencia": vfrecuencia,"modalidad":vmodalidad, "estado": vestado, "fechaInicio": vfecIni, "fechaFin":vfecFin}, function(data) {
				agregarGrilla(data);
			});
		});
		
		
		$(document).ready(function() {
			  $('#id_estado').change(function() {
			    if ($(this).is(':checked')) {
			      $('#estadoTexto').text('Activo').css('color', 'green');
			    } else {
			      $('#estadoTexto').text('Inactivo').css('color', 'red');
			    }
			  });
			});


		
		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table')
					.DataTable(
							{
								data : lista,
								language : true,
								searching : true,
								ordering : true,
								processing : true,
								pageLength : 10,
								lengthChange : false,
								info : true,
								scrollY : 305,
								scroller : {
									loadingIndicator : true
								},
								columns : [
										{
											data : "idRevista",	className :'text-center'
										},
										{
											data : "nombre",	className : 'text-center'
										},
										{
											data : "frecuencia",className : 'text-center'
										},
										{
											data : "fechaFormateada",className : 'text-center'
										},
										{
											data: function(row, type, val, meta) {
											    var estado = row.estado == 1 ? "Activo" : "Inactivo";
											    var color = row.estado == 1 ? "green" : "red";
											    return '<span style="color: ' + color + ';">' + estado + '</span>';
											  },
											  className: 'text-center'
										},
										{
											data : "modalidad.descripcion",className : 'text-center'
										},
										
										{data: function(row, type, val, meta){
											return '<button type="button" class="btn-ver" onClick="verFormulario(\'' + row.nombre + '\',\'' +  row.frecuencia + '\',\'' + row.fechaFormateada + '\',\'' +  row.estado + '\',\'' +  row.modalidad.idModalidad +'\');">Ver</button>';  
										},className:'text-center'},

					]   
								
			    });
		}
		
		
		<!-- Cargar Combo -->
		
		$.getJSON("cargaModalidad", {}, function (data){
			$.each(data, function(index, item){
				$("#id_modalidad").append("<option value=" +  item.idModalidad +" >" +  item.descripcion+ "</option>");
				$("#id_act_modalidad").append("<option value=" +  item.idModalidad +" >" +  item.descripcion+ "</option>");
			});	
		});	
		
		<!--Fin Cargar Combo -->
		
	
		function verFormulario(nombre, frecuencia,fechaFormateada, estado, modalidad){
			console.log(">> verFormulario >> ");
			console.log(">> nombre >> " + nombre);
			console.log(">> frecuencia >> " + frecuencia);
			console.log(">> fechaFormateada >> " + fechaFormateada);
			console.log(">> estado >> " + estado);
			console.log(">> modalidad >> " + modalidad);
			
			$("#id_act_nombre").val(nombre);
			$("#id_act_frecuencia").val(frecuencia);
			$("#id_act_fechaFormateada").val(fechaFormateada);
			$("#id_act_estado").val(estado);
			$("#id_act_modalidad").val(modalidad); 
			$("#id_div_modal_ver").modal("show");
			
		}
		
		
		
		
		
		
	</script>

</body>
</html>

<!-- Probando el commit -->


