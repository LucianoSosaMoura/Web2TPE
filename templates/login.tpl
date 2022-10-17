{include file='templates/header.tpl'}
{include file='templates/navBar.tpl'}

<form action="verify" method="post"> 
    <input placeholder="email" type="text" name="email" id="email" required>
    <input placeholder="password" type="password" name="password" id="password" required>
    <input type="submit" value="Ingresar">
</form>
<h3>{$error}</h3>

{include file='templates/footer.tpl'}