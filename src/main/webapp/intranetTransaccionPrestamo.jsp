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
<h4>Prestamo</h4>

			<input type="hidden" id="id_metodo"  class="form-control"/>
			<input type="hidden" id="id_elimina" class="form-control"/>
			<input type="hidden" id="id_cliente_id" class="form-control"/>
			<input type="hidden" id="id_producto_id" class="form-control"/>
			
	<div class="panel-group" id="steps">
				<div class="panel panel-default">
					<div class="panel-heading">Alumno</div>
						<div class="panel-body">
							<form  class="form-horizontal">
							<div class="form-group">
									<label class="col-lg-3 control-label">Buscar Alumno</label>
									<div class="col-lg-5">
										<button type="button" id="id_btnCliente" data-toggle='modal' class='btn btn-success' >....</button>
									</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Apellidos</label>
								<div class="col-lg-5">
									<input type="text"  id="id_cliente_apellido" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Nombre</label>
								<div class="col-lg-5">
									<input type="text"id="id_cliente_nombre"  class="form-control"	readonly="readonly"/>
								</div>
							</div>
							</form>
					</div>
				</div>
				
	<div class="panel panel-default">
					<div class="panel-heading">Libro</div>
						<div class="panel-body">
							<form  class="form-horizontal">
							<div class="form-group">
								<label class="col-lg-3 control-label">Buscar Libro</label>
								<div class="col-lg-5">
									<button type="button" id="id_btnProducto" data-toggle='modal' class='btn btn-success' >....</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Titulo</label>
								<div class="col-lg-5">
									<input type="text" name="nombreProducto" id="id_producto_nombre" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">AÑO</label>
								<div class="col-lg-3">
									<input type="text" name="precio" id="id_producto_precio" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Serie</label>
								<div class="col-lg-3">
									<input type="text" name="stock" id="id_producto_stock" class="form-control" readonly="readonly"/>
								</div>
							</div>	
							
							<div class="form-group">
								<label class="col-lg-3 control-label" for="id_reg_estado">Fecha Devolucion</label>
								<div class="col-lg-3">
									<input type="date" name="cantidad" id="id_cantidad" class="form-control" />
								</div>
							</div>						
							</form>
						</div>
				</div>
			</div>		
			
			
	<div class="panel panel-default">
					<div class="panel-heading">Préstamo</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" id="id_btnAgregar" class="btn btn-primary">AGREGAR</button>
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary">REGISTRAR PRESTAMO</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>ID</th>
												<th>Titulo</th>
												<th>Año</th>
												<th>Serie</th>

												<th></th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</div>
					</div>
				</div>			


<!-- El formulario de busqueda de Cliente (Modal) -->

  	 <div class="modal fade" id="idBuscaCliente" >
			<div class="modal-dialog" style="width: 60%; height: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Alumno</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
		                        			<form  class="form-horizontal">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Alumno 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtCliente" class="form-control" name="cliente" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_cliente" class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 40%">Nombre</th>
																<th style="width: 35%">Apellido</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
											</form>
			                        </div>
		                    </div>
					</div>
			</div>
			</div>
		</div>


<!-- El formulario de busqueda de Producto (Modal) -->

  	 <div class="modal fade" id="idBuscaProducto" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
		                        		<form  class="form-horizontal">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Libro 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtProducto" class="form-control" name="producto" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_producto" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 45%">Titulo</th>
																<th style="width: 15%">Año</th>
																<th style="width: 15%">Serie</th>
																
																<th ></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
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
	
<script type="text/javascript">

//Al pulsar el botón cliente
$("#id_btnCliente").click(function (){
	$("#idBuscaCliente").modal("show");
});

//Al pulsar el botón producto
$("#id_btnProducto").click(function (){
	$("#idBuscaProducto").modal("show");
});

//Al escribir en la caja de texto del cliente
$("#id_txtCliente").keyup( function (e){
	var var_cliente = $("#id_txtCliente").val();
	console.log(">> " + var_cliente);
	
	//limpiar la tabla
	$("#id_table_cliente tbody").remove();
	
	//Se añade los clientes a la tabla
	$.getJSON("buscaAlumno",{"filtro":var_cliente}, function (data){
		agregarCliente(data);	
	});
	
});

