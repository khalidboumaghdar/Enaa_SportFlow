<%@ page import="SportFlow.Model.User" %><%
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
                            <a class="nav-link color-nav" href="index.html">Entraineurs</a>
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
            <section class="vh-50 " style="background-color: #6255E2;">
                <div class="container h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                      <div class="card text-black" >
                        <div class="card-body p-md-5 mt-5">
                          <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
              
                              <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Inscrivez-vous</p>
              
                              <form action="Register" method="post" class="mx-1 mx-md-4">
              
                                <div class="d-flex flex-row align-items-center mb-4">
                                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                  <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                    <input type="text" id="form3Example1c" name="nom" class="form-control" />
                                    <label class="form-label" for="form3Example1c">Votre Nom</label>
                                  </div>
                                </div>
              
                                <div class="d-flex flex-row align-items-center mb-4">
                                  <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                  <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                    <input type="email" id="form3Example3c" name="email" class="form-control" />
                                    <label class="form-label" for="form3Example3c">Votre Email</label>
                                  </div>
                                </div>
              
                                <div class="d-flex flex-row align-items-center mb-4">
                                  <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                  <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                    <input type="password" id="form3Example4c" name="motpass" class="form-control" />
                                    <label class="form-label" for="form3Example4c">Mot de passe</label>
                                  </div>
                                </div>
              

              
                  
              
                                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                  <button    class="btn btn-dark btn-lg btn-block" type="submit">S'inscrire</button>
                                </div>
              
                              </form>
              
                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
              
                                <dotlottie-player src="https://lottie.host/80f0b722-b5cb-4523-8e25-0f5ed083feb5/0z3WhioiCY.lottie" background="transparent" speed="1" style="width: 300px; height: 300px" loop autoplay></dotlottie-player>                    </a>
              
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>

        </main>
        <footer>
            <hr>
            <div class="col-lg-12 text-center">
                <p>2025 ©Le développement de khalid boumaghdar</p>
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
                                        <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
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
