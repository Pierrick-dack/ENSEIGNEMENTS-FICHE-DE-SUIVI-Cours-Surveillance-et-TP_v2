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
                                                <a href="#" class="btn btn-primary btn-sm" data-fiche-id="{{ $fiche->id }}" data-toggle="modal" data-target="#editFicheModal">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <form action="{{ route('DeleteFicheSurveillance', $fiche->id) }}" method="POST" style="display: inline;">
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



    <!-- Modal pour la modification d'une fiche de surveillance -->
    <div class="modal fade" id="editFicheModal" tabindex="-1" role="dialog" aria-labelledby="editFicheModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editFicheModalLabel">Modifier Fiche de Surveillance</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="wizard_with_validation" action="{{ route('update_fiche_surveillance', ['id' => $fiche]) }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="chefdesalle">Chef de salle (Enseignant)*</label>
                            <input type="text" class="form-control" id="chefdesalle" name="chefdesalle" required>
                        </div>
                        <div class="form-group">
                            <label for="salle">Salle</label>
                            <input type="text" class="form-control" id="salle" name="salle" required>
                        </div>
                        <div class="form-group">
                            <label for="date">Date</label>
                            <input type="date" class="form-control" id="date" name="date" required>
                        </div>
                        <div class="form-group">
                            <label for="session">Session</label>
                            <input type="text" class="form-control" id="session" name="session" required>
                        </div>
                        <div class="form-group">
                            <label for="codeCours">Code UE</label>
                            <select id="codeCours" class="form-control" name="codeCours" required>
                                <option>Sélectionnez un cours</option>
                                @foreach($codes as $code)
                                    <option value="{{ $code->codeUE }}">{{ $code->codeUE }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="intituleUE">Intitulé UE*</label>
                            <select id="intituleUE" class="form-control" name="intituleUE" required>
                                <option>Sélectionnez son libellé</option>
                                @foreach($codes as $code)
                                    <option value="{{ $code->intituleUE }}">{{ $code->intituleUE }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group form-float">
                            <a href="#" id="add-input" class="btn btn-icon icon-left btn-primary">
                                <i class="far fa-edit"></i>
                                Ajouter
                            </a>
                            <div class="input-fields">
                                <div class="form-line">
                                    <label class="form-label">Noms et prénoms*</label>
                                    <input type="text" name="name[]" class="form-control" required>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-primary" form="wizard_with_validation">Sauvegarder les Modifications</button>
                </div>
            </div>
        </div>
    </div>
@endsection
