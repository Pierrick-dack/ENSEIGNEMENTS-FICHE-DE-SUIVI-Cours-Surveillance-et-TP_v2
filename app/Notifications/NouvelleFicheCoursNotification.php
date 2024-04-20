<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NouvelleFicheCoursNotification extends Notification {
    use Queueable;

    public function __construct()
    {
        //
    }

    public function via($notifiable)
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'Une nouvelle fiche de suivi de cours a été remplie.',
            'link' => '/lien-vers-la-page-de-gestion-des-fiches', // Remplacez par le lien approprié
        ];
    }
}
