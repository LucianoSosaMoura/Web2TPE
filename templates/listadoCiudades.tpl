{include file='templates/header.tpl'}
{include file='templates/navBar.tpl'}

<div>
 <h1> {$titulo} </h1>
   <ul>
      {foreach from=$ciudades item=$ciudad}
      {if !isset($smarty.session.email)}
         <li> <a href="viewCiudad/{$ciudad->idCiudad}">Ciudad N°: {$ciudad->idCiudad}</a> Nombre: {$ciudad->nombre} Provincia: {$ciudad->provincia} Habitantes: {$ciudad->cantidadHabitantes} </li>
      {else}
         <li> <a href="viewCiudad/{$ciudad->idCiudad}">Ciudad N°: {$ciudad->idCiudad}</a> Nombre: {$ciudad->nombre} Provincia: {$ciudad->provincia} Habitantes: {$ciudad->cantidadHabitantes} <a href="deleteCiudad/{$ciudad->idCiudad}">Borrar</a> </li>
         <form action="updateCiudad/{$ciudad->idCiudad}" method="post">
            <input type="text" name="nombre" id="nombre" placeholder="Nombre" value= "{$ciudad->nombre}">
            <input type="text" name="provincia" id="provincia" placeholder="Provincia" value= "{$ciudad->provincia}">
            <input type="number" name="cantidadHabitantes" id="cantidadHabitantes" placeholder="Cantidad de habitantes" value= "{$ciudad->cantidadHabitantes}">
            <input type="submit" value="Modificar">
         </form>      
      {/if}
      {/foreach}
   <ul>
</div>

{if isset($smarty.session.email)}
<h2> Ciudad nueva </h2>

   <form action="createCiudad" method="post">
                  <label>Nombre: </label>
                  <input type="text" name="nombre" id="nombre">
                  <label>Provincia: </label>
                  <input type="text" name="provincia" id="provincia">
                  <label>Cantidad de habitantes: </label>
                  <input type="number" name="cantidadHabitantes" id="cantidadHabitantes">
                  
                  <input type="submit" value="Guardar">
               </form>
{/if}
{include file='templates/footer.tpl'}