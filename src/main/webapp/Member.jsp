<%@ page import="SportFlow.Model.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="SportFlow.Model.User" %>
<%
    HttpSession sessionObj = request.getSession(false);
    User user = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
%>
<!doctype html>
<html lang="en">
<head>
    <title>SportFlow-Member</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
    <div class="container ">
        <div class="row">
            <div class="col-xl-12">
                <div class="card " style="    margin-top: 7rem !important;">
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-lg-4 col-sm-6">
                                <div class="search-box mb-2 me-2">
                                    <div class="position-relative">
                                        <input type="text" class="form-control bg-light border-light rounded" placeholder="Search...">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" class="eva eva-search-outline search-icon"><g data-name="Layer 2"><g data-name="search"><rect width="24" height="24" opacity="0"></rect><path d="M20.71 19.29l-3.4-3.39A7.92 7.92 0 0 0 19 11a8 8 0 1 0-8 8 7.92 7.92 0 0 0 4.9-1.69l3.39 3.4a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42zM5 11a6 6 0 1 1 6 6 6 6 0 0 1-6-6z"></path></g></g></svg>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 col-sm-6">
                                <div class="mt-4 mt-sm-0 d-flex align-items-center justify-content-sm-end">

                                    <div class="mb-2 me-2">
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Create New
                                            </button>


                                        </div>
                                    </div>



                                </div>
                            </div>
                        </div>


                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <form action="AddMember" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Ajouter Member</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <select class="form-select" name="id_user"  aria-label="Default select example">
                                            <%
                                                List<User> users = (List<User>) request.getAttribute("userList");
                                                for(User user1 : users){


                                            %>
                                            <option value="<%=user1.getId()%>"><%=user1.getNom()%></option>
                                            <%}%>
                                        </select>
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Sport</label>
                                            <input type="text" class="form-control" name="sport" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        </div>
                                        <div class="mb-3">
                                            <label for="age" class="form-label">Age</label>
                                            <input type="number" class="form-control" id="age" name="age" aria-describedby="emailHelp">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>

                        <h5 class="font-size-16 me-3 mb-0">Statique</h5>
                        <div class="row mt-4">
                            <div class="col-xl-4 col-sm-6">
                                <div class="card shadow-none border">
                                    <div class="card-body p-3">
                                        <div class="">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <i class="bx bxs-folder h1 mb-0 text-warning"></i>
                                                </div>
                                                <div class="avatar-group">
                                                    <div class="avatar-group-item">
                                                        <a href="javascript: void(0);" class="d-inline-block">
                                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle avatar-sm">
                                                        </a>
                                                    </div>
                                                    <div class="avatar-group-item">
                                                        <a href="javascript: void(0);" class="d-inline-block">
                                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle avatar-sm">
                                                        </a>
                                                    </div>
                                                    <div class="avatar-group-item">
                                                        <a href="javascript: void(0);" class="d-inline-block">
                                                            <div class="avatar-sm">
                                                        <span class="avatar-title rounded-circle bg-success text-white font-size-16">
                                                            A
                                                        </span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex mt-3">
                                                <div class="overflow-hidden me-auto">
                                                    <h5 class="font-size-15 text-truncate mb-1"><a href="javascript: void(0);" class="text-body">Analytics</a></h5>

                                                    <p class="text-muted text-truncate mb-0">Total Members ${totalMembers} </p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <!-- end row -->
                        <div class="d-flex flex-wrap">
                            <h5 class="font-size-16 me-3">Members</h5>
                            <div class="ms-auto">
                                <a href="javascript: void(0);" class="fw-medium text-reset">View All</a>
                            </div>
                        </div>
                        <hr class="mt-2">
                        <div class="table-responsive">
                            <table class="table align-middle table-nowrap table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th scope="col">Nem</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Sport</th>
                                    <th scope="col">Age</th>
                                    <th scope="col" colspan="2">Members</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Member> members = (List<Member>) request.getAttribute("memberList");
                                    for(Member member : members){


                                %>
                                <tr>
                                    <td><%=member.getNom()%></td>
                                    <td><%= member.getEmail()%></td>
                                    <td><%= member.getSport()%></td>
                                    <td><%= member.getAge()%></td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <div class="avatar-sm">
                                                    <span class="avatar-title rounded-circle bg-success text-white font-size-16">
                                                        A
                                                    </span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <a class="font-size-16 text-muted" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                                                <i class="mdi mdi-dots-horizontal"></i>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#editModal"
                                                   data-id="<%= member.getId() %>"
                                                   data-nom="<%= member.getNom() %>"
                                                   data-email="<%= member.getEmail() %>"
                                                   data-sport="<%= member.getSport() %>"
                                                   data-age="<%= member.getAge() %>">Edit</a>

                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="delete?id=<%= member.getId() %>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?');">Supprimer</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Edit Member Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Member</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="editMember.jsp" method="POST">
                        <input type="hidden" id="edit-id" name="id">

                        <div class="mb-3">
                            <label for="edit-nom" class="form-label">Name</label>
                            <input type="text" class="form-control" id="edit-nom" name="nom" required>
                        </div>

                        <div class="mb-3">
                            <label for="edit-email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="edit-email" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label for="edit-sport" class="form-label">Sport</label>
                            <input type="text" class="form-control" id="edit-sport" name="sport" required>
                        </div>

                        <div class="mb-3">
                            <label for="edit-age" class="form-label">Age</label>
                            <input type="number" class="form-control" id="edit-age" name="age" required>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let editModal = document.getElementById("editModal");

        editModal.addEventListener("show.bs.modal", function (event) {
            let button = event.relatedTarget; // Button that triggered the modal

            let id = button.getAttribute("data-id");
            let nom = button.getAttribute("data-nom");
            let email = button.getAttribute("data-email");
            let sport = button.getAttribute("data-sport");
            let age = button.getAttribute("data-age");

            document.getElementById("edit-id").value = id;
            document.getElementById("edit-nom").value = nom;
            document.getElementById("edit-email").value = email;
            document.getElementById("edit-sport").value = sport;
            document.getElementById("edit-age").value = age;
        });
    });
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
