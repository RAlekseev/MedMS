<?php

namespace App\Modules\Email\Interfaces;

interface MailService
{
    public function sendEmail(string $text, string $subject, Array $to);
}