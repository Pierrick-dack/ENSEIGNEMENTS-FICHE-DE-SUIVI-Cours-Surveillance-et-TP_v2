@extends('base_chef')
@section('title', 'ICT FOLLOW UP | ICTL1')

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">ICTL1</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('welcome') }}">Accueil</a></li>
                            <li class="breadcrumb-item active">ICT-L1</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Liste des unités d'enseignements</h3>
                </div>
<!-- ************************************************ Semestre 1 ***************************************** -->
                <div class="card-header">
                    <h4 class="card-title">Semestre 1</h4>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div id="jsGrid1">
                        <div class="container">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">N°</th>
                                    <th scope="col">Code UE</th>
                                    <th scope="col">Intitulé UE</th>
                                    <th scope="col">Modifier</th>
                                    <th scope="col">Supprimer</th>
                                </tr>
                                </thead>
                                <tbody>
                                @forelse ($coursSemestre1 as $coursS1l1)
                                    <tr>
                                        <td>{{ $coursS1l1->id }}</td>
                                        <td>{{ $coursS1l1->codeUE }}</td>
                                        <td>{{ $coursS1l1->intituleUE }}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#editDelegateModal" data-id="{{ $coursS1l1->id }}" data-codeUE="{{ $coursS1l1->codeUE }}" data-intituleUE="{{ $coursS1l1->intituleUE }}">
                                                Modifier
                                            </a>
                                        </td>
                                        <td>
                                            <form action="{{ route('ictl1', $coursS1l1->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger">Supprimer</button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6">Aucune unité d'enseignement trouvée.</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- ***************************************** Semestre 2 ***************************************** -->
                <div class="card-header">
                    <h4 class="card-title">Semestre 2</h4>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div id="jsGrid1">
                        <div class="container">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">N°</th>
                                    <th scope="col">Code UE</th>
                                    <th scope="col">Intitulé UE</th>
                                    <th scope="col">Modifier</th>
                                    <th scope="col">Supprimer</th>
                                </tr>
                                </thead>
                                <tbody>
                                @forelse ($coursSemestre2 as $coursS2l1)
                                    <tr>
                                        <td>{{ $coursS2l1->id }}</td>
                                        <td>{{ $coursS2l1->codeUE }}</td>
                                        <td>{{ $coursS2l1->intituleUE }}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#editDelegateModal" data-id="{{ $coursS2l1->id }}" data-codeUE="{{ $coursS2l1->codeUE }}" data-intituleUE="{{ $coursS2l1->intituleUE }}">
                                                Modifier
                                            </a>
                                        </td>
                                        <td>
                                            <form action="{{ route('ue_l1.destroy', $coursS2l1->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger">Supprimer</button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6">Aucune unité d'enseignement trouvée.</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
@endsection
