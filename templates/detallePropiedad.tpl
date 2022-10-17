{include file='templates/header.tpl'}
{include file='templates/navBar.tpl'}

<h1> Propiedad N°: {$propiedad->idPropiedad} </h1>
<h3> Operacion: {$propiedad->operacion} </h3>
<h3> Descripcion: {$propiedad->descripcion} </h3>
<h3> Precio: $ {$propiedad->precio} </h3>
<h3> Ciudad: {$propiedad->idCiudad} </h3>

{include file='templates/footer.tpl'}