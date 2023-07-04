<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">



<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Lato:wght@100&family=Roboto:wght@100&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Lato:wght@100&family=Roboto:ital,wght@0,100;1,400&display=swap" rel="stylesheet">




<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>




<link rel="stylesheet" href="css/ConsultaSala.css"/>




<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />




<div class="container-fluid  todo">   

<div class="container contenedor" style="margin-top: 4%">





<h1>Consulta Sala</h1>







		
			<!-- INPUT NOMBRE sala -->
		<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
					<label class=" azul" for="id_nombreSala">Nombre Sala</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_nombreSala">
				</div>
		</div>
		
		
		
		
					<!-- INPUT piso sala -->
		<div class="row" style="margin-top: 2%">
				<div class="col-md-4">
					<label class="control-label" for="id_pisoSala">Piso Sala</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_pisoSala" maxlength="2">
				</div>
		</div>
		
		
		
		
		
					<!-- INPUT recursos sala -->
		<div class="row" style="margin-top: 2%">
				<div class="col-md-4">
					<label class="control-label" for="id_recursoSala">Recursos Sala</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_recursoSala">
				</div>
		</div>
		
		
		
		
				
				
				
		<!--  INPUT ESTADO -->
		<div class="row" style="margin-top: 2%">
				<div class="col-md-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-md-5">
					<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
				</div>
		</div>

		
		
		
		
		
		
		
		
		
		<!--INPUT  PAIS -->
		<div class="row" style="margin-top: 2%">
				<div class="col-md-3">
					<label class="control-label" for="id_sede">Sede</label>
				</div>
					<div class="col-md-1"></div>	
				<div class="col-md-5 oneCombo">
					<select	class="form-control combo" id="id_sede">
						<option value="-1">[Seleccione]</option>
					</select>
				</div>
					<div class="col-md-1"></div>	
					<div class="col-md-1">
			
				<!--  BOTON PARA ENVIAR EL FORM
				id="id_btn_filtro" se usa para listar en el metodo
				 -->
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>
		
		
		
		
		
		
		
		

 
 
     <!--  TABLA DONDE SE LISTARA EMPLEADO  + PAIS(NOMBRE) -->

		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Número</th>
						<th>Piso</th>
						<th>Alumnos</th>
						<th>Recursos</th>
						<th>Estado</th>
						<th>Sede</th>
						<!--  aca se pondra el boton -->
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!--  METODO MOSTRARA INFORMACION O DATA SOBRE 1 OBEJTO EMPLEADO O SOBRE 1 FILA 
		ADEMAS este modal solo sera para ver no podra modificar los inputs solo lectura
		-->
		<!-- INICIO MODAL DE DETALLE
		id="id_div_ver_detalle": este id se usa para llamarlo pa que se muestre
		 -->
		<div class="modal fade" id="id_div_modal_detalle" >
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
		                                          <!--   readonly="readonly" : solo lectura  -->
													<input class="form-control" id="id_act_numero" name="numero" placeholder="Ingrese el numero de sala"
													 type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_piso" name="piso" placeholder="Ingrese el numero de piso" 
													type="text" readonly="readonly" />
		                                        </div>
		                                    </div> 
		                                    	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_numAlum">Número de Alumnos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_numAlum" name="numAlum" placeholder="Ingrese el numero de alumnos" 
													type="text" maxlength="2" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_recursos" name="recursos" placeholder="Ingrese recursos" type="text"
													readonly="readonly" />
		                                        </div>
		                                    </div> 	
		                                   <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
		                                        <!-- disabled="disabled" : estara desabailitado este combo solo sera lectura -->
													<select class="form-control" id="id_act_estado" name="estado" disabled="disabled">
													<!--value=" " : apartir del value sabra que poner en el estado   -->
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>	
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_sede" name="sede" disabled="disabled">
											
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	 <!-- data-dismiss="modal" : para cerrar el modal data-dismiss="modal" -->
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


	
</div>





