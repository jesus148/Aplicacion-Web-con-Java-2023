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

<link href="https://fonts.googleapis.com/css2?family=Agdasima&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Roboto:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Lato:wght@100&family=Roboto:wght@100&display=swap" rel="stylesheet">


<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">



<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>


<link rel="stylesheet" href="css/CrudSalas.css"/>


<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />


<br>





<div class="container contenedor" style="margin-top: 4%">


<h1>Crud Sala</h1>





		<div class="row principal" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label h4" for="id_filtro">Número De Sala</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el numero de sala">
			</div>	
			<div class="col-md-1">
			<!--  	//1 METODO METODO LISTA POR CLINETE POR PALABRA -->
				<button type="button" class="btn btn btn-success boton" id="id_btn_filtro">Filtro</button>
			</div>	
			
				<div class="col-md-1">
				<!--  METODO LISTA REGISTRA CLIENTE USA LA VENTA MODAL DE REGISTRA CLIENTE
				   data-toggle='modal' data-target="#id_div_modal_registra" : llama al model a traves su id
				   solamente debes poner eso y con eso abrira el modal desde este boton
				-->
				<button type="button" class="btn btn btn-success boton" data-toggle='modal' data-target="#id_div_modal_registra" >Registra</button>
			</div>	
		</div>
		
		
		
		<!-- MOSTRANDO DATA DE SALA LISTADO  SALA + SEDE(NOMBRE) solo los datos q queremos-->
		
				<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#277523; color:white'>
					<tr>
					<!--  esto son los nombre de las columnas -->
						<th>Código</th>
						<th>Número</th>
						<th>Piso</th>
						<th>Alumnos</th>
						<th>Recursos</th>
						<th>Estado</th>
						<th>Sede</th>
						<th></th>   <!-- estacolumna ira un boton con el metodo de la grilla editar -->
						<th></th>   <!-- estacolumna ira un boton con el metodo de la grilla activo modifica estado -->
						<th></th>   <!-- estacolumna ira un boton con el elimina de la grilla -->
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		
		
</div>
		
		
		
		
		
		
		
		
		
		
		
		<!--   METODOS MODALES
		Una ventana modal o modal box es un recuadro que aparece sobre la página, con la particularidad de que bloquea todas las funciones
		 y concentra el foco en una acción particular, de modo que el usuario solamente puede hacer esa acción o cerrar la ventana. 
		 osea un modal es una ventana como un alert q aparece sobre lo pagina 
		 -->
		 
		 
		 
		 
		 <!-- INICIO MODAL DE REGISTRO  CLIENTE
		 este metodo servira para registrar cliente
		 id="id_div_modal_registra": es el id q tiene q ser llamado en el boton de arriba en el form (el boton registra)del  debe ser igual
		 recordar : que los name de los inputs deben ser igual el metodo lista cliente del  > crudclienteservelt
		 
		 --> 
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Sala</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   		
			                   		
			                   		<!--  este el id del form  escirbir igual que debe usarse al enviar en el POST > METODO INSERTA EN EL SCRIPT  -->
			                   			<form  id="id_form_registra">
			                   			
			                   			
			                   			
			                   			<!-- IMPORTANTE   ENLAZA AL CRUDCLIENTESERVLET Y ELIGE EL METODO FORMA MAS FACIL-->
			                   			<!-- 		<input type="hidden" name="metodo" value="inserta">
			                   			   aca LLAMA AL crudclienteserletv > entra al metodo service primero
			                   			   luego elige el parametro "metodo" que es inserta y con eso inserta todo esta data
			                   			   osea toda esta data se lo envia al sevlet para insertar
			                   			    name="metodo"  : Esto es parametro del metodo service de crudclienteservelt
			                   			     value="inserta": le enviamos el metodo q queremos q es inserta 
			                   			 -->
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_numero">Número</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_numero" name="numero" placeholder="Ingrese el numero" type="text" />
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_piso" name="piso" placeholder="Ingrese el piso" type="text" />
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_numAlu">Número de Alumnos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_numAlu" name="numAlu" placeholder="Ingrese el numero alumnos" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_recur">Recursos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_recur" name="recursos" placeholder="Ingrese el recurso" type="text" />
		                                        </div>
		                                    </div>	
		                                  
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_sede">Sede</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_sede" name="sede">
													<!--  recordar q aca en el combo se envia el value"" -->
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        <!-- id="id_btn_registra" este id es para llamar al metodo post y ejecutar el metodo pa enviar o insertar
		                                        lo usamos METODO MODAL INSERTA CLIENTE EN EL  SCRIPT  -->
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registrar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
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
		<!-- FIN MODAL DE REGISTRO cliente-->
		
		
		
		
		
		
		
		
		
