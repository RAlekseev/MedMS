<?php

namespace App\Modules\Email\Models;

use App\Modules\Email\MailServices\SendPulse;


class MailService
{
    private $mail_service;

    public function __construct()
    {
        if (env('SENDPULSE_API_USER_ID')) {
            $this->mail_service = new SendPulse();
        } else {
            $this->mail_service = new SendPulse();
        }
    }

    public function sendEmail($params)
    {
        return $this->mail_service->sendEmail(...$params);
    }
}
