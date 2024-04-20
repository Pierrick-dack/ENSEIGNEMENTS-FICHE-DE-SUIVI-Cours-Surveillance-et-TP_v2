<?php

namespace App\Http\Controllers;


use App\Models\Delegue;
use App\Models\Enseignant;
use Illuminate\Http\Request;

class DashboardProfController extends Controller {

    public function counterRegister() {
        $countEnseignants = Enseignant::count();

        $countDelegues = Delegue::count();

        $totalUsers = $countEnseignants + $countDelegues;

        return redirect()->route('Dashboard_chef')->with('totalUsers', $totalUsers);
    }
}