<!-- 		======================================================================== -->
		<!-- INICIO MODAL DE ACTUALIZA o EDITAR CLIENTE
		este servira para actualizar los datos ya existenten en la tabla cliente
		
		id="id_div_modal_actualiza" : es el id q ese le tien q llamar pa mostrar este modal escirbir igual
		
		EXPLICACION : la idea es q cuando seleccionemeos 1 fila en la tabla toda la data de cliente de esa fila debe cargarse en esta ventana
		 modal sobre todo al hacer clcik en el boton editar , recordar q la data lo cargamos en los inputs
		 -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Sala</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   		
			                   		<!-- este es el id form q debe enviar al registrarse usa en scrip metodo actuliza abajo
			                   		escribir igual -->
			                   			<form id="id_form_actualiza">
			                   			
			                   				
			                   			<!-- IMPORTANTE   ENLAZA AL CRUDCLIENTESERVLET Y ELIGE EL METODO FORMA MAS FACIL-->
			                   			<!-- 		<input type="hidden"  name="metodo" value="actualiza">
			                   			   aca LLAMA AL crudclienteserletv > entra al metodo service primero
			                   			   luego elige el parametro "metodo" que es actuliza y con eso actuliza cliente
			                   			   osea toda esta data se lo envia al sevlet para q lo actualize
			                   			    name="metodo"  : Esto es parametro del metodo service de crudclienteservelt 
			                   			     value="actualiza": le enviamos el metodo q queremos q es actualiza
			                   			 -->
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idSala" id="idSala" > <!--  aca se pone el id cuando se carga no se mostrara -->
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_numero">Número</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_numero" name="numero" placeholder="Ingrese el numero de sala" type="text"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_piso" name="piso" placeholder="Ingrese el numero de piso" type="text" />
		                                        </div>
		                                    </div> 
		                                    	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_numAlum">Número de Alumnos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_numAlum" name="numAlum" placeholder="Ingrese el numero de alumnos" type="text" maxlength="2"/>
		                                        </div>
		                                    </div> 	
		                                    	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_recursos" name="recursos" placeholder="Ingrese recursos" type="text" />
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
		                                        <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_sede" name="sede">
											
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualizar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		












	


<script type="text/javascript">





//1 METODO
//METODO SOLO PARA LISTAR CLIENTE POR PALABRA EN LA TABLA

	$("#id_btn_filtro").click(function() {
		//variable o dato del input o palabra clave pra listar
		var vfiltro = $("#id_filtro").val();
		
		//llama al sevlet
		//del metodo defrente elige lista 
		
		//ELIGIENDO EL METODO EN EL METODO SERVICE(SWITCH)
		//"metodo":"lista"  : primero eligiendo el metodo q queremos q es listar  
		//recordar q "metodo" es el parametro debe ser igua en el que en el servlet
		
		//EJECUTANDO EL METODO Q QUEREMOS Y PASANDO SU PARAMETRO
		//una vez ya elegido el metodo , ese metodo requiere un parametro
		// "filtro":vfiltro :  "filtro" es el parametro y debe ser igual al servlet
		
		
		//function(data) : es la data obtenida osea todo lo encontrado de cliente y eso se envia al metodo agregargrila
		$.getJSON("crudSala", {"metodo":"lista","filtro":vfiltro}, function(data) {
			agregarGrilla(data);
		});
	});
	
