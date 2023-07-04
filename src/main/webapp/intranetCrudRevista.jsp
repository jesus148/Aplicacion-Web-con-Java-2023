<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/styles.css">



<title>CRUD Revista</title>
<style>
    body {
background: rgb(31,129,142);
background: radial-gradient(circle, rgba(31,129,142,0.9977240896358543) 11%, rgba(155,218,228,1) 85%);
			}
  </style>
</head>
<body>

	<jsp:include page="intranetCabecera.jsp" />
	<h4>Crud Revista</h4>
	


	<div class="container">
		<h1>CRUD Revista</h1>
		<h6>Autor : Jonhy Mitchel Bobadilla Ocampo</h6>
		<div class="row" style="margin-top: 3%">

			<div class="col-md-1">
				<label class="control-label" for="id_filtro">Nombre</label>
			</div>

			<div class="col-md-9">
				<input class="form-control"  type="text" id="id_filtro"
					placeholder="Ingrese nombre de revista">
			</div>

			<div class="col-md-1">
				<button type="button" class="btn-numero1" id="id_btn_filtro">Listar</button>
			</div>

			<div class="col-md-1">
				<button type="button" class="btn-numero1" data-toggle='modal'
					data-target="#id_div_modal_registra">Registrar</button>
			</div>

		</div>



		<div class="row" style="margin-top: 3%">
			<table id="id_table"
				class="table table-bordered table-hover table-condensed">
				<thead style='background-color: #131920; color: silver;;'>
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>Fecuencia</th>
						<th>Fecha Creación</th>
						<th>Estado</th>
						<th>Modalidad</th>
						<th>Actualizar</th>
						<th>Cambio de Estado</th>
						<th>Eliminar</th>




					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>


		</div>

		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra">
			<div class="modal-dialog" style="width: 60%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de
							Revista
						</h4>
					</div>
					<div class="modal-body">
						<div class="panel-group" id="steps">
							<div class="panel panel-default">
								<div id="stepOne" class="panel-collapse collapse in">
									<form id="id_form_registra">
										<input type="hidden" name="metodo" value="inserta">
										<div class="panel-body">

											<div class="form-group">
												<label class="control-label" for="id_nombre">Nombre</label>
												<input class="form-control" type="text" id="id_nombre"
													name="nombre" placeholder="Ingrese el nombre">
											</div>


											<div class="form-group">
												<label class="control-label" for="id_frecuencia">Frecuencia</label>
												<input class="form-control" type="text" id="id_frecuencia"
													name="frecuencia" placeholder="Ingrese La frecuencia">
											</div>
											<div class="form-group">
												<label class="control-Label" for="id_fechaCreacion">Fecha
													Creación</label> <input class="form-control" type="date"
													id="id_fechaCreacion" name="fechaCreacion"
													placeholder="Ingrese La fecha de creacion">

											</div>
											<div class="form-group">
												<label class="control-label" for="id_modalidad">
													Modalidad </label> <select class="form-control" id="id_modalidad"
													name="modalidad">
													<option value=" ">[Seleccione]</option>
												</select>
											</div>
											<div class="form-group">
												<div class="col-lg-12" align="center">
													<button type="button" style="width: 80px"
														id="id_btn_registra" class="btn btn-primary btn-sm">Registrar</button>
													<button type="button" style="width: 80px"
														id="id_btn_reg_cancelar" class="btn btn-primary btn-sm"
														data-dismiss="modal">Cancelar</button>
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
		<!-- FIN MODAL DE REGISTRO -->


		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza">
			<div class="modal-dialog" style="width: 60%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Actualiza
							Revista
						</h4>
					</div>
					<div class="modal-body">
						<div class="panel-group" id="steps">
							<div class="panel panel-default">
								<div id="stepOne" class="panel-collapse collapse in">
									<form id="id_form_actualiza">
										<input type="hidden" name="metodo" value="actualiza">
										<input type="hidden" name="idRevista" id="idRevista">
										<div class="panel-body">
											<div class="form-group">
												<label class="control-label" for="id_nombre">Nombre</label>
												<input class="form-control" type="text" id="id_nombreAct"
													name="nombre" placeholder="Ingrese el nombre">
											</div>


											<div class="form-group">
												<label class="control-label" for="id_frecuencia">Frecuencia</label>
												<input class="form-control" type="text"
													id="id_frecuenciaAct" name="frecuencia"
													placeholder="Ingrese La frecuencia">
											</div>
											<div class="form-group">
												<label class="control-Label" for="id_fechaCreacion">Fecha
													Creación</label> <input class="form-control" type="date"
													id="id_fechaCreacionAct" name="fechaCreacion"
													placeholder="Ingrese La fecha de creacion">

											</div>
											<div class="form-group">
												<label class="control-label" for="id_modalidad">
													Modalidad </label> <select class="form-control"
													id="id_modalidadAct" name="modalidad">
													<option value=" ">[Seleccione]</option>
												</select>
											</div>

											<div class="form-group">
												<div class="col-lg-12" align="center">
													<button type="button" style="width: 100px"
														id="id_btn_actualiza" class="btn-actualiza ">Actualizar</button>
													<button type="button" style="width: 100px"
														id="id_btn_act_cancelar" class="btn-cancelar"
														data-dismiss="modal">Cancelar</button>
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
		<!-- FIN MODAL DE ACTUALIZA -->

	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudRevista", {
				"metodo" : "lista",
				"filtro" : vfiltro
			}, function(data) {
				agregarGrilla(data);
			});
		});

		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table')
					.DataTable(
							{
								data : lista,
								language : IDIOMA,
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
											data : "idRevista",
											className :'text-center'
										},
										{
											data : "nombre",
											className : 'text-center'
										},
										{
											data : "frecuencia",
											className : 'text-center'
										},
										{
											data : "fechaFormateada",
											className : 'text-center'
										},
										{
											data : function(row, type, val,
													meta) {
												return row.estado == 1 ? "Activo"
														: "Inactivo";
											},
											className : 'text-center'
										},
										{
											data : "modalidad.descripcion",
											className : 'text-center'
										},

										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn-actualiza " onClick="verFormularioActualiza(\''
														+ row.idRevista
														+ '\',\''
														+ row.nombre
														+ '\',\''
														+ row.frecuencia
														+ '\',\''
														+ row.fechaFormateada
														+ '\',\''
														+ row.modalidad.idModalidad
														+ '\');">Actualizar</button>';
											},
											className : 'text-center'
										},

										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn btn-warning " onClick="eliminacionActIna(\''
														+ row.idRevista
														+ '\');" >Acti/Inac</button>';
											},
											className : 'text-center'
										},

										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn-cancelar " onClick="eliminacionFisica(\''
														+ row.idRevista
														+ '\');" >Eliminar</button>';
											},
											className : 'text-center'
										},

								]
							});
		}

		function verFormularioActualiza(idRevista, nombre, frecuencia,
				fechaCreacion, modalidad) {
			console.log(">> verFormularioActualiza >> " + idRevista);
			$("#id_div_modal_actualiza").modal("show");
			$("#idRevista").val(idRevista);
			$("#id_nombreAct").val(nombre);
			$("#id_frecuenciaAct").val(frecuencia);
			$("#id_fechaCreacionAct").val(fechaCreacion);
			$("#id_modalidadAct").val(modalidad);
		}

		$.getJSON("cargaModalidad", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_modalidad").append(
						"<option value='"+ item.idModalidad +"'>"
								+ item.descripcion + "</option>");
				$("#id_modalidadAct").append(
						"<option value='"+ item.idModalidad +"'>"
								+ item.descripcion + "</option>");
			})
		});

		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
		    
		    if (validator.isValid()) {
			$.ajax({
				type : "POST",
				url : "crudRevista",
				data : $('#id_form_registra').serialize(),
				success : function(data) {
					mostrarMensaje(data.mensaje);
					agregarGrilla(data.datos);
					limpiarFormulario();
					validator.resetForm();
					
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
			
		    }
		});
		
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	nombre : {  
		        		selector: "#id_nombre",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El  nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	
		        	nombreAct : {  
		        		selector: "#id_nombreAct",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	
		        	frecuencia : {
		        		selector: "#id_frecuencia",
		        		validators : {
		        			notEmpty: {
		                        message: 'La frecuencia es requerida'
		                    },
		                    
		                    stringLength: {
		                        min: 2,
		                        max: 10,
		                        message: 'La frecuencia tiene de 1 a 10 caracteres'
		                    },
		                  
		        		}
		        	},
		        	
		        	frecuenciaAct : {
		        		selector: "#id_frecuenciaAct",
		        		validators : {
		        			notEmpty: {
		                        message: 'La frecuencia es requerida'
		                    },
		                    
		                    stringLength: {
		                        min: 2,
		                        max: 10,
		                        message: 'La frecuencia tiene de 1 a 10 caracteres'
		                    },
		                  
		        		}
		        	},
		        	
		        	
		        	fechaCreacion : {
		        		selector: "#id_fechaCreacion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de creacion es requerida'
		                    },
		        		}
		        	},  
		        	
		        	fechaCreacionAct : {
		        		selector: "#id_fechaCreacionAct",
		        		validators : {
		        			notEmpty: {
		                        message: 'Ingresar nueva fecha de crecacion para actualizar'
		                    },
		        		}
		        	},  
		        	
		        	modalidad : {
		        		selector: "#id_modalidad",
		        		validators : {
		        			notEmpty: {
		                        message: 'La modalidad es requerida'
		                    },
		        		}
		        	}, 
		        	
		        	modalidadAct : {
		        		selector: "#id_modalidadAct",
		        		validators : {
		        			notEmpty: {
		                        message: 'La modalidad es requerida'
		                    },
		        		}
		        	}, 
		        	
		        	
		        	
		        	
		        	
		        }
		  
		    });

		});
		
		

		

		function eliminacionFisica(idRevista) {
			$.ajax({
				type : "POST",
				url : "crudRevista",
				data : {
					"metodo" : "eFisica",
					"idRevista" : idRevista
				},
				success : function(data) {
					mostrarMensaje(data.mensaje);
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}

		function eliminacionActIna(idRevista) {
			$.ajax({
				type : "POST",
				url : "crudRevista",
				data : {
					"metodo" : "eLogica",
					"idRevista" : idRevista
				},
				success : function(data) {
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}
		
		
	
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();    
		    if (validator.isValid()) {
			$.ajax({
				type : "POST",
				url : "crudRevista",
				data : $('#id_form_actualiza').serialize(),
				success : function(data) {
					mostrarMensaje(data.mensaje);
					agregarGrilla(data.datos);
					limpiarFormulario();
					validator.resetForm();
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
			
			}
		});
		
		
		
		function limpiarFormulario(){	
			$('#id_nombre').val('');
			$('#id_frecuencia').val('');
			$( '#id_fechaCreacion').val('');
			$('#id_modalidad').val(' ');

		}
		
	
	</script>



</body>
</html>



