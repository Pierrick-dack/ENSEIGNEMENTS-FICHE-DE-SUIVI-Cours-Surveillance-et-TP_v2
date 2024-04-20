@extends('base')
@section('title', 'Bienvenu Délégué')

@section('styles')
    <link rel="stylesheet" href="{{ asset('css/accueilDel.css') }}">
@endsection



@section('content')
    <div class="global">
        <!-- Première section - Fiche de suivi -->
        <section>
            <h2>Fiche de suivi</h2>
            <p>Cette fiche permet de suivre les informations importantes concernant une séance d'enseignement.</p>
            <div class="card-container">
                <!-- Nouvelle carte pour ajouter une fiche -->
                <!-- Nouvelle carte pour ajouter une fiche avec lien vers la page de création -->
                <a href="{{ route('afficher-formulaire-fiche') }}" class="card new-card">
                    <div class="fiche-icon">
                        <!-- Utilisation de l'icône "+" de Font Awesome -->
                        <i class="fas fa-plus"></i>
                        <div id="loader" class="loader"></div>
                    </div>
                    <p>Ajouter une nouvelle fiche</p>
                </a>



                <!-- Cartes de la section Fiche de suivi -->
                <div class="card">
                    <!-- Fichier de la fiche -->
                    <div class="fiche-file">
                        <!-- Ajoutez ici le contenu du fichier, comme un bouton ou une icône -->
                        <i class="fas fa-file-pdf"></i> <!-- Exemple d'icône pour un fichier PDF -->
                    </div>
                    <!-- Texte de la fiche -->
                    <div class="fiche-text">
                        <h3>Nom de la fiche</h3>
                        <p>Description ou détails supplémentaires sur la fiche de suivi.</p>
                    </div>
                </div>

            </div>
        </section>

        <!-- Deuxième section - Fiche de surveillance -->
        <section>
            <h2>Fiche de surveillance</h2>
            <p>Cette fiche est utilisée pour consigner les informations liées à la surveillance d'examens ou de sessions de travail.</p>
            <div class="card-container">
                <div class="card new-card">
                    <div class="fiche-icon">
                        <!-- Utilisation de l'icône "+" de Font Awesome -->
                        <i class="fas fa-plus"></i>
                    </div>
                    <p>Ajouter une nouvelle fiche</p>
                </div>
            </div>
        </section>
{{--
        <!-- Troisième section - Fiches de Travaux Pratiques -->
        <section>
            <h2>Fiches de Travaux Pratiques</h2>
            <p>Ces fiches sont conçues pour enregistrer les détails des travaux pratiques réalisés en laboratoire ou en salle spécialisée.</p>
            <div class="card-container">
                <div class="card new-card">
                    <div class="fiche-icon">
                        <!-- Utilisation de l'icône "+" de Font Awesome -->
                        <i class="fas fa-plus"></i>
                    </div>
                    <p>Ajouter une nouvelle fiche</p>
                </div>
            </div>
        </section> --}}
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Sélectionnez le lien
            var addFicheLink = document.querySelector('.new-card');

            // Ajoutez un écouteur d'événement au clic sur le lien
            addFicheLink.addEventListener('click', function (event) {
                // Empêchez la redirection par défaut
                event.preventDefault();

                // Affichez le loader
                var loader = document.getElementById('loader');
                loader.style.display = 'block';

                // Récupérez l'URL de redirection du lien
                var redirectURL = addFicheLink.getAttribute('href');

                // Redirigez après un court délai (simulé ici par setTimeout)
                setTimeout(function () {
                    window.location.href = redirectURL;
                }, 3000); // Vous pouvez ajuster la durée du délai

                // Assurez-vous que le loader disparaît même si la redirection ne se produit pas
                window.addEventListener('beforeunload', function () {
                    loader.style.display = 'none';
                });
            });
        });
    </script>

@endsection
