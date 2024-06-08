@extends('base_chef')
@section('title', 'FOLLOW UP | Listes des fiches du niveau 2')



@section('content')
    <div class="content">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Fiches de cours</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href=" {{ route('Dashboard_chef') }} ">Accueil</a></li>
                                <li class="breadcrumb-item active">Liste des fiches</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Licence 2</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div id="jsGrid1">
                            <div class="container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">N°</th>
                                            <th scope="col">Date & Heure</th>
                                            <th scope="col">Titre de la séance</th>
                                            <th scope="col">Contenu</th>
                                            <th scope="col">Salle</th>
                                            <th scope="col">Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($fichesl2 as $fiche)
                                            <tr>
                                                <td>{{ $fiche->id }}</td>
                                                <td>{{ $fiche->created_at }}</td>
                                                <td>{{ $fiche->titreSeance }}</td>
                                                <td>{{ $fiche->contenu }}</td>
                                                <td>{{ $fiche->salle }}</td>

                                                <td>
                                                    <form action="{{ route('destroy.fichescoursl2', $fiche->id) }}" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Supprimer</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6">Aucune fiche trouvée.</td>
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
@endsection
