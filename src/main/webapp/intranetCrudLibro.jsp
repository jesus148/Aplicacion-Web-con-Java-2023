<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Crud Libro</h4>

	<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Título</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el título">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtra</button>
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary"  data-toggle='modal' data-target="#id_div_modal_registra" >Registra</button>
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
						<th>Estado</th>
						<th>Categoría</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Libro</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el título" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_anio" name="anio" placeholder="Ingrese el año de publicación" type="text" required maxlength="4">
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese la serie" type="text" maxlength="100">
		                                        </div>
		                                    </div>
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
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
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Libro</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idLibro" id="idLibro">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el Título" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_anio" name="anio" placeholder="Ingrese el año" type="text" required maxlength="4">
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese el serie" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualiza</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
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
	$.getJSON("crudLibro", {"metodo":"lista","filtro":vfiltro}, function(data) {
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
				{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo" : "Inactivo";  
				},className:'text-center'},
				{data: "categoria.descripcion",className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idLibro + '\',\'' +  row.titulo   + '\',\'' +  row.anio+ '\',\'' +  row.serie + '\',\'' +  row.estado + '\',\'' +  row.categoria.idCategoria +'\');">Editar</button>';  
				},className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idLibro +'\');" >E.Lógica</button>';
				},className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-danger btn-sm" onClick="eliminacionFisica(\'' + row.idLibro +'\');"  >E.Física</button>';
				},className:'text-center'},
			]                                     
	    });
}
		
		function verFormularioActualiza(idLibro, titulo, anio, serie,estado,categoria){
			console.log(">> verFormularioActualiza >> " + idLibro);
			$("#id_div_modal_actualiza").modal("show");
			$("#idLibro").val(idLibro);
			$("#id_act_titulo").val(titulo);
			$("#id_act_anio").val(anio);
			$("#id_act_serie").val(serie);
			$("#id_act_estado").val(estado);
			$("#id_act_categoria").val(categoria);
		}
		$.getJSON("cargaCategoria",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.descripcion+"</option>");
				$("#id_act_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.descripcion+"</option>");
			})
		});
		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudLibro", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		
		function eliminacionFisica(idLibro){	
			var array = [idLibro];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}

		function accionEliminacionFisica(array){
			 $.ajax({
				 type: "POST",
		          url: "crudLibro", 
		          data: {"metodo":"eFisica","idLibro":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		/*function eliminacionFisica(idLibro){
			
			$.ajax({
		          type: "POST",
		          url: "crudLibro", 
		          data: {"metodo":"eFisica","idLibro":idLibro},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		    
		}*/
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
				$.ajax({
			          type: "POST",
			          url: "crudLibro", 
			          data: $('#id_form_actualiza').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_actualiza').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		function eliminacionLogica(idLibro){
			$.ajax({
		          type: "POST",
		          url: "crudLibro", 
		          data: {"metodo":"eLogica","idLibro":idLibro},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		
		//---------------REVISAR CON CUIDADO
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	titulo : {  
		        		selector: "#id_reg_titulo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El título es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 100,
		                        message: 'El nombre tiene de 3 a 100 caracteres'
		                    },
		        		}
		        	},
		        	anio : {
		        		selector: "#id_reg_anio",
		        		validators : {
		        			notEmpty: {
		                        message: 'El año es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]+$/,
		                        message: 'El año solo tiene números'
		                    },
		                    
		        		}
		        	},
		        	serie : {
		        		selector: "#id_reg_serie",
		        		validators : {
		        			notEmpty: {
		                        message: 'El código de serie es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[A-Z0-9]+$/,
		                        message: 'El código de serie solo tiene letras mayúsculas y números'
		                    },
		        		}
		        	},
		        	categoria : {
		        		selector: "#id_reg_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	titulo : {  
		        		selector: "#id_act_titulo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El título es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 100,
		                        message: 'El nombre tiene de 3 a 100 caracteres'
		                    },
		        		}
		        	},
		        	anio : {
		        		selector: "#id_act_anio",
		        		validators : {
		        			notEmpty: {
		                        message: 'El año es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]+$/,
		                        message: 'El año solo tiene números'
		                    },
		                    
		        		}
		        	},
		        	serie : {
		        		selector: "#id_act_serie",
		        		validators : {
		        			notEmpty: {
		                        message: 'El código de serie es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[A-Z0-9]+$/,
		                        message: 'El código de serie solo tiene letras mayúsculas y números'
		                    },
		        		}
		        	},
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	categoria : {
		        		selector: "#id_act_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_titulo').val("");
			$('#id_reg_anio').val("");
			$('#id_reg_serie').val(" ");
			$('#id_reg_categoria').val(" ");
			$('#id_act_titulo').val("");
			$('#id_act_anio').val("");
			$('#id_act_serie').val("");
			$('#id_act_categoria').val(" ");
			$('#id_act_estado').val(" ");
			
		}
	</script>









</body>
</html>