//desembolsa la data obtenida de todo cliente
	function agregarGrilla(lista){
		 $('#id_table').DataTable().clear();
		 $('#id_table').DataTable().destroy();
		 $('#id_table').DataTable({
				data: lista,
				searching: true,
				ordering: true,
				processing: true,
				pageLength: 10,
				lengthChange: true,
				info:true,
				scrollY: 305,
		        scroller: {
		            loadingIndicator: true
		        },
		        //LISTA LA TABLA SALA + SEDE(NOMBRE)
		        //colocando la data en la taba , debe ser igual a la clase guia
		        //colocamos en q lugar estara y tambien los datos q queremos
		        //desembolsando la data segun las filas q tenga
		        //de manera ordenada segun las columnas de tu tabla>thead
				columns:[
					{data: "idSala",className:'text-center'},
					{data: "numero",className:'text-center'},
					{data: "piso",className:'text-center'},
					{data: "numAlumnos",className:'text-center'},
					{data: "recursos",className:'text-center'},
					//este metodo pero ver mejor esta para q lo ve el usuario
					{data: function(row, type, val, meta){
						return row.estado == 1 ? "activo":"inactivo";
					},className:'text-center'},
					{data: "sede.nombre",className:'text-center'},
					
		
					//AGREGANDO BOTONES POR CADA FILA
					//columna vacia de la tabla se coloca un boton  para cada fila y en cada columna para hacer el crud
					// btn-sm : es el tamaño del boton
					//este creal el boton para actulizar o editar la tabla cliente
					//el row tiene toda la data cargada por filas
					{data: function( row,type,val,meta){
						//MUESTRA MODAL EDITA O ACTUALIZA CLIENTE
					// al hacer clcik en este boton llama al metodo muestra modal actuliza cliente y le envia el id cliente de la fila y demas data correspondiente 
					//o del objeto cliente correspondiente recordar este boton mmuestra el modal acutliza o edita cliente
					//row.idCliente : es un dato dinamico
					//enviando todos los datos de los inpunts al metodo , el row tiene toda la data cargadas por fila , recomendable hacer en orden segun el mysql
					//le enviamos para q se muestra la data cargada en la vetana modal en sus inputs edita o registra , los atributos deben ser igual a la clase guia
						return '<button type="button" class="btn btn-success btn-sm" onClick="verFormularioActualiza(\'' + row.idSala + '\',\'' + row.numero + '\',\'' + row.piso  + '\',\'' + row.numAlumnos + '\',\'' + row.recursos + '\',\''  + row.estado + '\',\'' +     row.sede.idSede + '\');">Editar</button>';
					},className:'text-center'},
					//ELIMINACION LOGICA ES EL CAMBIO DE ESTADO(osea cambia de activo a inactivo.etc)
					//esto es para CAMBIAR EL ESTADO ACTIVO ETC
					// al hacer click ejecuta 1 funcion y le envia el id de cliente de esa fila al metodo
					{data: function( row,type,val,meta){
						return '<button type="button" class="btn btn-success btn-sm" onClick="eliminacionlogica(\'' + row.idSala + '\');">E.Logica</button>';
					},className:'text-center'},
					//ESTE METODO EJECUTA METODO ELIMINACION FISICA CLIENTE DEL SCRIPT(+ ABAJO)
					//esto es para eliminar un objeto de la tabla
					// onClick="eliminacionfisica : metodo y le enviamos su parametro
					{data: function( row,type,val,meta){
						return '<button type="button" class="btn btn-success btn-sm"  onClick="eliminacionFisica(\'' + row.idSala + '\');">E.Fisica</button>';
					},className:'text-center'}
				
				]                                     
		    });
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//METODO MOSTRAR EL MODAL ACTULIZA CLIENTE, CARGAMOS O AUTOCOMPLETAMOS LA DATA EN LOS INPUTS DEL MODAL ACTULIZAR
	//este metodo es llamado en la grilla
	//ESTE METODO MOSTRARA EL MODAL ACTULIZA CLIENTE AL HACER CLICK EN EL BOTON DE LA TABLA en el boton EDITAR
	//muestra el modal registrar o acualizar y recibe el id del parametro
	//	id="id_div_modal_actualiza" : es el id del modal regista cliente q ese le tien q llamar pa mostrar este modal escirbir igual
	function verFormularioActualiza(idSala,numero, piso ,numAlumnos , recursos ,estado, idSede){
		
		//EXPLICACION : la idea es q cuando seleccionemeos 1 fila en la tabla toda la data de cliente de esa fila debe cargarse en esta ventana
		// modal sobre todo al hacer clcik en el boton editar 
		//estos datos se agregaran en la ventana modal editar o actulizar en sus inputs
		console.log(">> verFormularioActualiza >> " + idSala);
		$("#id_div_modal_actualiza").modal("show");
		//aca se usan los solo los id aca pegamos los valores de la data encontrada en los inputs de modal
		$("#idSala").val(idSala);// este se pondra en el input hiden no debe verse
		$("#id_act_numero").val(numero);
		$("#id_act_piso").val(piso);
		$("#id_act_numAlum").val(numAlumnos);
		$("#id_act_recursos").val(recursos);
		$("#id_act_estado").val(estado);
		$("#id_act_sede").val(idSede);
		
	}
	//METODO PARA ACTULIZAR CLIENTE UNA VEZ YA CARGADO LOS DATOS EN EL MODAL Y MODIFICADOS POR EL USUARIO SEA EL CASO
	//al dar un click en boton registra del modal se ejecuta esto , poner el id igual
	//no es nescario redirigir al metodo en el servelt eso lo hacemos en el form del modal registra ahi mismo
	$("#id_btn_actualiza").click(function() {
		
		var validator = $('#id_form_actualiza').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
			
			   $.ajax({
			          type: "POST", //post es enviar , aveces tambien ese usa pa actulizar o eliminar
			          url: "crudSala",  //llama id del servlet
			          //el id del formulario debe ser igual al id del form del modal edita cliente
			          data: $('#id_form_actualiza').serialize(), //le enviamos toda la data del form de los inputs
			          
			          //function(data) en este caso tiene todo los datos de regreso del servlet 
			          //en este caso la clase respuesta q tiene el mensaje y array con toda la data cliente para volver a listar
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  //LISTA DE NUEVO TODO CLIENTE PARA YA NO VOLVER A DAR CLICK EN FILTRAR
			        		agregarGrilla(data.datos);//se lo envia a la grilla y vuelve a listar
			        		  validator.resetForm();
				        	  $('#id_div_modal_actualiza').modal("hide");
			        
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			        });
			
			
			
	    }	
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	//ESTE METODO CARGAR LOS COMBOS CATEGORIAS DE LAS VENTANAS MODALES(REGISTRA SALA Y ACTULIZA SALA)

	$.getJSON("cargSede",{}, function (data){
		//index es la posicion del elemento 
		//item es el valor del objeto
		$.each(data, function(index, item){
			$("#id_reg_sede").append("<option value='"+ item.idSede +"'>"+ item.nombre+"</option>");
			$("#id_act_sede").append("<option value='"+ item.idSede +"'>"+ item.nombre+"</option>");
		})
	});
	
	
	
	
	
	

	
	
	//METODO INSERTA O REGISTRAR CLIENTE DESDE EL MODAL REGISTRA CLIENTE
	
	//al dar un click en boton registra del modal se ejecuta esto , poner el id igual
	//no es nescario redirigir al metodo en el servelt eso lo hacemos en el form del modal registra
		$("#id_btn_registra").click(function() {
		
			
			//llama al validator 
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    
		    //ojo se usa un if para ver si todo esta validad ok
		    if (validator.isValid()) {
			   $.ajax({
			          type: "POST", //post es enviar
			          url: "crudSala",  //llama id del servlet
			          //el id del formulario debe ser igual al id del form del modal regista cliente
			          data: $('#id_form_registra').serialize(),  //le enviamos toda la data del form de los inputs
			          
			          //function(data) en este caso tiene todo los datos de regreso del servlet 
			          //en este caso la clase respuesta q tiene el mensaje y array con toda la data cliente para volver a listar
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  //LISTA DE NUEVO TODO CLIENTE PARA YA NO VOLVER A DAR CLICK EN FILTRAR
			        		agregarGrilla(data.datos);//se lo envia a la grilla y vuelve a listar
			        		 validator.resetForm();
				        	  $('#id_div_modal_registra').modal("hide");
			        
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			        });
			
		
		    }	
	});
	
	
	
	
	
	
	
	
	

		
		
		
		//METODO PARA ELIMINAR FISICA TODO
		//reicbe el idEmpleado 
		function eliminacionFisica(idSala){	
			var array = [idSala];//esto es un array de 1 objeto tiene el idEmpleado	
			//este mensaje te preguntara si quieres eliminar
			//esto esta en main>webapp>js>global.js
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);//llama al metodo de abajo y le envia el array
		}
		//accionEliminacionFisica este metodo es llamado arriba
		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudSala", 
		          data: {"metodo":"eFisica", "idSala":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
	
	
		
		
		


		
		//METODO ELIMINACION LOGICA DE  CLIENTE (es el cambio de estado de activo a inactivo)
	//recibe el parametro de idcliente pq primero
	//buscar , luego actulizara y luego lista de nuevo
	function eliminacionlogica(idSala){
			
			//recordar q el post no solamente sirve pa enviar , sino aveces tambien para eliminar registros
			
		
		   $.ajax({
		          type: "POST", //post es enviar
		          url: "crudSala",  //llama id del servlet
		          //"metodo":"eFisica" : elegimos el metodo en el metodo ofical service del servelt(debe ser igual)
		          //"idCliente":idcliente : luego envimaos el parametro q nesecita el metodo eliminar(idcliente es el parametro de este function)
		          data: {"metodo":"eLogica", "idSala":idSala}, 
		          
		          //function(data) en este caso tiene todo los datos de regreso del servlet 
		          //en este caso la clase respuesta q tiene el mensaje y array con toda la data cliente para volver a listar
		          success: function(data){
		        
		        	  //LISTA DE NUEVO TODO CLIENTE PARA YA NO VOLVER A DAR CLICK EN FILTRAR
		        		agregarGrilla(data.datos);//se lo envia a la grilla y vuelve a listar
		        
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		        });
		
			
			
			
	}
		
		
		
		
		
	
	
	
		
	
	
	//==================================================================================================
	//VALIDACIONES
	//MODAL INSERTA
	$(document).ready(function() {
	    $('#id_form_registra').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        
	        
	        
	        
	        fields:{
	        	
	        	
	        	numero : {  
	        		selector: "#id_reg_numero",
	        		validators : {
	        			notEmpty: {
	                        message: 'El nombre es requerido'
	                    },
	                    stringLength: {
	                        min: 3,
	                        max: 30,
	                        message: 'El numero tiene de 3 a 30 caracteres'
	                    },
	        		}
	        	},
	        	
	        	
	        	piso : {  
	        		selector: "#id_reg_piso",
	        		  validators: {
	        				notEmpty: {
		                        message: 'El piso es requerido'
		                    },
		                    lessThan: {
		                        value: 30,
		                        inclusive: true,
		                        message: 'el piso menor debe ser menor que 30'
		                    },
		                    greaterThan: {
		                        value: 0,
		                        inclusive: false,
		                        message: 'el piso mayor que 0'
		                    }
		                }
	        	},
	        	
	        	
	        	
	         	
	        	numAlu : {  
	        		selector: "#id_reg_numAlu",
	        		 validators: {
	        				notEmpty: {
		                        message: 'El numero de alumnos es requerido'
		                    },
		                    lessThan: {
		                        value: 50,
		                        inclusive: true,
		                        message: 'el numero alumnos debe ser menor que 50 '
		                    },
		                    greaterThan: {
		                        value: 0,
		                        inclusive: false,
		                        message: 'el numero de alumnos debe ser mayor que 0'
		                    }
		                }
	        	},
	        	
	        	
	        	
	        	
	        	recursos : {  
	        		selector: "#id_reg_recur",
	        		validators : {
	        			notEmpty: {
	                        message: 'los recursos son requeridos '
	                    },
	        		}
	        	},
	        	
	        	
	        	
	        	
	        	
	        	
	        	
	        	sede : {  
	        		selector: "#id_reg_sede",
	        		validators : {
	        			notEmpty: {
	                        message: 'la sede es requerida '
	                    },
	        		}
	        	},
	        	
	        	
	        	
	        	
	        	
	        	
	        }
	    });
	});
	
		








	
	
	
	
	
	
	

	//MODAL ACTUALIZA
	$(document).ready(function() {
	    $('#id_form_actualiza').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        
	        fields:{
	        	
	        	
	        	numero : {  
	        		selector: "#id_act_numero",
	        		validators : {
	        			notEmpty: {
	                        message: 'El numero es requerido'
	                    },
	                    stringLength: {
	                        min: 3,
	                        max: 30,
	                        message: 'El numero tiene de 3 a 30 caracteres'
	                    },
	                    
	                    
	        		}
	        	},
	        	
	        	
	            piso: {
	            	selector: "#id_act_piso",
	                validators: {
	                	notEmpty: {
	                        message: 'El numero es requerido'
	                    },
	                    lessThan: {
	                        value: 30,
	                        inclusive: true,
	                        message: 'el piso menor debe ser menor que 30'
	                    },
	                    greaterThan: {
	                        value: 0,
	                        inclusive: false,
	                        message: 'el piso mayor que 0'
	                    }
	                }
	            },
	            
	            
	            
	            
	            numAlum: {
	            	selector: "#id_act_numAlum",
	                validators: {
	                	notEmpty: {
	                        message: 'El numero es requerido'
	                    },
	                    lessThan: {
	                        value: 50,
	                        inclusive: true,
	                        message: 'el numero alumnos debe ser menor que 50 '
	                    },
	                    greaterThan: {
	                        value: 0,
	                        inclusive: false,
	                        message: 'el numero de alumnos debe ser mayor que 0'
	                    }
	                }
	            
	            },
	            
	            
	            
	            
	            
	            recursos : {
	        		selector: "#id_act_recursos",
	        		validators : {
	        			notEmpty: {
	                        message: 'los recursos son requeridos '
	                    },
	        		}
	        	},
	        	
	        	
	        	
	        	
	        	
	        	estado : {
	        		selector: "#id_act_estado",
	        		validators : {
	        			notEmpty: {
	                        message: 'el estado es requerido'
	                    },
	        		}
	        	
	        	},
	        	
	        	
	        	
	        	
	        	
	        	
	        	sede : {
	        		selector: "#id_act_sede",
	        		validators : {
	        			notEmpty: {
	                        message: 'la sede es requerida'
	                    },
	        		}
	        	},     

	        	
	        	
	        	
	        	
	        }
	    });
	});






		
		
		
		
		









</script>






</body>
</html>



