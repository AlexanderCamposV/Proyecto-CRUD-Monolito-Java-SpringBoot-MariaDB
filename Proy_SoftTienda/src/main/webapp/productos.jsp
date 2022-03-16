<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Productos</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	var productos = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listarProducto",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.codigoProducto;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.nombreProducto;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.nitProveedor;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.precioCompra;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.ivaCompra;
				var columna6 = document.createElement("td");
				columna6.innerHTML = item.precioVenta;
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<a href = 'productoEditar.jsp?codigo="+item.codigoProducto+"'>Editar</a>";
				var columna8 = document.createElement("td");
				columna8.innerHTML = "<a href = '' onclick = 'eliminarProducto("+item.codigoProducto+")'>Eliminar</a>";				
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
				tr.appendChild(columna6);
				tr.appendChild(columna7);
				tr.appendChild(columna8);
			});
		}
	})
	
	function eliminarProducto(codigo){
		var eliminar = $.ajax({
			type: "GET", 
			url: "http://localhost:8080/eliminarProducto?codigo="+codigo,
			sucess: function(data){
				alert("El producto ha sido eliminado");
			}
			
			
		})
	};
</script>
</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Producto</h1>
	</div>
	<div class="form-group text-center">
		<a href="productoAgregar.jsp">
			<button type="button" class="btn btn-outline-primary">Agregar producto</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
		<a href="productosBuscar.jsp">
			<button type="button" class="btn btn-outline-primary">Buscar producto</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
<table class="table"  border = "1px">
  <thead class="table-light">
	<tr>
				<th>C�digo Producto</th>
				<th>Nombre Producto</th>
				<th>NIT Proveedor</th>
				<th>Precio Compra</th>
				<th>IVA Compra</th>
				<th>Precio Venta</th>				
				<th>Eliminar</th>
				<th>Editar</th>
					
	</tr>		
  </thead>
  <tbody id = "myTable">
  
  </tbody>
</table>
</div>

</body>