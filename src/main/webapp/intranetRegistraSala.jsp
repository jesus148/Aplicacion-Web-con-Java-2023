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
<script type="text/javascript" src="js/global.js"></script> <!-- para mostrar mensaje al enviar o insertar el form desde el jsp -->


<link href="https://fonts.googleapis.com/css2?family=Agdasima&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Roboto:wght@100&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<link rel="stylesheet" href="css/sala.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />




<div class="container-fluid  todo ">  
<br>
<br>
<br>

<div class="container ">


<h1>Registrar Sala</h1>

	<form action="registraAlumno" id="id_form" class=" formulario"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
		    <label class="control-label primero" for="id_sala">Numero de Sala</label> 
				<input class="form-control" type="text" id="id_sala" name="Sala" placeholder="Ingrese numero de sala">
			</div>
			<div class="form-group">
				<label class="control-label segundo" for="id_Piso">Piso</label>
				<input class="form-control" type="text" id="id_Piso" name="piso" placeholder="Ingrese el piso">
			</div>
			<div class="form-group">
				<label class="control-label segundo" for="id_numalumnos">Número de Alumnos</label>
				<input class="form-control" type="text" id="id_numalumnos" name="numalumnos" placeholder="Ingrese numeros de alumnos">
			</div>
			<div class="form-group">
				<label class="control-label segundo" for="id_recursos">Recursos</label>
				<input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingrese recursos">
			</div>			
			
			<div class="form-group">
				<label class="control-label segundo" for="id_sede"> Sede </label> <select
					class="form-control combo" id="id_sede" name="sede">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary boton" id="id_btn_registra">Registrar Sala</button>
			</div>
	</form>
</div>



 </div>
<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	
        	
        	
        	Sala : {  
        		selector: "#id_sala",
        		validators : {
        			notEmpty: {
                        message: 'la sala es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'la sala tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	
        	
        	
        	piso : {
        		selector: "#id_Piso",
        		validators : {
        			notEmpty: {
                        message: 'el piso es requerido'
                    },
                    lessThan: {
                        value: 12,
                        inclusive: true,
                        message: 'el numero es menor o igual a 12'
                    },
                    greaterThan: {
                        value: 1,
                        inclusive: true,
                        message: 'el numero es mayor o igual a 1'
                    }
                    
                    
                    
        		}
        	},
        	
        	
        	
        	
        	numalumnos : {
        		selector: "#id_numalumnos",
        		validators : {
        			notEmpty: {
                        message: 'el numero son requeridos'
                    },
                    lessThan: {
                        value: 30,
                        inclusive: true,
                        message: 'el numero es menor o igual a 30'
                    },
                    greaterThan: {
                        value: 1,
                        inclusive: true,
                        message: 'el numero es mayor o igual a 1'
                    }
        		}
        	},
        	
        	
        	
        	recursos : {  
        		selector: "#id_recursos",
        		validators : {
        			notEmpty: {
                        message: 'los recursos son requeridos'
                    },
                    stringLength: {
                        min: 3,
                        max: 40,
                        message: 'la recursos tiene de 3 a 40 caracteres'
                    },
        		}
        	},
        	
        	
        	sede : {
        		selector: "#id_sede",
        		validators : {
        			notEmpty: {
                        message: 'la sede es requerido'
                    },
        		}
        	}       	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        }
  
    });

});
</script>









<script type="text/javascript">



$("#id_btn_registra").click(function(){
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraSala", 
          data: $('#id_form').serialize(),
          success: function(data){
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});







	
	$.getJSON("cargSede", {}, function (data){
		$.each(data, function(index, item){
			$("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre+ "</option>");
		});	
	});		

	
	
	function limpiarFormulario(){	
		$('#id_sala').val('');
		$('#id_Piso').val('');
		$('#id_numalumnos').val(' ');
		$('#id_recursos').val('');
		$('#id_sede').val(' ');
	}
	
	
	
	
</script>
























</body>
</html>



