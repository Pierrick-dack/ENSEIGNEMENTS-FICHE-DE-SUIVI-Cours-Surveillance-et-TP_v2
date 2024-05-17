@extends('base_chef')
@section('title', 'FOLLOW UP | Listes des fiches du niveau 1')



@section('content')
    <div class="content">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Fiches de travaux pratiques</h1>
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
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div id="jsGrid1">
                            <div class="container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th >N°</th>
                                            <th scope="col">Titre de la séance</th>
                                            <th scope="col">Salle</th>
                                            <th scope="col">Objectifs</th>
                                            <th scope="col">Observations</th>
                                            <th scope="col">Heure de début</th>
                                            <th scope="col">Heure de fin</th>
                                            <th scope="col">Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($fichesTP as $fiche)
                                            <tr>
                                                <td>{{ $fiche->id }}</td>
                                                <td>{{ $fiche->titreSeanceTP }}</td>
                                                <td>{{ $fiche->codeCours }}</td>
                                                <td>{{ $fiche->objectifsTP }}</td>
                                                <td>{{ $fiche->observations }}</td>
                                                <td>{{ $fiche->heureDebut }}</td>
                                                <td>{{ $fiche->heureFin }}</td>

                                                <td>
                                                    <form action="{{ route('destroy.fichescoursl1', $fiche->id) }}" method="POST">
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
