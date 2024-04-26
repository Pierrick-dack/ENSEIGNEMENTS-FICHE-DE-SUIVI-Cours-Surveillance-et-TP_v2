@extends('base_prof')
@section('title', 'ICT FOLLOW UP - Fiche de surveillance')

@section('content')
    <div class="section-body">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Liste des fiches de surveillance</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                                <thead>
                                    <tr>
                                        <th>N°</th>
                                        <th>Date</th>
                                        <th>Code UE</th>
                                        <th>Intitulé UE</th>
                                        <th>Chef de salle</th>
                                        <th>Salle</th>
                                        <th>Surveillants</th>
                                        <th>Modifier</th>
                                        <th>Supprimer</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($fichesSurvey as $index => $fiche)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $fiche->date }}</td>
                                            <td>{{ $fiche->codeCours }}</td>
                                            <td>{{ $fiche->intituleUE }}</td>
                                            <td>{{ $fiche->chefdesalle }}</td>
                                            <td>{{ $fiche->salle }}</td>
                                            <td>
                                                @foreach ($fiche->surveillants as $surveillant)
                                                    {{ $surveillant->nom }}@if (!$loop->last), @endif
                                                @endforeach
                                            </td>
                                            <td>
                                                <a href="" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                            </td>
                                            <td>
                                                <form action="" method="POST" style="display: inline;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
