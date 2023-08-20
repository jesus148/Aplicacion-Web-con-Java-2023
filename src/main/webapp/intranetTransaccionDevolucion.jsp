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
<h4>Devolución</h4>

	
	
	
	
		<!--  TEMA TRANSACCION OSEA ES UN CONJUNTO DE DATOS INTERCALADOS O RELACIONADOS SI 1 FALLA SE DESTRUIRA TODO EL PROCESO 
	    ESTO ESTA MAS LIGADO A CARRITOS DE COMPRA EN UNA APLICACION WEB 
	    
	    TABLAS AFECTADAS 
	    
	    DEVOLUCION     (se inserta)
	    DEVOLUCION_HAS_PRODUCTO  (inserta
	    ALUMNO   (solo busca)
	    LIBRO   (solo busca y actualiza)
	    USUARIO(solo busca)
	    
	    
	    
	   DIAGRAMA RELACION   VER EN MYSQL LAS RELACIONES
	   
	 
	   
	    
	    -->



			<input type="hidden" id="id_Alumno_id" class="form-control"/> 
			<input type="hidden" id="id_libro_id" class="form-control"/> 
			
			
			
<!-- 	    FORMULARIOS PRINCIPALES		 -->
	
	<!--  FORMULARIO PRINCIPAL ALUMNO -->
			<div class="panel-group" id="steps">
			
			
			
			
				<!--  ALUMNO -->
				<div class="panel panel-default">
					<div class="panel-heading">Alumno</div>
						<div class="panel-body">
							<form  class="form-horizontal">
							<div class="form-group">
									<label class="col-lg-3 control-label">Buscar Alumno</label>
									<div class="col-lg-5">
										<button type="button" id="id_btnAlumno" data-toggle='modal' class='btn btn-success' >....</button>
									</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Apellido</label>
								<div class="col-lg-5">
									<input type="text"  id="id_Alumno_apellido" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Nombre</label>
								<div class="col-lg-5">
									<input type="text"id="id_Alumno_nombre"  class="form-control"	readonly="readonly"/>
								</div>
							</div>
							</form>
					</div>
				</div>
				
				
				
				
				<!--  FORMULARIO PRINCIPAL LIBRO -->
				<div class="panel panel-default">
					<div class="panel-heading">LIBRO</div>
						<div class="panel-body">
							<form  class="form-horizontal">
							<div class="form-group">
								<label class="col-lg-3 control-label">Buscar LIBRO</label>
								<div class="col-lg-5">
									<button type="button" id="id_btnLibro" data-toggle='modal' class='btn btn-success' >....</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">TITULO</label>
								<div class="col-lg-5">
									<input type="text" name="nombreLibro" id="id_Libro_nombre" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">AÑO</label>
								<div class="col-lg-3">
									<input type="text" name="ano" id="id_Libro_ano" class="form-control" readonly="readonly"/>
								</div>
							</div>
							  <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
		                                      
													<select class="form-control" id="id_act_estado" name="estado" >
													<!--value=" " : apartir del value sabra que poner en el estado  y 
													cuando envies solo envie el value  -->
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>	
		                                    </div> 	 
							<!--  este dato se pondra manualmente -->					
							<div class="form-group">
								<label class="col-lg-3 control-label" for="id_reg_libro">Fecha de Devolucion</label>
								<div class="col-lg-3">
                           <!-- 	//onkeypress : El onkeypressevento ocurre cuando el usuario presiona una tecla en el teclado. -->
									<input type="date" name="cantidad" id="id_Libro_fec" class="form-control"	placeholder="Fecha Devolucion" required 
									 max="2023-12-30"
								 />
								</div>
							</div>
							</form>
						</div>
				</div>
				
				
				
				
				
			</div>
			
			
			
			
			
			
			
				<!--  FORMULARIO PRINCIPAL DEVOLUCION ESTA ES LA TABLA TEMPORAL
				  forma temporal: significa que esos datos solo estaran mientras esten en sesion , osea esta tabla solo estara mientres el 
				  usuario este logueado , osea es como 1 tabla en mysql pero solo estara aqui abajo
				 -->
			<div class="panel panel-default">
					<div class="panel-heading">DEVOLUCION</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
								<!--  AGREGA EN SESION O MEMORIA osea en forma temporal -->
									<button type="button" id="id_btnAgregar" class="btn btn-primary">AGREGAR</button>
									<!--  cuando registra si lo hace de forma direca en la bd -->
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary">REGISTRA DEVOLUCION</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table" class="table table-striped table-bordered">
										<thead>
											<tr>
											
                               <!-- 		en esta tabla solo estara los datos solo  del libro -->
												<th>ID</th>
												<th>Titulo</th>
												<th>Fecha de devolucion</th>
												<th>Estado</th>
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
			
			
			
			
			
			
			
			
			
			




<!--        -------------------------------------------------------------------------------------------------------------
       MODAL BUSCA ALUMNO 
   El formulario de busqueda de ALUMNO (Modal) -->

  	 <div class="modal fade" id="idBuscaAlumno" >
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
														<input id="id_txtAlumno" class="form-control" name="Alumno" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_Alumno" class="table table-striped table-bordered">
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


			
			
			
			
			
			
			

<!-- ---------------------------------------------------------------------------------------------------------------------
      MODAL BUSCA LIBRO
     El formulario de busqueda de LIBRO (Modal) -->

  	 <div class="modal fade" id="idBuscaLibro" >
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
														<input id="id_txtLibro" class="form-control" name="producto" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_libro" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 45%">Titulo</th>
																<th style="width: 15%">año</th>
																<th style="width: 15%">Estado</th>
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
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
	
	
	
	
	
	
	
	
	
	
</div>


<script type="text/javascript">
	
	
	
	
	
	
	



//-------------------------------------------------------------------  MODAL BUSCA alumno
//muestra modal alumno
//Al pulsar el botón cliente muestra el modal buscaalumno
//#idBuscaCliente : el id del modal 
$("#id_btnAlumno").click(function (){
	$("#idBuscaAlumno").modal("show");
});








//-------------------------------------------------------------------
//MODAL BUSCAlumno
//Al escribir en la caja de texto del alumno del modal
//keyup : cada vez que sueltes la tecla imprime
//este evento es solo cuando escribes y sueltas pero si das click en enter se cierra el modal
$("#id_txtAlumno").keyup( function (e){
	var var_alumno = $("#id_txtAlumno").val(); //el input del modal se agrega en 1 variable
	console.log(">> " + var_alumno);
	
	//limpiar la tabla
	//$("#id_table_cliente tbody").remove();
	
	//Se añade los alumno a la tabla del o de los alumno encontrados
    //el id del servelt         parametro servlet(BUSCAALUMNOSERVELT)
	$.getJSON("buscaAlumno",{"filtro":var_alumno }, function (data){
		agregarAlumno(data);//envia la data al tabla alumno para que muestre
	});
	
});





//--------------------------------------------------------------------------------------------------------------
//METODO AGREGA GRILLA ALUMNO encontrado en el modal buscaAlumno
// una vez encontrado el Alumno lo agregar a la tabla del modal del busca Alumno
//d_table_Alumno : el id de la tabla
function agregarAlumno(lista){
	 $('#id_table_Alumno').DataTable().clear();
	 $('#id_table_Alumno').DataTable().destroy();
	 $('#id_table_Alumno').DataTable({
			data: lista,
			//language: IDIOMA,  => solo ponlo en ciertos navegadores
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
				//las columnas deben ser iguales a la tabla de modal o donde mostraras 
				//los atributos debe ser igual a la clase guia
				{data: "idAlumno",className:'text-center'},
				{data: "nombres",className:'text-center'},
				{data: "apellidos",className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-info btn-sm" onClick="f_seleccione_Alumno(\'' + row.idAlumno + 
							'\',\'' +  row.nombres   + '\',\'' +  row.apellidos  +'\')" >Seleccione</button>';
				},className:'text-center'},
			]                                     
	    });
}








