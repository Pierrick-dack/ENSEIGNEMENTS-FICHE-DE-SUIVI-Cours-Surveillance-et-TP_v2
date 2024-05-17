@extends('base_fiche')
@section('title', 'Fiche de Travaux Pratiques')

@section('styles')
		<link rel="stylesheet" href="{{ asset('css/fiche.css') }}">
@endsection

@section('scripts')
    <script type="module" src="JS/fiche.js"></script>
@endsection

@section('content')
    <a href="{{ route('accueilDel') }}" class="returnLink">
        <button class="returnButton">
            <i class="fas fa-arrow-left"></i>
        </button>
    </a>

    <div class="form-container">
        <h2>Université de Yaoundé I</h2>
        <header>
            <div class="logo">
                <img src="{{ asset('asset/Images/UY1.png') }}" alt="Logo de l'université">
                <h1>Fiche de Travaux Pratiques</h1>
            </div>
        </header>

        <form action="{{ route('enregistrer-fiche-tp') }}" method="post" class="needs-validation" id="ficheFormTP" novalidate>
            @csrf
            <div class="form-row">
                <div class="form-group">
                    <label for="titreSeanceTP">Titre du TP</label>
                    <input type="text" id="titreSeanceTP" name="titreSeanceTP" required>
                </div>
                <div class="form-group">
                    <label for="enseignant">Nom de l'enseignant</label>
                    <select id="enseignant" name="enseignant" class="form-control" required>
                        <option value="">Sélectionnez un enseignant</option>
                        @foreach($enseignants as $enseignant)
                            <option value="{{ $enseignant->nomEns }}">{{ $enseignant->nomEns }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="codeCours">Code du cours</label>
                    <select id="codeCours" name="codeCours" class="form-control" required>
                        <option value="">Sélectionnez un cours</option>
                        @foreach($cours as $cour)
                            <option value="{{ $cour->codeUE }}">{{ $cour->codeUE }}</option>
                        @endforeach
                    </select>
                </div>

            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="heureDebut">Heure de début</label>
                    <input type="time" id="heureDebut" name="heureDebut" required>
                </div>
                <div class="form-group">
                    <label for="heureFin">Heure de fin</label>
                    <input type="time" id="heureFin" name="heureFin" required>
                </div>
                <div class="form-group">
                    <label for="totalHeures">Total d'heures</label>
                    <input type="text" id="totalHeures" name="totalHeures" readonly>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="objectifsTP">Objectifs du TP</label>
                    <textarea id="objectifsTP" name="objectifsTP" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label for="materielNecessaire">Matériel nécessaire</label>
                    <textarea id="materielNecessaire" name="materielNecessaire" rows="2" required></textarea>
                </div>
                <div class="form-group">
                    <label for="procedureTP">Procédure de TP</label>
                    <textarea id="procedureTP" name="procedureTP" rows="4" required></textarea>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="observations">Observations</label>
                    <textarea id="observations" name="observations" rows="2" required></textarea>
                </div>
                <div class="form-group">
                    <label for="resultatsAttendus">Résultats attendus</label>
                    <textarea id="resultatsAttendus" name="resultatsAttendus" rows="2" required></textarea>
                </div>
            </div>
            <!-- Ajout des cadres pour les signatures -->
            <div class="form-sign-row">
                <div class="form-sign">
                    <label for="signatureDelegueTP">Signature du Délégué</label>
                    <div id="signatureDelegueTPBox" class="signature-box"></div>
                    <button type="button" onclick="clearSignature('signatureDelegueTPBox')" class="cancel-btn"><i class="fas fa-trash"></i></button>
                </div>
                <div class="form-sign">
                    <label for="signatureProfTP">Signature du Professeur</label>
                    <div id="signatureProfTPBox" class="signature-box"></div>
                    <button type="button" onclick="clearSignature('signatureProfTPBox')" class="cancel-btn"><i class="fas fa-trash"></i></button>
                </div>
            </div><br>

            <!-- Boutons de confirmation de la fiche TP -->
            <div class="form-btn">
                <button type="button" id="enregistrerBtnTP">Enregistrer</button>
                <button type="button" id="annulerBtnTP" onclick="resetForm()">Annuler</button>
            </div>
        </form>
    </div>

    <!-- Modal de confirmation de la fiche TP -->
    <div id="confirmationModalTP" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeConfirmationModal()">&times;</span>
            <label for="fileNameTP">Nom du fichier PDF</label>
            <input type="text" id="fileNameTP" placeholder="Nom du fichier">
            <button class="confirm-btn" id="confirmationOuiBtnTP">Télécharger</button>
            <button class="cancel-btn" onclick="closeConfirmationModal()">Annuler</button>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2023–2024 Université de Yaoundé I</p>
    </footer>



    <script>
        function enregistrerFiche() {
            // Récupérez les données du formulaire
            var formData = new FormData(document.getElementById("ficheFormTP"));

            // Effectuez une requête Ajax vers la route de sauvegarde
            $.ajax({
                url: "{{ route('enregistrer-fiche-tp') }}",
                method: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    // Réinitialisez le formulaire et affichez un message de succès
                    document.getElementById("ficheFormTP").reset();
                    clearSignature('signatureDelegueTPBox');
                    clearSignature('signatureProfTPBox');
                },
                error: function(xhr, status, error) {
                    // Gérez les erreurs de la requête Ajax
                    alert("Une erreur s'est produite lors de la sauvegarde de la fiche.");
                    console.log(xhr.responseText);
                }
            });
        }

            // Écouter le clic sur le bouton "Enregistrer"
            document.getElementById('enregistrerBtnTP').addEventListener('click', function() {
                openConfirmationModal();
            });

            // Fonction pour ouvrir le modal de confirmation
            function openConfirmationModal() {
                document.getElementById('confirmationModalTP').style.display = 'block';
            }

            // Fonction pour fermer le modal de confirmation
            function closeConfirmationModal() {
                document.getElementById('confirmationModalTP').style.display = 'none';
            }

            // Écouter le clic sur le bouton "Oui" dans le modal de confirmation
            document.getElementById('confirmationOuiBtnTP').addEventListener('click', function() {
                enregistrerFiche();
                closeConfirmationModal();
                // Ajouter d'autres actions comme l'enregistrement de la fiche ou la génération du PDF
            });

            // Écouter le clic sur le bouton "Annuler" dans le modal de confirmation
            document.getElementById('annulerBtnTP').addEventListener('click', closeConfirmationModal);

                    // Fonctions pour les signatures
        function initSignature(signatureBoxId) {
            var canvas = document.createElement("canvas");
            var signatureBox = document.getElementById(signatureBoxId);
            signatureBox.appendChild(canvas);

            var ctx = canvas.getContext("2d");
            var drawing = false;

            function startDrawing(e) {
                drawing = true;
                ctx.beginPath();
                var rect = canvas.getBoundingClientRect();
                ctx.moveTo(e.clientX - rect.left, e.clientY - rect.top);
            }

            function draw(e) {
                if (!drawing) return;
                var rect = canvas.getBoundingClientRect();
                ctx.lineTo(e.clientX - rect.left, e.clientY - rect.top);
                ctx.stroke();
            }

            function endDrawing() {
                drawing = false;
            }

            // Gestionnaire d'événements pour le début, le dessin, la fin et l'annulation du dessin
            canvas.addEventListener("mousedown", startDrawing);
            canvas.addEventListener("mousemove", draw);
            canvas.addEventListener("mouseup", endDrawing);
            canvas.addEventListener("mouseout", endDrawing);
        }

        function clearSignature(signatureBoxId) {
            var signatureBox = document.getElementById(signatureBoxId);
            var canvas = signatureBox.querySelector("canvas");
            var ctx = canvas.getContext("2d");
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }
        // Appel des fonctions pour initialiser les signatures
        document.addEventListener("DOMContentLoaded", function () {
            initSignature("signatureDelegueTPBox");
            initSignature("signatureProfTPBox");
        });

        document.addEventListener('DOMContentLoaded', function() {
            // Fonction pour calculer le total d'heures
            function calculerTotalHeures() {
                var heureDebut = document.getElementById('heureDebut').value;
                var heureFin = document.getElementById('heureFin').value;

                // Convertir les heures en objets Date
                var debut = new Date('1970-01-01T' + heureDebut + 'Z');
                var fin = new Date('1970-01-01T' + heureFin + 'Z');

                // Calculer la différence en millisecondes
                var difference = fin - debut;

                // Calculer les heures et les minutes
                var totalHeures = Math.floor(difference / (1000 * 60 * 60));
                var totalMinutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));

                // Mettre à jour le champ du total d'heures
                document.getElementById('totalHeures').value = totalHeures + " heure(s) : " + totalMinutes + " min";
            }

            // Écouter les changements dans les champs d'heure
            document.getElementById('heureDebut').addEventListener('input', calculerTotalHeures);
            document.getElementById('heureFin').addEventListener('input', calculerTotalHeures);
        });


    </script>
@endsection
