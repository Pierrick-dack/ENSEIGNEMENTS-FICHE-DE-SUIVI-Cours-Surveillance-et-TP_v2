<div class="main-sidebar sidebar-style-2">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('Dashboard_prof') }}"> <img alt="image" src="{{ asset('asset/Images/ICT4D.jpg') }}" class="header-logo" />
                <span class="logo-name">
                    ICT FOLLOW UP
                </span>
            </a>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">Main</li>
            <li class="dropdown active">
                <a href="{{ route('Dashboard_prof') }}" class="nav-link">
                    <i data-feather="monitor"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="menu-header">Others</li>
            <li>
                <a class="nav-link" href="{{ route('VoirFicheSurvey') }}">
                    <i data-feather="grid"></i>
                    <span>Fiches de surveillance</span>
                </a>
            </li>
        </ul>
    </aside>
</div>