//LUEGO DE SELECCION UN CLIENTE EN LA GRILLA MODAL BUSCA CLIENTE
//Al pulsar selecciona cliente , toda esa data lo cargara en el formulario principal arriba en cliente
function f_seleccione_Alumno(id,nombre,apellido){
	
	//carga los datos en los inputs
	$("#id_Alumno_id").val(id); //este valor no lo vera el usuario , esta arriba en los inputs hidden
	$("#id_Alumno_nombre").val(nombre);
	$("#id_Alumno_apellido").val(apellido);
	
	$("#idBuscaAlumno").modal("hide");//esconde el modal
}








//Se anula el enter , cuando quieres buscar al dar enter , ya sea haber escrito algo o vacio el input no se cerrara el modal
//keyPressed(KeyEvent e): Se ejecuta cuando el usuario presiona una tecla
//"form" :  busca en el form
//enter : tecla su codigo es 13
//keyCode : de la tecla que has oprimido buscara el codigo 
$(document).on("keypress", "form", function(event) { 
    return event.keyCode != 13;
});






























































//============================================================================================================
//AGREGA EL LIBRO EN LA TABLA DEVOLUCION USAMOS EL SERVLETLIBRO, SOLO AGREGA DATOS DE LIBRO LO AGREGA EN SESION(TEMPORAL)
//el id del boton de form principal 
$("#id_btnAgregar").click(function() {
	
	
	//RECIBE LOS VALORES DE FORM PRINCIPAL PERO SOLO LOS DATOS DE PRODUCTO
	var id = $("#id_libro_id").val();//este valor es el id hidden osea no se ve
	var titulo = $("#id_Libro_nombre").val();
	//var ano = $("#id_Libro_ano").val();
	var estado = $("#id_act_estado").val();
	var fecha = $("#id_Libro_fec").val();
	
	
	//verrificamos el estado no este vacio
	if (estado == ''){
		 mostrarMensaje("Ingrese un valor para el estado");
		 return;
	}
	
	
	//fecha actual del sistema
	const date = new Date();
	
	console.log(">> estado " + estado);
	console.log(">> fecha " + fecha);
	console.log(">> comparacion " + (  date  !=     ( Date.parse(fecha))  ) );
	
	
	
	//verificando que la fecha devolucion se mayor a la actual 
	if (   ( Date.parse(fecha))  <   date    &&  date  !=     ( Date.parse(fecha)) ){
		 mostrarMensaje("la fecha de devolucion debe ser mayor a la actual " + date);
		 return;
	}
	
	
	
	  $.ajax({
          type: "POST", //registro en 1 tabla
          url: "devolucion",  //el id del servelt (SERVLETDevolucion)
          
          //llama al metedo agregaSeleccion del metodo principal del servelt crud
          //y envia los parametro con data , los parametros debe ser iguales del servelt
          //"idProducto":id   : idProducto es el parametro y el id es la variable
          data: {"metodo":"agregaSeleccion","idLibro":id,
        	  	 "nombreLibro":titulo, "FechaDevolucion":fecha,"Estado":estado},
        	  	 //desenvolsando data de regreso usando clase guia
          success: function(data){
        	  agregarGrilla(data.datos);//envia el array 
        	  mostrarMensaje(data.mensaje);
        	  limpiar_Libro();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
    });
	
	
	
    
});
//============================================================================================================


	
	
	
		
		
		//============================================================================================================
	//METODO AGREGA O ELIMINA LIBRO EN LA GRILLA	DE SESION OSE SOLO TEMPORAL EN RAM
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
					//atributos de la clase guia , desenvolsando la data recibida solo lo queremos
					{data: "idLibro",className:'text-center'},
					{data: "titulo",className:'text-center'},
					{data: "fechaFormateada",className:'text-center'},
					{data: function(row, type, val, meta){
						return row.estado == 1 ? "Activo" : "Inactivo";  
					},className:'text-center'},
					//crea1 botn para cada fila para eliminar en sesion ese objeto
					{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-danger btn-sm"  onClick="f_elimina_seleccion(\'' + row.idLibro +'\');" >Eliminar</button>';
					},className:'text-center'},
				]                                     
		    });
	}
	//============================================================================================================
	
	
	
	
	

	//============================================================================================================
    //METODO ELIMINA SELECCION DE LA GRILLA EN SESION PERO DE SOLO LIBRO , ES EN LA TABLA TEMPORAL
	//Al pulsar el botón eliminar
	function f_elimina_seleccion(id){	
		$.ajax({
	          type: "POST", //envio ya sea registra o elimina
	          url: "Devolucion",  //el id del servlet (SERVLETBOLETA)
		    //       redirecciopna del metodo elige al eliminaSeleccion
	          data: {"metodo":"eliminaSeleccion","id":id},
	          success: function(data){
	        	  agregarGrilla(data.datos);//vuelve a listar
	        	  mostrarMensaje(data.mensaje);
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	    });

	}
	//============================================================================================================
	
	
	
		
		
		
    	//============================================================================================================
       //REGISTRA DEVOLUCION , este metodo esta relacionado con otra tablas osea registra , con el id del usuario en sesion 
       //y en la tabla el id del alumno (osea solo toma el id )
	//OJO RECORDAR QUE PARA ENVIAR TIENES QE ESTAR EN TIEMPO DE SESION OSE LOGUEDAO HAY UN LIMITE POR SE ACA REGISTRAR VARIOS PRODUCTOS
       
       //el id el botonr registrar
	$("#id_btnRegistrar").click(function() {
		//enviaremos solo el id
		var id = $("#id_Alumno_id").val();
		
		
		
		$.ajax({
	          type: "POST", //metodo de envio
	          url: "devolucion", //id el servelt
	          
	          data: {"metodo" : "registraDevolucion" , "idAlumno":id 
	        	},
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
	//============================================================================================================
	
	
	
	
	
	
	
	
	



	//SIRVE PARA LIMPIAR FORM LIBRO PRINCIPAL producto 
		function limpiar_Libro(){
			$("#id_libro_id").val("");
			$("#id_Libro_nombre").val("");
			$("#id_Libro_ano").val("");
			$("#id_act_estado").val("");		
			$("#id_Libro_fec").val("");
		}




	
	
		function limpiar_todo(){
			$("#id_Alumno_id").val("");
			$("#id_libro_id").val("");
			$("#id_Alumno_apellido").val("");
			$("#id_Alumno_nombre").val("");
			$("#id_Libro_nombre").val("");
			$("#id_Libro_ano").val("");
			$("#id_act_estado").val("");
			$("#id_Libro_fec").val("");
		}

































	
	
	
	
	
	
	
	
	
	










































//-----------------------------------------------------------------------MODAL BUSCA LIBRO ---------------------------



//al pulsar el boton muestra el modal busca libro
//Al pulsar el botón libro

//id del boton formulario principal libro
$("#id_btnLibro").click(function (){ 
	
	//id del modal
	$("#idBuscaLibro").modal("show");
});








//METODO BUSCA EL PRODUCTO Y LLAMA AL METODO GRILLA

//Al escribir en la caja de texto del producto(su id) del modal 
$("#id_txtLibro").keyup( function (e){
	var var_libro = $("#id_txtLibro").val(); //guada en variable
	console.log(">> " + var_libro);
	
	//limpiar la tabla su id
	//$("#id_table_producto tbody").remove();
	
	//Se añade los clientes a la tabla
	//el id del servelt         parametro servlet  BUSCALIBROSERLVET
	$.getJSON("buscaLibro",{"filtro":var_libro}, function (data){
		agregarLibro(data);	
	});
	
});









//--------------------------------------------------------------------------------------------------------------
//METODO AGREGA A LA GRILLA OSEA A LA TABLA DEL MODAL BUSCA LIBRO


// id_table_libro : es el id de la tabla dentro del modal

function agregarLibro(lista){
	 $('#id_table_libro').DataTable().clear();
	 $('#id_table_libro').DataTable().destroy();
	 $('#id_table_libro').DataTable({
			data: lista,
			//language: IDIOMA,
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
				//esto es para ver mejor el estado
				{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo":"inactivo";
				},className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" class="btn btn-info btn-sm" onClick="f_seleccione_libro(\'' + row.idLibro + '\',\''
							+  row.titulo   + '\',\'' +  row.anio + '\',\'' +  row.estado  +'\')" >Seleccione</button>';
				},className:'text-center'},
			]                                     
	    });
 }










//CARGA LOS DATOS ENCONTRADO EN EL FORM PRINCIPAL LIBRO 
//Al pulsar selecciona producto
function f_seleccione_libro(id,nombre,anio,estado){
	
	//agrega a los inputs
	$("#id_libro_id").val(id);//este valor no lo vera el usuario , esta arriba en los inputs hidden
	$("#id_Libro_nombre").val(nombre);
	$("#id_Libro_ano").val(anio);
	$("#id_act_estado").val(estado);
	
	//esconde el modal
	$("#idBuscaLibro").modal("hide");
}



























































</script>


</body>
</html>



