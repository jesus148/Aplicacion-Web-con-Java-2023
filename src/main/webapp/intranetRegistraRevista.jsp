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

<link rel="stylesheet" type="text/css" href="css/styles.css">

<title>Registrar Revista</title>
<style>
    body {
background: rgb(31,129,142);
background: radial-gradient(circle, rgba(31,129,142,0.9977240896358543) 11%, rgba(155,218,228,1) 85%);
			}
  </style>
</head>
<body>


<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h1>Registrar Revista</h1>
<h6> Jonhy Mitchel Bobadilla Ocampo</h6>

	<form action="registraAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_frecuencia">Frecuencia</label>
				<input class="form-control" type="text" id="id_frecuencia" name="frecuencia"  placeholder="Ingrese La frecuencia" >
			</div>
			
			<div class="form-group">
			<label class="control-Label" for ="id_fechaCreacion">Fecha Creación</label>
			<input class="form-control" type ="date" id="id_fechaCreacion" name="fechaCreacion" placeholder="Ingrese La fecha de creacion">
			
			</div>
				
			<div class="form-group">
				<label class="control-label" for="id_modalidad"> Modalidad </label>
				 <select
					class="form-control" id="id_modalidad" name="modalidad">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			
			
			
			<div class="form-group">
				<button type="button" class="btn-numero1" id="id_btn_registra">Registrar Revista</button>
			</div>
	</form>
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
        	fechaCreacion : {
        		selector: "#id_fechaCreacion",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de creacion es requerida'
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
	          url: "insertarRevista", 
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


	
	
	$.getJSON("cargaModalidad", {}, function (data){
		$.each(data, function(index, item){
			$("#id_modalidad").append("<option value=" +  item.idModalidad +" >" +  item.descripcion + "</option>");
		});	
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



