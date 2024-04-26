'use strict';
$(function () {
    //Advanced form with validation
    var form = $('#wizard_with_validation').show();
    form.steps({
        headerTag: 'h3',
        bodyTag: 'fieldset',
        transitionEffect: 'slideLeft',
        onInit: function (event, currentIndex) {

            //Set tab width
            var $tab = $(event.currentTarget).find('ul[role="tablist"] li');
            var tabCount = $tab.length;
            $tab.css('width', (100 / tabCount) + '%');

            //set button waves effect
            setButtonWavesEffect(event);

        },
        onStepChanging: function (event, currentIndex, newIndex) {
            if (currentIndex > newIndex) { return true; }

            if (currentIndex < newIndex) {
                form.find('.body:eq(' + newIndex + ') label.error').remove();
                form.find('.body:eq(' + newIndex + ') .error').removeClass('error');
            }

            form.validate().settings.ignore = ':disabled,:hidden';
            return form.valid();
        },
        onStepChanged: function (event, currentIndex, priorIndex) {
            setButtonWavesEffect(event);
            if (currentIndex === 2) { // Assurez-vous que l'index correspond à l'étape de la signature
                initializeSignaturePad();
            }

            var signaturePad;

            function initializeSignaturePad() {
                var canvas = document.getElementById('signature-pad');

                // Assurer que le canvas a les dimensions correctes
                canvas.width = canvas.offsetWidth;
                canvas.height = canvas.offsetHeight;

                if (signaturePad) {
                    signaturePad.off(); // Désactiver l'ancienne instance s'il en existe une
                }

                signaturePad = new SignaturePad(canvas, {
                    backgroundColor: 'rgb(255, 255, 255)',
                    penColor: 'black'
                });

                document.getElementById('clear-signature').addEventListener('click', function () {
                    signaturePad.clear();
                });
            }
        },
        onFinishing: function (event, currentIndex) {
            form.validate().settings.ignore = ':disabled';
            return form.valid();
        },
        onFinished: function (event, currentIndex) {
            enregistrerFicheSurveillance();
            // alert("Good job!", "Submitted!", "success");
        }
    });

    form.validate({
        highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        },
    });


});

function setButtonWavesEffect(event) {
    $(event.currentTarget).find('[role="menu"] li a').removeClass('waves-effect');
    $(event.currentTarget).find('[role="menu"] li:not(.disabled) a').addClass('waves-effect');
}

$(document).ready(function () {
    $('#add-input').click(function (e) {
        e.preventDefault();
        var newInput = `
            <div class="form-group">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="name[]">
                    <div class="input-group-append">
                        <button class="btn btn-danger delete-input" type="button"><i class="fas fa-trash"></i></button>
                    </div>
                </div>
            </div>
        `;
        $('.input-fields').append(newInput);
    });

    // Gestionnaire d'événements pour supprimer le champ d'entrée
    // L'écoute doit se faire sur le conteneur parent direct du bouton pour pouvoir supprimer toute la div 'form-group'
    $(document).on('click', '.delete-input', function () {
        $(this).closest('.form-group').remove(); // Utilisez 'closest' pour remonter jusqu'au 'form-group' parent
    });
});


function enregistrerFicheSurveillance() {
    var form = document.getElementById("wizard_with_validation");
    var formData = new FormData(form);

    var actionUrl = form.getAttribute('data-action-url');

    $.ajax({
        url: actionUrl,
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            alert("Fiche créée avec succès!");
            form.reset();
            signaturePad.clear();
        },
        error: function (xhr) {
            alert("Erreur lors de l'enregistrement de la fiche: " + xhr.responseText);
        }
    });
}



