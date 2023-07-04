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


<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h2 class="text-center">Consulta Proveedor</h2>
	
	<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Razón Social</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="razon" id="id_razon" >
			</div>			
		</div>
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Ruc</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="ruc" id="id_ruc" >
			</div>			
		</div>
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">Contacto:</label> 
			</div>	
			<div class="col-md-5">
				<input class="form-control" type="text" name="contacto" id="id_contacto" >
			</div>			
		</div>
		
		<div class="row" style="margin-top: 2%">
				<div class="col-md-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-md-5">
					<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
				</div>
		</div>
		
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-4">
				<label class="control-label">País:</label> 
			</div>	
			<div class="col-md-5">
				<select class="form-control" id="id_pais" name="pais">
					<option value="-1">[Seleccione]</option>
				</select>
			</div>			
		</div>
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Razón Social</th>
						<th>RUC</th>
						<th>Dirección</th>
						<th>Contacto</th>
						<th>Estado</th> 
						<th>Fecha Registro</th>
						<th>País</th>
						<th>Detalle</th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos de Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idProveedor" id="idProveedor" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_razon">Razón Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_razon" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_ruc">Ruc</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_ruc" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_contacto">Contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_contacto" type="text" readonly="readonly"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group"  >
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" style="margin-top:3px"  id="id_btn_salir" class="btn btn-primary" data-dismiss="modal">Salir</button>
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
			var vrazon = $("#id_razon").val();
			var vruc = $("#id_ruc").val();
			var vcontacto = $("#id_contacto").val();
			var vestado = $("#id_estado").is(":checked") ?  1 : 0;
			var vpais = $("#id_pais").val();
			
			console.log("Razón Social -->"  + vrazon);
			console.log("Ruc -->  "  + vruc);
			console.log("Contacto --> : "  + vcontacto);
			console.log("País :"   + vpais);
			console.log("Estado :"  + vestado);
			
			$.getJSON("listaProveedorComplejo", {"razon":vrazon,"ruc":vruc,"contacto":vcontacto,
				"pais":vpais,"estado": vestado}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					/*language: IDIOMA,*/
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
						{data: "contacto",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-primary" onClick="verFormulario(\'' + 
									row.razonsocial + '\',\'' + row.ruc + '\',\'' +  row.contacto +
									'\',\'' +  row.estado + '\',\'' +  row.pais.idPais +'\');">Ver</button>';  
						},className:'text-center'},
					]                                     
			    });
		}
		
		$.getJSON("cargaPais", {}, function (data){
			$.each(data, function(index, item){
				$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
				$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			});	
		});	
		
		function verFormulario(razonsocial,ruc,contacto,estado,pais){
			$("#id_act_razon").val(razonsocial);
			$("#id_act_ruc").val(ruc);
			$("#id_act_contacto").val(contacto);
			$("#id_act_estado").val(estado);   
			$("#id_act_pais").val(pais);
			$("#id_div_modal_ver").modal("show");
		}
		
	</script>
	
	
</body>
</html>



