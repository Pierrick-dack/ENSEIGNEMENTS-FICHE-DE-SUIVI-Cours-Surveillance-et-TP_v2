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
            <br>
            <div class="card-container">
                <a href="{{ route('afficher-formulaire-fiche') }}" class="card new-card">
                    <div class="fiche-icon">
                        <i class="fas fa-plus"></i>
                        <div id="loader" class="loader"></div>
                    </div>
                    <p>Ajouter une nouvelle fiche</p>
                </a>
                <div class="card">
                    <div class="fiche-file">
                        <i class="fas fa-file-pdf"></i>
                    </div>
                    <div class="fiche-text">
                        <h3>Nom de la fiche</h3>
                        <p>Description ou détails supplémentaires sur la fiche de suivi.</p>
                    </div>
                </div>

            </div>
        </section>

        <!-- Deuxième section - Fiche de Travaux pratiques -->
        <section>
            <h2>Fiche de Travaux pratiques</h2>
            <p>Cette fiche permet de suivre les informations importantes concernant une séance de travail pratique.</p>
            <br>
            <div class="card-container">
                <a href="{{ route('user.get') }}" class="card new-card">
                    <div class="fiche-icon">
                        <i class="fas fa-plus"></i>
                        <div id="loader" class="loader"></div>
                    </div>
                    <p>Ajouter une nouvelle fiche</p>
                </a>
                <div class="card">
                    <div class="fiche-file">
                        <i class="fas fa-file-pdf"></i>
                    </div>
                    <div class="fiche-text">
                        <h3>Nom de la fiche</h3>
                        <p>Description ou détails supplémentaires sur la fiche de suivi.</p>
                    </div>
                </div>

            </div>
        </section>
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