</div>




	<script type="text/javascript">




	
	
	

	
	// CARGA EL COMBO ESTE METODO SE EJECUTA LA INICIAR LA APLCIACION WEB 
	//cargar los combos de pais y tambien carga el combo de del modal detalle
	$.getJSON("cargSede",{}, function (data){
		//index es la posicion del elemento 
		//item es el valor del objeto
		$.each(data, function(index, item){
			$("#id_sede").append("<option value='"+ item.idSede +"'>"+ item.nombre+"</option>");
			$("#id_act_sede").append("<option value='"+ item.idSede +"'>"+ item.nombre+"</option>");
		})
	});
	



	
	
	
	
	
	
	
	
	
	
	

	
	// METODO INICIA AL DAR CLICK EN EL BOTON ENVIAR DEL FORM
	//METODO LISTAEMPLEADOCOMPLEJO 
		$("#id_btn_filtro").click(function() {
			
			//recibe la data de los input del form arriba
			var vnombre = $("#id_nombreSala").val();
			var vpisoSala = $("#id_pisoSala").val();
			var vrecursoSala = $("#id_recursoSala").val();
			var vsede = $("#id_sede").val();
			var vestado = $("#id_estado").is(":checked") ?  1 : 0;// marca vale 1 y sin marcar vale 0
			
			
			
			
			
			
			
			//muestra mensaje osea los valores de los inputs en consola
			console.log(">> vnombre >> " + vnombre);
			console.log(">> vpisoSala >> " + vpisoSala);
			console.log(">> vrecursoSala >> " + vrecursoSala);
			console.log(">> vsede >> " + vsede);		
			console.log(">> vestado >> " + vestado);
			
			
	
			
			
				
				
			//llama al id servlet listaSalaComplejo
			//escribir igual
			//"nombre":vnombre   => nombre es el parametro del servlet y vnombre es la variable arriba almacena la data del input 
			$.getJSON("listaSalaComplejo", {"numero":vnombre,"piso":vpisoSala, "recursos": vrecursoSala, "estado":vestado,
				"sede":vsede}, function(data) {
				
				//recibe la data del serlvet y llama a otro metodo para listar en la tabla con esa data
				agregarGrilla(data);
			});
			
			
			
		});
		
		
	
	
	
	
	
	
	
	
	
	
	
		
		//METODO AGREGA GRILLA EN LA LISTA LISTARA EMPLEADO  + PAIS(NOMBRE)
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,//este es el parametro obtenido agregarGrilla(lista){
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
						   //estos atributos deben ser iguales a la clase guia
						//la data debe ser igual a la clase guia
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
						//metodo agrega un boton para fila para ver el objeto de esa fila
						{data: function(row, type, val, meta){
							//FORMULARIO OSEA VER MEJOR LA DATA DE 1 OBJETO O 1 FILA ADEMAS MUESTRA EL MODAL detalle CARGADO CON LA DATA
							//row.estado  : envio un numero 
							//row.pais.idPais : envio el numnero de idpais
							//recordar el metodo debe ser igual
							return '<button type="button" class="btn btn-success btn-sm" onClick="verFormulario(\'' + row.numero + '\',\'' + row.piso  + '\',\'' + row.numAlumnos + '\',\'' + row.recursos + '\',\''  + row.estado + '\',\'' +     row.sede.idSede + '\');">Ver</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
	
	
	
			 
			 
			 
			 

		
		//METODO PARA VER MEJOR EL FORMULARIO OSEA VER MEJOR LA DATA DE 1 OBJETO O 1 FILA
		//este metodo se ejcuta al dar click en el boton de la tabla 
		//ademas este metodo muestra el modal DETALLE para mostrar la data
		//estos parametros (nombre, fecha, estado, pais) pueden ser diferentes, ademas aca se recibe la data de esa fila u objeto
		function verFormulario(numero , piso, numAlum, recursos , estado , sede){

			
			//esto muestra en la consola los valores pasados 
			console.log(">> verFormulario >> ");
			console.log(">> nombre >> " + numero);
			console.log(">> fecha >> " + piso);
			console.log(">> numAlum >> " + numAlum);
			console.log(">> pais >> " + recursos);
			console.log(">> estado >> " + estado);
			console.log(">> pais >> " + sede);
			
			
			
			

			//poniendo la data obtenida  en los inputs para mostrar o cargando esa data en el modal detalle en sus inputs
			//$("#id_act_nombre") : id de los inputs del modal detalle deben ser iguales 
			//val(nombre): parametros arriba verFormulario(nombre, fecha, estado, pais)
			$("#id_act_numero").val(numero);
			$("#id_act_piso").val(piso);
			
			$("#id_act_numAlum").val(numAlum);
			$("#id_act_recursos").val(recursos);
			$("#id_act_estado").val(estado);
			$("#id_act_sede").val(sede);
			

			
			
			
			
			//metodo muestra el modal el id_div_ver_detalle debe ser igual al form
			$("#id_div_modal_detalle").modal("show");

			
			
		

		}
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	






	</script>
















</body>
</html>



