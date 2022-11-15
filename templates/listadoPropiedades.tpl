{include file='templates/header.tpl'}
{include file='templates/navBar.tpl'}

<div>
 <h1> {$titulo} </h1>
   <ul>
      {foreach from=$propiedades item=$propiedad}
      {if !isset($smarty.session.email)}
      <li> <a href="viewPropiedad/{$propiedad->idPropiedad}">Propiedad N°: {$propiedad->idPropiedad}</a> Operacion: {$propiedad->operacion} Descripcion: {$propiedad->descripcion} Precio: $ {$propiedad->precio} Ciudad: {$propiedad->idCiudad}</li>
      {else}
         <li> <a href="viewPropiedad/{$propiedad->idPropiedad}">Propiedad N°: {$propiedad->idPropiedad}</a> Operacion: {$propiedad->operacion} Descripcion: {$propiedad->descripcion} Precio: $ {$propiedad->precio} Ciudad: {$propiedad->idCiudad} <a href="deletePropiedad/{$propiedad->idPropiedad}">Borrar</a></li>
            <form action="updatePropiedad/{$propiedad->idPropiedad}" method="post">
               <input type="text" name="operacion" id="operacion" value= "{$propiedad->operacion}">
               <input type="text" name="descripcion" id="descripcion" value= "{$propiedad->descripcion}">
               <input type="number" name="precio" id="precio" value= "{$propiedad->precio}">
               <select name="idCiudad" required>
                  {foreach from=$ciudades item=$ciudad}
                     <option value='{$ciudad->idCiudad}'>{$ciudad->nombre}</option>
                  {/foreach}
               </select>
               <input type="submit" value="Modificar">
            </form>
       
      {/if}      
      {/foreach}

   <ul>
</div>

{if isset($smarty.session.email)}
<h2> Propiedad nueva </h2>

   <form action="createPropiedad" method="post">
      <label>Operacion: </label>
      <input type="text" name="operacion" id="operacion">
      <label>Descripcion: </label>
      <input type="text" name="descripcion" id="descripcion">
      <label>Precio: </label>
      <input type="number" name="precio" id="precio">
      <select name="idCiudad">
         {foreach from=$ciudades item=$ciudad}
            <option value={$ciudad->idCiudad}>{$ciudad->nombre}</option>
         {/foreach}
      </select>
      <input type="submit" value="Guardar">
   </form>
{/if}  

{include file='templates/footer.tpl'}