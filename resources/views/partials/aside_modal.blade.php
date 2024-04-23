<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('welcome') }}" class="brand-link">
        <img src="{{ asset('asset/Images/ICT4D.jpg') }}" alt="App Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">ICT FOLLOW UP</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{ asset("asset/Images/chef.png") }}" class="img-circle elevation-2" alt="User">
            </div>
            <div class="info">
                <a href="#" class="d-block">{{ session('username') }}</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item">
                    <a href="{{ route('counter.register') }}" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>

                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon far fa-plus-square"></i>
                        <p>
                            Ajout
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#profModal">
                                <i class="fas fa-chevron-right mr-2"></i>
                                <p>Professeur</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#delModal">
                                <i class="fas fa-chevron-right mr-2"></i>
                                <p>Délégué</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                            Listes
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href=" {{ route('professeurs.main') }} " class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Liste des professeurs</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href=" {{ route('delegues.main') }} " class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Liste des délégués</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                            Fiches
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-table"></i>
                                <p>
                                    ICT-L1
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href=" {{ route('professeurs.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiches de cours</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiches de surveillance</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche des TP</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-table"></i>
                                <p>
                                    ICT-L2
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href=" {{ route('professeurs.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiches de cours</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche de surveillances</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche des TP</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-table"></i>
                                <p>
                                    ICT-L3
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('fichesl3') }}" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche de cours</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche de surveillance</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href=" {{ route('delegues.main') }} " class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fiche des TP</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
       <!-- Logout Button -->
       <div class="sidebar-footer">
            <button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#logoutModal">Logout</button>
        </div>
    </div>
    <!-- /.sidebar -->
</aside>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmation de déconnexion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Êtes-vous sûr de vouloir vous déconnecter ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Non</button>
                <form id="logoutForm" action="{{ route('admin.logout') }}" method="POST">
                    @csrf
                    <button type="submit" class="btn btn-danger">Déconnexion</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Modal pour le Délégué -->
    <div class="modal fade" id="delModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ajouter un nouveau délégué</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('enregistrer.delegue') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="nameDel">Nom</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="nameDel" name="nameDel" placeholder="Nom">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-user"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="matDel">Matricule</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="matDel" name="matDel" placeholder="Matricule">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-envelope"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mdpDel">Mot de passe</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="mdpDel" name="mdpDel" placeholder="Mot de passe">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-lock"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="icheck-primary">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                <label for="agreeTerms">Je confirme les informations</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block">Enregistrer</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal pour le Professeur -->
    <div class="modal fade" id="profModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ajouter un nouveau professeur</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('enregistrer.professeur') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="nomEns">Nom du professeur</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="nomEns" name="nomEns" placeholder="Nom du professeur">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-user"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="emailEns">Email du professeur</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="emailEns" name="emailEns" placeholder="Email du professeur">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-envelope"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mdpEns">Mot de passe</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="mdpEns" name="mdpEns" placeholder="Mot de passe">
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fas fa-lock"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="agreeTerms" name="terms" value="agree">
                            <label class="form-check-label" for="agreeTerms">Je confirme les informations</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Enregistrer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
