@extends('base')
@section('title', 'Analytics')

@section('styles')
    <link rel="stylesheet" href="{{ asset('css/analyticsDel.css') }}">
@endsection

@section('content')
    <div class="content">
        <br>
        <h1>Tableau récapitulatif des fiches</h1>
        {{-- Description du tableau des fiches de cours --}}
        <br><br>
        <h2>Tableau des fiches de cours</h2>
        <br>
        <p>Ce tableau présente une liste des fiches de cours organisées par l'Université.</p>
        <p>Chaque fiche comprend des détails tels que la date, la salle où le cours a eu lieu, le titre de la séance, et le niveau concerné.</p>
        <p>Les actions disponibles permettent de gérer les fiches, notamment pour supprimer des entrées obsolètes ou incorrectes.</p>
        <br>
        <table>
            <thead>
                <tr>
                    <th>N°</th>
                    <th>Date</th>
                    <th>Salle</th>
                    <th>Titre séance</th>
                    <th>Niveau</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($fiches as $fiche)
                    <tr>
                        <td>{{ $fiche->id }}</td>
                        <td>{{ $fiche->date }}</td>
                        <td>{{ $fiche->salle }}</td>
                        <td>{{ $fiche->titreSeance }}</td>
                        <td>{{ $fiche->niveau }}</td>
                        <td class="action-buttons">
                            <form action="{{ route('fiche.destroy', $fiche->id) }}" method="POST" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="action-button">
                                    <i class="fas fa-trash-alt" style="color:red"></i> Supprimer
                                </button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6">Aucune fiche disponible</td>
                    </tr>
                @endforelse
            </tbody>
        </table>

        {{-- Description du tableau des fiches de travaux pratiques --}}
        <h2>Tableau des fiches de travaux pratiques</h2>
        <br/>
        <p>Ce tableau répertorie les fiches de travaux pratiques effectuées par les étudiants sous la supervision d'enseignants.
        <p>Il inclut des informations détaillées comme le titre du TP, le code de l'unité d'enseignement, les objectifs visés,</p>
        <p>les observations réalisées pendant la séance, ainsi que les heures de début et de fin.</p>
        <p>Ce tableau offre également des options pour supprimer des fiches si nécessaire.</p>
        <table>
            <thead>
                <tr>
                    <th>N°</th>
                    <th>Titre séance</th>
                    <th>Code UE</th>
                    <th>Objectifs visés</th>
                    <th>Observations</th>
                    <th>Heure début</th>
                    <th>Heure Fin</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($fichesTP as $ficheTP)
                    <tr>
                        <td>{{ $ficheTP->id }}</td>
                        <td>{{ $ficheTP->titreSeanceTP }}</td>
                        <td>{{ $ficheTP->codeCours }}</td>
                        <td>{{ $ficheTP->objectifsTP }}</td>
                        <td>{{ $ficheTP->observations }}</td>
                        <td>{{ $ficheTP->heureDebut }}</td>
                        <td>{{ $ficheTP->heureFin }}</td>
                        <td class="action-buttons">
                            <form action="{{ route('fiche.destroy', $ficheTP->id) }}" method="POST" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="action-button">
                                    <i class="fas fa-trash-alt" style="color:red"></i> Supprimer
                                </button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="8">Aucune fiche disponible</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection
