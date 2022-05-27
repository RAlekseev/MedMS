<?php

namespace App\Modules\Email\Interfaces;

interface MailService
{
    public function sendEmail($from, $to);
}