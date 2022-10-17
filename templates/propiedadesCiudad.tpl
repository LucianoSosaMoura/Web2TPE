{include file='templates/header.tpl'}
{include file='templates/navBar.tpl'}

<div>
 <h1> {$titulo} </h1>
   <ul>
      {foreach from=$propiedades item=$propiedad}
         <li> <a href="viewPropiedad/{$propiedad->idPropiedad}">Propiedad N°: {$propiedad->idPropiedad}</a> Operacion: {$propiedad->operacion} Descripcion: {$propiedad->descripcion} Precio: {$propiedad->precio} </li>
      {/foreach}

   <ul>
</div>