//Al escribir en la caja de texto del producto
$("#id_txtProducto").keyup( function (e){
	var var_producto = $("#id_txtProducto").val();
	console.log(">> " + var_producto);
	
	//Se añade los clientes a la producto
	$.getJSON("buscaLibro",{"filtro":var_producto}, function (data){
		agregarProducto(data);	
	});
});


//Se anula el enter
$(document).on("keypress", "form", function(event) { 
    return event.keyCode != 13;
});

//Al pulsar selecciona cliente
function f_seleccione_cliente(id,nombres,apellidos){
	$("#id_cliente_id").val(id);
	$("#id_cliente_nombre").val(nombres);
	$("#id_cliente_apellido").val(apellidos);
	$("#idBuscaCliente").modal("hide");
}

//Al pulsar selecciona producto
function f_seleccione_producto(id,titulo,anio,serie){
	$("#id_producto_id").val(id);
	$("#id_producto_nombre").val(titulo);
	$("#id_producto_precio").val(anio);
	$("#id_producto_stock").val(serie);
	$("#idBuscaProducto").modal("hide");
}

function limpiar_todo(){
	$("#id_cliente_id").val("");
	$("#id_cliente_nombre").val("");
	$("#id_cliente_apellido").val("");
	$("#id_producto_id").val("");
	$("#id_producto_nombre").val("");
	$("#id_producto_precio").val("");
	$("#id_producto_stock").val("");
	$("#id_cantidad").val("");
}

//Al pulsar el botón eliminar
function f_elimina_seleccion(id){	
	$.ajax({
          type: "POST",
          url: "boleta", 
          data: {"metodo":"eliminaSeleccion","id":id},
          success: function(data){
        	  agregarGrilla(data.datos);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
    });
}



$("#id_btnRegistrar").click(function() {
	var id = $("#id_cliente_id").val();
	console.log("alumno>>>" + id)
	$.ajax({
          type: "POST",
          url: "boleta", 
          data: {"metodo":"registraBoleta","idAlumno":id},
          success: function(data){
        	  agregarGrilla(data.datos);
        	  mostrarMensaje(data.mensaje);
        	  limpiar_todo();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
    });
});

$("#id_btnAgregar").click(function() {
	var id = $("#id_producto_id").val();
	var nom = $("#id_producto_nombre").val();
	var pre = $("#id_producto_precio").val();
	var can = $("#id_producto_stock").val();
	var fd = $("#id_cantidad").val();
	
	$.ajax({
          type: "POST",
          url: "boleta", 
          data: {"metodo":"agregaSeleccion","idLibro":id,
        	  	 "titulo":nom, "anio":pre,"serie":can},
          success: function(data){
        	  agregarGrilla(data.datos);
        	
          }
    });
});




function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			language: false,
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
				//{data: "fecha",className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-danger btn-sm"  onClick="f_elimina_seleccion(\'' + row.idLibro +'\');" >Eliminar</button>';
				},className:'text-center'},
			]                                     
	    });
}


function agregarCliente(lista){
	 $('#id_table_cliente').DataTable().clear();
	 $('#id_table_cliente').DataTable().destroy();
	 $('#id_table_cliente').DataTable({
			data: lista,
			language: false,
			searching: false,
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
				{data: "idAlumno",className:'text-center'},
				{data: "nombres",className:'text-center'},
				{data: "apellidos",className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-info btn-sm" onClick="f_seleccione_cliente(\'' + row.idAlumno + '\',\'' +  row.nombres   + '\',\'' +  row.apellidos  +'\')" >Seleccione</button>';					},className:'text-center'},
			]                                     
	    });
}


function agregarProducto(lista){
	 $('#id_table_producto').DataTable().clear();
	 $('#id_table_producto').DataTable().destroy();
	 $('#id_table_producto').DataTable({
			data: lista,
			language: false,
			searching: false,
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
					return '<button type="button" class="btn btn-info btn-sm" onClick="f_seleccione_producto(\'' + row.idLibro + '\',\'' +  row.titulo   + '\',\'' +  row.anio + '\',\'' +  row.serie  +'\')" >Seleccione</button>';
				},className:'text-center'},
			]                                     
	    });
}



</script>
	

</body>
</html>



