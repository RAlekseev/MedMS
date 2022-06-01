<?php

namespace App\Modules\Email\MailServices;

use App\Modules\Email\Interfaces\MailService;
use Sendpulse\RestApi\ApiClient;
use Sendpulse\RestApi\Storage\FileStorage;

class SendPulse implements MailService
{
    public function sendEmail($html, string $text, string $subject, Array $to)
    {
        $SPApiClient = new ApiClient(env('SENDPULSE_API_USER_ID'), env('SENDPULSE_API_SECRET'), new FileStorage());
        $email = array(
            'html' => $html,
            'text' => $text,
            'subject' => $subject,
            'from' => array(
                'name' => 'IMU Clinic',
                'email' => 'admin@medms.org',
            ),
            'to' => $to,
        );

        return $SPApiClient->smtpSendMail($email);
    }
}