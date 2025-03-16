<%@ page import="SportFlow.Model.User" %><%
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
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ...
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
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
                                                    <p class="text-muted text-truncate mb-0">12 Files</p>
                                                </div>
                                                <div class="align-self-end ms-2">
                                                    <p class="text-muted mb-0 font-size-13"><i class="mdi mdi-clock"></i> 15 min ago</p>
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
                                    <th scope="col">Name</th>
                                    <th scope="col">Date modified</th>
                                    <th scope="col">Size</th>
                                    <th scope="col" colspan="2">Members</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-file-document font-size-16 align-middle text-primary me-2"></i> index.html</a></td>
                                    <td>12-10-2020, 09:45</td>
                                    <td>09 KB</td>
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-folder-zip font-size-16 align-middle text-warning me-2"></i> Project-A.zip</a></td>
                                    <td>11-10-2020, 17:05</td>
                                    <td>115 KB</td>
                                    <td>
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
                                        </div>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <a class="font-size-16 text-muted" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                                                <i class="mdi mdi-dots-horizontal"></i>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-image font-size-16 align-middle text-muted me-2"></i> Img-1.jpeg</a></td>
                                    <td>11-10-2020, 13:26</td>
                                    <td>86 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <div class="avatar-sm">
                                                    <span class="avatar-title rounded-circle bg-info text-white font-size-16">
                                                        K
                                                    </span>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-text-box font-size-16 align-middle text-muted me-2"></i> update list.txt</a></td>
                                    <td>10-10-2020, 11:32</td>
                                    <td>08 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-folder font-size-16 align-middle text-warning me-2"></i> Project B</a></td>
                                    <td>10-10-2020, 10:51</td>
                                    <td>72 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <div class="avatar-sm">
                                                    <span class="avatar-title rounded-circle bg-danger text-white font-size-16">
                                                        3+
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-text-box font-size-16 align-middle text-muted me-2"></i> Changes list.txt</a></td>
                                    <td>09-10-2020, 17:05</td>
                                    <td>07 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-image font-size-16 align-middle text-success me-2"></i> Img-2.png</a></td>
                                    <td>09-10-2020, 15:12</td>
                                    <td>31 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <div class="avatar-sm">
                                                    <span class="avatar-title rounded-circle bg-pink text-white font-size-16">
                                                        L
                                                    </span>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-folder font-size-16 align-middle text-warning me-2"></i> Project C</a></td>
                                    <td>09-10-2020, 10:11</td>
                                    <td>20 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="rounded-circle avatar-sm">
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
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="bx bxs-file font-size-16 align-middle text-primary me-2"></i> starter-page.html</a></td>
                                    <td>08-10-2020, 03:22</td>
                                    <td>11 KB</td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="" class="rounded-circle avatar-sm">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle avatar-sm">
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
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
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
