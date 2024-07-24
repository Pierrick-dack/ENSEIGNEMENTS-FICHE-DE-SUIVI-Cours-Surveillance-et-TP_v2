@extends('base_chef')
@section('title', 'FOLLOW UP | Listes des professeurs')



@section('content')
    <div class="content">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Listes</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Accueil</a></li>
                                <li class="breadcrumb-item active">Liste</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Liste des enseignants</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div id="jsGrid1">
                            <div class="container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">N°</th>
                                            <th scope="col">Noms</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Date de création</th>
                                            <th scope="col">Modifier</th>
                                            <th scope="col">Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($enseignants as $enseignant)
                                            <tr>
                                                <td>{{ $enseignant->id }}</td>
                                                <td>{{ $enseignant->nomEns }}</td>
                                                <td>{{ $enseignant->emailEns }}</td>
                                                <td>{{ $enseignant->created_at }}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary edit-teacher-btn" data-toggle="modal" data-target="#editTeacherModal" data-id="{{ $enseignant->id }}" data-nom="{{ $enseignant->nomEns }}" data-email="{{ $enseignant->emailEns }}">Modifier</button>

                                                </td>
                                                <td>
                                                    <form action="{{ route('enseignants.destroy', $enseignant->id) }}" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Supprimer</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6">Aucun enseignant trouvé.</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
    </div>

    <!-- Modal de Modification -->
    <div class="modal fade" id="editTeacherModal" tabindex="-1" aria-labelledby="editTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTeacherModalLabel">
                        Modifier un enseignant
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">
                            &times;
                        </span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editTeacherForm" action="" method="post">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="editNomEns">
                                Nom du professeur
                            </label>
                            <input type="text" class="form-control" id="editNomEns" name="nomEns">
                        </div>
                        <div class="form-group">
                            <label for="editEmailEns">Email du professeur</label>
                            <input type="email" class="form-control" id="editEmailEns" name="emailEns">
                        </div>
                        <div class="form-group">
                            <label for="editMdpEns">Mot de passe</label>
                            <input type="password" class="form-control" id="editMdpEns" name="mdpEns">
                        </div>
                        <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            // Lorsqu'un bouton d'édition d'enseignant est cliqué...
            $('.edit-teacher-btn').on('click', function() {
                // Récupérez l'ID, le nom, et l'email à partir des données du bouton
                var id = $(this).data('id');
                var nom = $(this).data('nom');
                var email = $(this).data('email');

                // Pré-remplissez les champs du formulaire dans le modal avec les données récupérées
                $('#editTeacherModal').find('.modal-body #editNomEns').val(nom);
                $('#editTeacherModal').find('.modal-body #editEmailEns').val(email);

                // Mettez à jour l'attribut 'action' du formulaire du modal pour inclure l'ID de l'enseignant
                $('#editTeacherForm').attr('action', '/enseignants/' + id); // Ajustez l'URL selon le schéma de routage de votre application
            });
        });
        </script>


@endsection

