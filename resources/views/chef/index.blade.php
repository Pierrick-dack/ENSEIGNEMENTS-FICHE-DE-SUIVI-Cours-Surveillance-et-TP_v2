@extends('base_chef')
@section('title', 'ICT FOLLOW UP | Accueil')

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('welcome') }}">Bienvenue</a></li>
                            <li class="breadcrumb-item active">Accueil</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>150</h3>
                                <p>New Orders</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>

                                <p>Bounce Rate</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>{{ session('totalUsers') }}</h3>
                                <p>User Registrations</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>65</h3>
                                <p>Unique Visitors</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->

                <!-- New Section for Classes -->
                <div class="row mt-5">
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h1 class="card-title">ICTL1</h1>
                                <p class="card-text">Cliquez sur le bouton ci-dessous pour plus d'informations concernant ICTL1.</p>
                                <a href="{{ route('ictl1') }}" class="btn btn-light">Voir la page</a>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-secondary text-white">
                            <div class="card-body">
                                <h3 class="card-title">ICTL2</h3>
                                <p class="card-text">Cliquez sur le bouton ci-dessous pour plus d'informations concernant ICTL2.</p>
                                <a href="{{ route('ictl2') }}" class="btn btn-light">Voir la page</a>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-info text-white">
                            <div class="card-body">
                                <h3 class="card-title">ICTL3</h3>
                                <p class="card-text">Cliquez sur le bouton ci-dessous pour plus d'informations concernant ICTL3.</p>
                                <a href="#" class="btn btn-light">Voir la page</a>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h3 class="card-title">M1SIGL</h3>
                                <p class="card-text">Cliquez sur le bouton ci-dessous pour plus d'informations concernant M1SIGL.</p>
                                <a href="#" class="btn btn-light">Voir la page</a>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-warning text-white">
                            <div class="card-body">
                                <h3 class="card-title">M2SIGL</h3>
                                <p class="card-text">Cliquez sur le bouton ci-dessous pour plus d'informations concernant M2SIGL.</p>
                                <a href="#" class="btn btn-light">Voir la page</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->

        <!-- Modal -->
        <div class="modal fade" id="createClassModal" tabindex="-1" role="dialog" aria-labelledby="createClassModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createClassModalLabel">Créer une nouvelle classe</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="createClassForm">
                            @csrf
                            <div class="form-group">
                                <label for="className">Nom de la classe</label>
                                <input type="text" class="form-control" id="className" name="className" required>
                            </div>
                            <div class="form-group">
                                <label for="classDescription">Description de la classe</label>
                                <textarea class="form-control" id="classDescription" name="classDescription" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Créer</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            $('#createClassForm').on('submit', function (e) {
                e.preventDefault();

                var formData = {
                    className: $('#className').val(),
                    classDescription: $('#classDescription').val(),
                    _token: $('input[name="_token"]').val()
                };

                $.ajax({
                    type: 'POST',
                    url: '{{ route('classes.store') }}', // Assurez-vous que cette route existe
                    data: formData,
                    success: function (response) {
                        if (response.success) {
                            // Fermer le modal
                            $('#createClassModal').modal('hide');

                            // Ajouter la nouvelle classe au tableau de bord
                            var newClassCard = `
                            <div class="col-lg-4 col-6">
                                <div class="card bg-primary text-white">
                                    <div class="card-body">
                                        <h3 class="card-title">${response.class.name}</h3>
                                        <p class="card-text">${response.class.description}</p>
                                        <a href="#" class="btn btn-light">Voir la page</a>
                                    </div>
                                </div>
                            </div>`;
                            $('.row.mt-5').append(newClassCard);
                        }
                    },
                    error: function (response) {
                        alert('Erreur lors de la création de la classe');
                    }
                });
            });
        });
    </script>


@endsection
