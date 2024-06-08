@extends('base_chef')
@section('title', 'FOLLOW UP | Listes des délégués')



@section('content')
    <div class="content">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Liste</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href=" {{ route('Dashboard_chef') }} ">Accueil</a></li>
                                <li class="breadcrumb-item active">Liste des délégués</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Liste des délégués</h3>
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
                                            <th scope="col">Matricules</th>
                                            <th scope="col">Date de création</th>
                                            <th scope="col">Modifier</th>
                                            <th scope="col">Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($delegues as $delegue)
                                            <tr>
                                                <td>{{ $delegue->id }}</td>
                                                <td>{{ $delegue->nameDel }}</td>
                                                <td>{{ $delegue->emailDel }}</td>
                                                <td>{{ $delegue->matDel }}</td>
                                                <td>{{ $delegue->created_at }}</td>
                                                <td>
                                                    <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#editDelegateModal" data-id="{{ $delegue->id }}" data-name="{{ $delegue->nameDel }}" data-matricule="{{ $delegue->matDel }}">
                                                        Modifier
                                                    </a>
                                                </td>
                                                <td>
                                                    <form action="{{ route('delegues.destroy', $delegue->id) }}" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Supprimer</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6">Aucun délégué trouvé.</td>
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

    <!-- Modal de modification -->
	<div class="modal fade" id="editDelegateModal" tabindex="-1" aria-labelledby="editDelegateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editDelegateModalLabel">Modifier Délégué</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="editDelegateForm" action="" method="POST">
						@csrf
						@method('PUT')
						<div class="form-group">
							<label for="nameDel">Nom</label>
							<input type="text" class="form-control" id="nameDel" name="nameDel" required>
						</div>

                        <div class="form-group">
                            <label for="emailDel">Email</label>
                            <input type="email" class="form-control" id="emailDel" name="emailDel" required>
                        </div>

						<div class="form-group">
							<label for="matDel">Matricule</label>
							<input type="text" class="form-control" id="matDel" name="matDel" required>
						</div>

						<div class="form-group">
							<label for="mdpDel">Mot de passe</label>
							<input type="password" class="form-control" id="mdpDel" name="mdpDel" required>
						</div>

						<button type="submit" class="btn btn-primary">
							Sauvegarder les modifications
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>


    <script>
        $(document).ready(function(){
            // Lorsqu'un bouton d'édition est cliqué...
            $('.edit-btn').on('click', function() {
                var id = $(this).data('id'); // Récupérez l'ID à partir des données du bouton
                var name = $(this).data('name'); // Récupérez le nom
                var email = $(this).data('email'); // Récupérez l'email
                var matricule = $(this).data('matricule'); // Récupérez le matricule

                // Remplissez les champs du formulaire dans le modal
                $('#editDelegateModal').find('.modal-body #nameDel').val(name);
                $('#editDelegateModal').find('.modal-body #emailDel').val(email);
                $('#editDelegateModal').find('.modal-body #matDel').val(matricule);


                // Mettez à jour l'attribut 'action' du formulaire avec l'URL correcte, en incluant l'ID
                $('#editDelegateForm').attr('action', '/delegues/' + id); // Assurez-vous que l'URL correspond à votre structure d'URL réelle
            });
        });
    </script>


@endsection
