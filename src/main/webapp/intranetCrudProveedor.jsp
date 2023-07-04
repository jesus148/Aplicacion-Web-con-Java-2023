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
<h4>Crud Proveedor</h4>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Raz�n Social</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese Raz�n Social">
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
						<th>C�digo</th>
						<th>Raz�n Social</th>
						<th>RUC</th>
						<th>Direcci�n</th>
						<th>Celular</th>
						<th>Contacto</th>
						<th>Estado</th>
						<th>Pa�s</th>
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                               <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_razon">Raz�n Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_razon" name="razon" placeholder="Ingrese la Raz�n Social" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
                   							<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ruc">RUC</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_ruc" name="ruc" placeholder="Ingrese RUC" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Direcci�n</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese direcci�n" type="text" maxlength="150"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">Celular</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_contacto">Contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_contacto" name="contacto" placeholder="Ingrese contacto" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pa�s</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idProveedor" id="idProveedor">
			                   			<div class="panel-body">
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_razon">Raz�n Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_razon" name="razon" placeholder="Ingrese Raz�n Social" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ruc">RUC</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_ruc" name="ruc" placeholder="Ingrese RUC" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Direcci�n</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese direcci�n" type="text" maxlength="150"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_contacto">Contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_contacto" name="contacto" placeholder="Ingrese contacto" type="text" maxlength="100"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pa�s</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais">
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
			$.getJSON("crudProveedor", {"metodo":"lista","filtro":vfiltro}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
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
						{data: "idProveedor",className:'text-center'},
						{data: "razonsocial",className:'text-center'},
						{data: "ruc",className:'text-center'},
						{data: "direccion",className:'text-center'},
						{data: "celular",className:'text-center'},
						{data: "contacto",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idProveedor + '\',\'' +  row.razonsocial
									+ '\',\'' +  row.ruc + '\',\'' + row.direccion + '\',\'' + row.celular + '\',\'' + row.contacto + '\',\'' + row.estado + '\',\'' +  row.pais.idPais +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idProveedor +'\');" >E.L�gica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idProveedor +'\');" >E.F�sica</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idProveedor, razonsocial, ruc, direccion,
				celular, contacto, estado, pais){
			console.log(">> verFormularioActualiza >> " + idProveedor);
			$("#id_div_modal_actualiza").modal("show");
			$("#idProveedor").val(idProveedor);
			$("#id_act_razon").val(razonsocial);
			$("#id_act_ruc").val(ruc);
			$("#id_act_direccion").val(direccion);
			$("#id_act_celular").val(celular);
			$("#id_act_contacto").val(contacto);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
		}
		
		$.getJSON("cargaPais",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
				$("#id_act_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
			})
		});
		
		function eliminacionFisica(idProveedor){	
			var array = [idProveedor];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}

		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudProveedor", 
		          data: {"metodo":"eFisica", "idProveedor":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudProveedor", 
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
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudProveedor", 
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
		
		
		function eliminacionLogica(idProveedor){
			 $.ajax({
		          type: "POST",
		          url: "crudProveedor", 
		          data: {"metodo":"eLogica", "idProveedor":idProveedor},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	razon : {  
		        		selector: "#id_reg_razon",
		        		validators : {
		        			notEmpty: {
		                        message: 'La raz�n social es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	ruc : {  
		        		selector: "#id_reg_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'El ruc es requerido'
		                    },		 
		                    regexp: {
		                        regexp: /^[0-9]{11}$/,
		                        message: 'El ruc tiene 11 d�gitos'
		                    },
		        		}
		        	},
		        	direccion : {  
		        		selector: "#id_reg_direccion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La direcci�n es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 50,
		                        message: 'La direcci�n tiene de 3 a 50 caracteres'
		                    },
		        		}
		        	},
		        	celular : {  
		        		selector: "#id_reg_celular",
		        		validators : {
		        			notEmpty: {
		                        message: 'El celular es requerido'
		                    },

		                    regexp: {
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El celular tiene 9 d�gitos'
		                    },
		        		}
		        	},
		        	contacto : {  
		        		selector: "#id_reg_contacto",
		        		validators : {
		        			notEmpty: {
		                        message: 'El contacto es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 50,
		                        message: 'El contacto tiene de 3 a 50 caracteres'
		                    },
		        		}
		        	},
		        	pais : {
		        		selector: "#id_reg_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pa�s es requerido'
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
		        	razon : {  
		        		selector: "#id_act_razon",
		        		validators : {
		        			notEmpty: {
		                        message: 'La raz�n social es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	ruc : {  
		        		selector: "#id_act_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'El ruc es requerido'
		                    },		 
		                    regexp: {
		                        regexp: /^[0-9]{11}$/,
		                        message: 'El ruc tiene 11 d�gitos'
		                    },
		        		}
		        	},
		        	direccion : {  
		        		selector: "#id_act_direccion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La direcci�n es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 50,
		                        message: 'La direcci�n tiene de 3 a 50 caracteres'
		                    },
		        		}
		        	},
		        	celular : {  
		        		selector: "#id_act_celular",
		        		validators : {
		        			notEmpty: {
		                        message: 'El celular es requerido'
		                    },

		                    regexp: {
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El celular tiene 9 d�gitos'
		                    },
		        		}
		        	},
		        	contacto : {  
		        		selector: "#id_act_contacto",
		        		validators : {
		        			notEmpty: {
		                        message: 'El contacto es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 50,
		                        message: 'El contacto tiene de 3 a 50 caracteres'
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
		        	pais : {
		        		selector: "#id_act_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pa�s es requerido'
		                    },
		        		}
		        	},
		        }	
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_razon').val("");
			$('#id_act_razon').val("");
			$('#id_reg_ruc').val("");
			$('#id_act_ruc').val("");
			$('#id_reg_direccion').val("");	
			$('#id_act_direccion').val("");
			$('#id_reg_celular').val("");	
			$('#id_act_celular').val("");
			$('#id_reg_contacto').val("");	
			$('#id_act_contacto').val("");
			$('#id_reg_pais').val(" ");
			$('#id_act_pais').val(" ");
			$('#id_act_estado').val(" ");
		}
	</script>

	
</body>
</html>



