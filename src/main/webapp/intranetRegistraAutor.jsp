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
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Registra Autor</h4>
<h4>Autor: Juan Ramos Ayasta</h4>

<h1>Registrar Autor</h1>

	<form action="registraAutor" id="id_form" > 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Apellido</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha de Nacimiento</label>
				<input class="form-control" type="date" id="id_fecha" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_telefono">Tel�fono</label>
				<input class="form-control"  id="id_telefono" name="telefono" placeholder="Ingrese telefono" maxlength="9"/>
			</div>			
			
			<div class="form-group">
				<label class="control-label" for="id_grado"> Grado </label> <select
					class="form-control" id="id_grado" name="grado">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registrar Autor</button>
			</div>
	</form>

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
        	nombre : {  
        		selector: "#id_nombre",
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
        	apellido : {  
        		selector: "#id_apellido",
        		validators : {
        			notEmpty: {
                        message: 'El apellido es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El apellido tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	fecha : {
        		selector: "#id_fecha",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de nacimiento es requerido'
                    }
        		}
        	},
        	telefono : {
        		selector: "#id_telefono",
        		validators : {
        			notEmpty: {
        				message: 'El telefono es requerido'
                        
                    },
                  
        		}
        	},
        	grado : {
        		selector: "#id_grado",
        		validators : {
        			notEmpty: {
                        message: 'El grado es requerido'
                    },
        		}
        	},        	
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
     url: "registraAutor", 
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
$.getJSON("cargaGrado", {}, function(data){
	console.log(data);
	$.each(data, function(index, item){
		$("#id_grado").append("<option value='"+ item.idGrado +"'>" +  item.descripcion + "</option>");

	});

});

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_apellido').val('');
		$('#id_fecha').val(' ');
		$('#id_telefono').val(' ');
		$('#id_grado').val(' ');
	}
</script>

	
</div>
</body>
</html>



