@extends('base_prof')
@section('title', 'ICT FOLLOW UP - Accueil')

@section('content')
    <section class="section">
        <div class="row ">
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">Fiches</h5>
                                        <h2 class="mb-3 font-18">...</h2>
                                        <p class="mb-0"><span class="col-green">...</span> ...</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <br>
                                        <img src="{{ asset('asset/attached.svg') }}" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15"> Customers</h5>
                                        <h2 class="mb-3 font-18">...</h2>
                                        <p class="mb-0"><span class="col-orange">...</span> ...</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="{{ asset('assets/img/banner/2.png') }}" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">New Project</h5>
                                        <h2 class="mb-3 font-18">...</h2>
                                        <p class="mb-0">
                                            <span class="col-green">...</span>
                                            ...
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="{{ asset('assets/img/banner/3.png') }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">Revenue</h5>
                                        <h2 class="mb-3 font-18">...</h2>
                                        <p class="mb-0"><span class="col-green">...</span> ...</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="{{ asset('assets/img/banner/4.png') }}" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-lg-12">
                <div class="card ">
                    <div class="card-header">
                        <h4>Fiche de surveillance</h4>
                        <div class="card-header-action">
                            <a href="#" class="btn btn-icon icon-left btn-primary">
                                <i class="far fa-edit"></i>
                                Ajouter
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Informations</h4>
                    </div>
                    <div class="card-body">
                        <form id="wizard_with_validation" data-action-url="{{ route('creer_fiches_surveillance') }}" method="POST" >
                            @csrf
                            <h3>Etape 1</h3>
                            <fieldset>
                                <div class="form-row form-float">
                                    <div class="form-group col-md-8">
                                        <label for="chefdesalle" class="form-label">Chef de salle (Enseignant)*</label>
                                        <input type="text" class="form-control" name="chefdesalle" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="salle" class="form-label">Salle</label>
                                        <input type="text" class="form-control" name="salle" required>
                                    </div>
                                </div>
                                <div class="form-row form-float">
                                    <div class="form-group col-md-6">
                                        <label for="date" class="form-label">Date</label>
                                        <input type="Date" class="form-control" name="date" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="session" class="form-label">Session</label>
                                        <input type="text" class="form-control" name="session" required>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="codeCours" class="form-label">Code UE</label>
                                        <select id="codeCours" class="form-control" name="codeCours" required>
                                            <option>Sélectionnez un cours</option>
                                            @foreach($codes as $code)
                                                <option value="{{ $code->codeUE }}">{{ $code->codeUE }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <label for="intituleUE" class="form-label">Intitule UE*</label>
                                        <select id="intituleUE" class="form-control" name="intituleUE" required>
                                            <option>Sélectionnez son libelle</option>
                                            @foreach($codes as $code)
                                                <option value="{{ $code->intituleUE }}">{{ $code->intituleUE }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </fieldset>


                            <h3>Etape 2</h3>
                            <fieldset>
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
                            </fieldset>


                            <h3>Signature</h3>
                            <fieldset style="display: block;">
                                <input id="presence_confirmee" name="presence_confirmee" type="checkbox" required>
                                <label for="presence_confirmee">Je confirme la présence de tous les surveillants.</label><br>

                                <div id="signature-container" style="margin-top: 20px; position: relative;">
                                    <label for="signature-pad">Signature du chef de salle:</label><br>
                                    <div style="position: relative; width: 400px; height: 200px;">
                                        <canvas id="signature-pad-back" style="position: absolute; left: 0; top: 0; z-index: 1; width: 100%; height: 100%; border: 1px solid #000;"></canvas>
                                        <canvas id="signature-pad" style="position: absolute; left: 0; top: 0; z-index: 2; width: 100%; height: 100%; border: 1px solid #000;"></canvas>
                                    </div>
                                    <button type="button" id="clear-signature" class="btn btn-icon btn-danger" style="margin-top: 10px;"><i class="fas fa-times"></i> Effacer</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>






@endsection
