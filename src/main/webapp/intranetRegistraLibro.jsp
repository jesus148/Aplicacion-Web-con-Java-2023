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
<h4>Registra Libro</h4>
<h6>Autor: Esteffany Huamanraime</h6>
<form action="registraLibro" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_titulo">Título</label>
				<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el título">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_anio">Año</label>
				<input class="form-control" type="text" id="id_anio" name="anio" placeholder="Ingrese el año de publicación" required maxlength="4">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_serie">Serie</label>
				<input class="form-control" type="text" id="id_serie" name="serie" placeholder="Ingrese la serie" maxlength="100">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria"> Categoría </label> <select
					class="form-control" id="id_categoria" name="categoria">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crear Libro</button>
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
        		selector: "#id_titulo",
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
        		selector: "#id_anio",
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
        		selector: "#id_serie",
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
        		selector: "#id_categoria",
        		validators : {
        			notEmpty: {
                        message: 'La categoría es requerido'
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
	          url: "registraLibro", 
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

	$.getJSON("cargaCategoria", {}, function (data){
		$.each(data, function(index, item){
			$("#id_categoria").append("<option value=" +  item.idCategoria +" >" +  item.descripcion+ "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_titulo').val('');
		$('#id_anio').val('');
		$('#id_serie').val('');
		$('#id_categoria').val(' ');
	}
</script>
</div>
</body>
</html>



