<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>@yield('title')</title>

        <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('asset/Images/UY1.png') }}">
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css') }}">
        <!-- Theme style -->
        <link rel="stylesheet" href="{{ asset('dist/css/adminlte.min.css') }}">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="{{ asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/jqvmap/jqvmap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/summernote/summernote-bs4.min.css') }}">
        <link rel="stylesheet" href="{{ asset('../../plugins/jsgrid/jsgrid.min.css') }}">
        <link rel="stylesheet" href="{{ asset('../../plugins/jsgrid/jsgrid-theme.min.css') }}">


    </head>
	<body class="hold-transition sidebar-mini">
		<div class="wrapper">
			<!-- Navbar -->
			<nav class="main-header navbar navbar-expand navbar-white navbar-light">
				<!-- Left navbar links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
					</li>
					<li class="nav-item d-none d-sm-inline-block">
						<a href="#" class="nav-link">Accueil</a>
					</li>
					<li class="nav-item d-none d-sm-inline-block">
						<a href="#" class="nav-link">Contact</a>
					</li>
				</ul>

				<!-- Right navbar links -->
				<ul class="navbar-nav ml-auto">
					<!-- Navbar Search -->
					<li class="nav-item">
						<a class="nav-link" data-widget="navbar-search" href="#" role="button">
							<i class="fas fa-search"></i>
						</a>
						<div class="navbar-search-block">
							<form class="form-inline">
								<div class="input-group input-group-sm">
									<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
									<div class="input-group-append">
										<button class="btn btn-navbar" type="submit">
											<i class="fas fa-search"></i>
										</button>
										<button class="btn btn-navbar" type="button" data-widget="navbar-search">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</li>

					<!-- Messages Dropdown Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link" data-toggle="dropdown" href="#">
							<i class="far fa-comments"></i>
							<span class="badge badge-danger navbar-badge">3</span>
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<a href="#" class="dropdown-item">
								<!-- Message Start -->
								<div class="media">
									<img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
									<div class="media-body">
										<h3 class="dropdown-item-title">
											Brad Diesel
											<span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
										</h3>
										<p class="text-sm">Call me whenever you can...</p>
										<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
									</div>
								</div>
								<!-- Message End -->
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
						</div>
					</li>
					<!-- Notifications Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-bell"></i>
                            @auth
                                @php
                                    $unreadNotificationCount = auth()->user()->unreadNotifications->count();
                                @endphp
                                @if ($unreadNotificationCount > 0)
                                    <span class="badge badge-warning navbar-badge">{{ $unreadNotificationCount }}</span>
                                @endif
                            @endauth
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            @auth
                                @if ($unreadNotificationCount > 0)
                                    <span class="dropdown-item dropdown-header">{{ $unreadNotificationCount }} Notifications</span>
                                    <div class="dropdown-divider"></div>
                                    @foreach (auth()->user()->unreadNotifications as $notification)
                                        <a href="{{ $notification->data['link'] }}" class="dropdown-item">
                                            <i class="fas fa-envelope mr-2"></i> {{ $notification->data['message'] }}
                                            <span class="float-right text-muted text-sm">{{ $notification->created_at->diffForHumans() }}</span>
                                        </a>
                                        <div class="dropdown-divider"></div>
                                    @endforeach
                                    <a href="#" class="dropdown-item dropdown-footer">Voir toutes les notifications</a>
                                @else
                                    <span class="dropdown-item dropdown-header">Aucune notification</span>
                                @endif
                            @endauth
                        </div>
                    </li>


					<li class="nav-item">
						<a class="nav-link" data-widget="fullscreen" href="#" role="button">
							<i class="fas fa-expand-arrows-alt"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
							<i class="fas fa-th-large"></i>
						</a>
					</li>
				</ul>
			</nav>
			<!-- /.navbar -->

            @yield('content')


            @include('partials.aside_modal')


            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 2.0
                </div>
                <strong>Copyright &copy; 2023-2024 <a href="#">ICT4D</a>uy1</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
        <script src="{{ asset('plugins/jquery-ui/jquery-ui.min.js') }}"></script>
        <script>
        $.widget.bridge('uibutton', $.ui.button);
        </script>
        <script src="{{ asset('plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
        <script src="{{ asset('plugins/sparklines/sparkline.js') }}"></script>
        <script src="{{ asset('plugins/jqvmap/jquery.vmap.min.js') }}"></script>
        <script src="{{ asset('plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
        <script src="{{ asset('plugins/jquery-knob/jquery.knob.min.js') }}"></script>
        <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
        <script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
        <script src="{{ asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
        <script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }}"></script>
        <script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
        <script src="{{ asset('dist/js/adminlte.js') }}"></script>
        <script src="{{ asset('dist/js/pages/dashboard.js') }}"></script>
        <script src="../../plugins/jsgrid/demos/db.js"></script>
        <script src="{{ asset('../../plugins/jsgrid/jsgrid.min.js') }}"></script>
    </body>
</html>
