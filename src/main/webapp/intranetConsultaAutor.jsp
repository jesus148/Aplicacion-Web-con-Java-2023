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

<title>Lista Autor</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Consulta Autor</h4>

		<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
					<label class="control-label" for="id_nombres">Nombres</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_nombres">
				</div>
		</div>
		
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_apellidos">Apellidos</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_apellidos">
				</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-3">
				<label class="control-label" for="id_filtro">Fecha Nacimiento</label> 
			</div>	
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_inicio">
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_fin">
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_telefono">Teléfono</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_telefono" maxlength="8">
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
					<label class="control-label" for="id_grado">Grado</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_grado">
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
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha Nacimiento</th>
						<th>Télefono</th>		
						<th>Fecha Registro</th>
						<th>Estado</th>
						<th>Grado</th>
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
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="100" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
											  <label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
											  <div class="col-lg-8">
											    <input class="form-control" id="id_act_apellidos" name="apellidos" placeholder="Ingrese el apellido" type="text" readonly="readonly">
											  </div>
											</div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecnac">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fecnac" name="fechaNacimiento" type="date" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" type="text" maxlength="8" readonly="readonly"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_grado" name="grado" disabled="disabled">
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
		$.getJSON("cargaGrado", {}, function (data){
			$.each(data, function(index, item){
				$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion + "</option>");
				$("#id_act_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion + "</option>");
			});	
		});	
	
		$("#id_btn_filtro").click(function() {
			var vnombres = $("#id_nombres").val();
			var vapellidos = $("#id_apellidos").val();
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
			var vtelefono = $("#id_telefono").val();
			var vestado = $("#id_estado").is(":checked") ?  1 : 0;
			var vgrado = $("#id_grado").val();
			
			
			
			console.log(">> vnombres >>" + vnombres);
			console.log(">> vapellidos >> " + vapellidos);
			console.log(">> vfechaInicio >> " + vfecIni);
			console.log(">> vfechaFin >> " + vfecFin);
			console.log(">> vtelefono >> " + vtelefono);
			console.log(">> vestado >> " + vestado);
			console.log(">> vgrado >> " + vgrado);
			
			
			$.getJSON("listaAutorComplejo", {"nombres":vnombres, "apellidos":vapellidos,"fechaInicio":vfecIni, "fechaFin":vfecFin,"telefono":vtelefono, "estado": vestado,"grado":vgrado}, function(data) {
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
						{data: "idAutor",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "formateadoFecNac",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "grado.descripcion",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\''+row.nombres+ '\',\'' +  row.apellidos  + '\',\'' + row.formateadoFecNac + '\',\'' +  row.telefono +  '\',\'' +  row.estado+'\',\'' +  row.grado.idGrado +'\');">Ver</button>';  
						},className:'text-center'},
					]                                     
			    });
		}
		
		
		function verFormulario(nombres,apellidos,fechaNacimiento,telefono,estado, grado){

			console.log(">> verFormulario >> ");
			console.log(">> nombres >> " + nombres);
			console.log(">> apellidos >> " + apellidos);
			console.log(">> fechaNacimiento >> " + fechaNacimiento);
			console.log(">> telefono >> " + telefono);
			console.log(">> estado >> " + estado);
			console.log(">> grado >> " + grado);
			
			$("#id_act_nombres").val(nombres);
			$("#id_act_apellidos").val(apellidos);
			$("#id_act_fecnac").val(fechaNacimiento);
			$("#id_act_telefono").val(telefono);
			$("#id_act_estado").val(estado);
			$("#id_act_grado").val(grado);
			$("#id_div_ver_detalle").modal("show");

		}
	</script>  
</body>
</html>






