<%@ page import="SportFlow.Model.User" %>
<%@ page import="SportFlow.Model.Coatch" %>
<%@ page import="java.util.List" %>
<%
    HttpSession sessionObj = request.getSession(false);
    User user = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
%>
<!doctype html>
<html lang="en">
    <head>
        <title>SportFlow</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <style><%@include file="assets/css/style.css"%></style>
        <style><%@include file="assets/css/test.css"%></style>
        
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <header>
           
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="./">
                        <img src="assets/images/logosport.png" alt="Logo" class="img-fluid img" />
                    </a>
            
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
            
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="./">Accueil</a>
                            </li>
                            <% if (user != null) { %>
                            <% if ("Admin".equals(user.getRole())) { %>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="Member">Membres</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="Entrineur">Entraineurs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="Seance">Seances d'Entrainement</a>
                            </li>
                            <% } else if ("Membres".equals(user.getRole())) { %>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="Seance">Seances d'Entrainement</a>
                            </li>
                            <% } else if ("Entraineurs".equals(user.getRole())) { %>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="Seance">Seances d'Entrainement</a>
                            </li>
                            <% } %>
                            <% } else { %>
                            <li class="nav-item">
                                <a class="nav-link color-nav" href="#">Entraineurs</a>
                            </li>
                            <li class="nav-item pl-5">
                                <a class="btn btn-primary" href="Connection.jsp">Connexion</a>
                            </li>
                            <% } %>

                            <% if (user != null) { %>
                            <li class="nav-item pl-5">
                                <span><%= user.getNom() %></span>
                                <a class="btn btn-danger" href="logout.jsp">Logout</a>
                            </li>
                            <% } %>




                        </ul>
                    </div>
                </div>
            </nav>


        </header>
        <main>
<section>
    <div class="container-fluid bg">
        <div class="row">
            <div class="col-lg-3">
            </div>
            <div class="col-lg-3 pdT">
                <h2 class="" >SportFlow</h2>
                <p>Plateforme de Gestion des <br>Clubs et Entraineurs</p>
                <a href="#seance" class="btn btn-light btn_connection">Resirver voter Seances d'Entrainement</a>
            </div>
            <div class="col-lg-6 bg-vidio">
                <video autoplay muted loop id="myVideo">
                    <source src="assets/images/83c1c2d043744dcf92d7c05dd69158a8.webm" type="video/mp4">
                  </video>
            </div>
        </div>
    </div>
</section>
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">
            Entraineurs
        </h5>
        <div class="row">
            <%
                List<Coatch> coatches = (List<Coatch>) request.getAttribute("coatchList");
                for(Coatch coatch : coatches){


            %>
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="assets/images/triner.jpg" alt="card image"></p>
                                    <h4 class="card-title"><%= coatch.getNom()%></h4>
                                    <p class="card-text"><%= coatch.getSpecialisation()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4" style="width:20rem">
                                    <h4 class="card-title"><%= coatch.getNom()%></h4>
                                    <p class="card-text"><%= coatch.getSpecialisation()%></p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>


          

        </div>
    </div>
</section>
<section>
    <div class="container pt-5 ">
        <div class="row">
            <div class="col-lg-9" id="seance">                <h2>Resirver voter Seances d'Entrainement</h2>
            </div>

            <div class="col-lg-3"></div>
            <div class="col-lg-2"></div>

            <div class="col-lg-8 pt-4" >
                <form action="ADDSEANCE" method="post">

                  
                    <!-- Text input -->
                    <div data-mdb-input-init class="form-outline mb-4">
                        <select class="form-select" name="entrineur" multiple aria-label="multiple select example">
                            <%
                                List<Coatch> coatchees = (List<Coatch>) request.getAttribute("coatchList");
                                for(Coatch coatchs : coatchees){


                            %>
                            <option value="<%= coatchs.getId()%>" selected><%= coatchs.getNom()%></option>


                            <% } %>
                        </select>
                    </div>
                    <div data-mdb-input-init class="form-outline mb-4">
                      <input type="date" id="date" name="date" class="form-control" />
                      <label class="form-label" for="date">Date</label>
                    </div>
                  
                    <!-- Text input -->
                    <div data-mdb-input-init class="form-outline mb-4">
                      <input type="time" id="time" name="heur" class="form-control" />
                      <label class="form-label" for="time">Heurs</label>
                    </div>
                  
                   
                  
                    <!-- Submit button -->
                    <button  type="submit" class="btn btn-primary btn-block mb-4">Resirver voter Seances d'Entrainement</button>
                  </form>
            </div>
            <div class="col-lg-2"></div>

        </div>
    </div>
</section>

        </main>
        <footer>
            <hr>
            <div class="col-lg-12 text-center">
                <p>2025 ©  SportFlow, Inc.</p>
            </div>
        </footer>
        <script>
            var video = document.getElementById("myVideo");
            var btn = document.getElementById("myBtn");
            
            function myFunction() {
              if (video.paused) {
                video.play();
                btn.innerHTML = "Pause";
              } else {
                video.pause();
                btn.innerHTML = "Play";
              }
            }
            </script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
