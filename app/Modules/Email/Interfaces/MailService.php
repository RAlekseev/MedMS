<?php

namespace App\Modules\Email\Interfaces;

interface MailService
{
    public function sendEmail($html, string $text, string $subject, Array $to);
}