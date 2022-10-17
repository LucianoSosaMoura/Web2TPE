<nav class="navbar navbar-expand-lg navbar-light bg-light ">
  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ciudades">Ciudades</a>
      </li>
      {if !isset($smarty.session.email)}
        <li class="nav-item">
          <a class="nav-link" href="login">Login</a>
        </li>
      {else} 
        <li class="nav-item ml-auto">
          <a class="nav-link" href="logout">Logout ({($smarty.session.email)})</a>
        </li>
      {/if}

    </ul>
       
  </div>
</nav> 