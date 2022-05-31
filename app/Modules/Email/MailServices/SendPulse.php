<?php

namespace App\Modules\Email\MailServices;

use App\Modules\Email\Interfaces\MailService;
use Sendpulse\RestApi\ApiClient;
use Sendpulse\RestApi\Storage\FileStorage;

class SendPulse implements MailService
{
    public function sendEmail(string $text, string $subject, Array $to)
    {
        $SPApiClient = new ApiClient(env('SENDPULSE_API_USER_ID'), env('SENDPULSE_API_SECRET'), new FileStorage());
        $email = array(
            'html' => `<p>{$text}</p>`,
            'text' => $text,
            'subject' => $subject,
            'from' => array(
                'name' => 'John',
                'email' => 'sender@example.com',
            ),
            'to' => $to,
            'bcc' => array(
                array(
                    'name' => 'Manager',
                    'email' => 'manager@example.com',
                ),
            ),
            'attachments' => array(
                'file.txt' => file_get_contents(PATH_TO_ATTACH_FILE),
            ),
        );

        return $SPApiClient->smtpSendMail($email);
    }
}