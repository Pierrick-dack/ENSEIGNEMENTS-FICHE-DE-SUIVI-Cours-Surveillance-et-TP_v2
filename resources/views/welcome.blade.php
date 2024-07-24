<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="{{ asset('css/accueil.css') }}">
        <script src="js/redirection.js"></script>
        <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.min.css">
        <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('asset/Images/UY1.png') }}">
        <title>Accueil</title>
        <style>
            .download-btn {
                background-color: #3498db; /* Bleu */
                color: white; /* Texte blanc */
                border-radius: 20px; /* Bords arrondis */
                padding: 10px 20px; /* Padding pour agrandir le bouton */
                display: inline-block; /* Pour garder le lien inline avec des styles de bloc */
                text-decoration: none; /* Supprimer le soulignement du lien */
                transition: background-color 0.3s; /* Transition douce pour le survol */
            }
            .download-btn:hover {
                background-color: #2980b9; /* Un bleu plus foncé au survol */
            }
        </style>
    </head>

    <body>
        <nav>
            <img src="{{ asset('asset/Images/UY1.png') }}" alt="Image Gauche">
            <img src="{{ asset('asset/Images/ICT4D.jpg') }}" alt="Image Droite">
        </nav>


        <div class="welcome-card">
            <div id="message">
                Bienvenue dans votre plateforme de suivi des <b><span id="dynamic-word">Enseignements</span></b>
            </div>
            <img src="{{ asset('asset/Images/welcome.svg') }}" alt="welcome">
        </div>

        <div class="type">
            <button id="mode" onclick="scrollToCardContainer()">
                Get Started
            </button>
            <p>Choisissez un type de connexion parmi les trois options ci-dessous :</p>

            <div class="download-frame border rounded p-3 mt-3">
                <a href="{{ asset('apk/app-release.apk') }}" download="MonApp" class="download-btn">
                    Téléchargez ici la version mobile : <i class="fas fa-download"></i>
                    <i class="fas fa-angle-double-down ml-2"></i>
                </a>
            </div>
        </div>


        <div id="card-container" class="card-container">
            <div class="card">
                <div class="card-content">
                    <h3>Chef de département</h3>
                    <p>En tant que chef de département, consultez les différentes fiches qui ont été remplies, pour le suivi des cours, surveillance et TP.</p>
                    <a href="{{ route('signinchef') }}" class="login-button">
                        <i class="fas fa-sign-in-alt"></i> Connexion
                    </a>
                </div>
                <img src="{{ asset('asset/Images/chef.png') }}" alt="Image de la card">
            </div>

            <div class="card">
                <div class="card-content">
                    <h3>Professeur</h3>
                    <p>En tant que professeur, vous avez la possibilité de créer les fiches de surveillance relatives aux surveillance lors des examens.</p>
                    <a href="{{ route('signinprof') }}" class="login-button">
                        <i class="fas fa-sign-in-alt"></i> Connexion
                    </a>
                </div>
                <img src="{{ asset('asset/Images/prof.png') }}" alt="Image de la card">
            </div>

            <div class="card">
                <div class="card-content">
                    <h3>Délégué</h3>
                    <p>En tant que délégué, vous avez la possibilité de créer les fiches de suivi relatives aux cours et lors des travaux pratiques.</p>
                    <a href="{{ route('signin') }}" class="login-button">
                        <i class="fas fa-sign-in-alt"></i> Connexion
                    </a>
                </div>
                <img src="{{ asset('asset/Images/del.png') }}" alt="Image de la card">
            </div>

        </div>

        <button class="back-to-top" onclick="scrollToTop()"></button>

        <footer>
            <p>ICT4D &copy; 2024 - Tous droits réservés.</p>
        </footer>
    </body>

</html>
