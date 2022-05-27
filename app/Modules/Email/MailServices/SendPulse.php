<?php

namespace App\Modules\Email\MailServices;

use App\Modules\Email\Interfaces\MailService;
use Sendpulse\RestApi\ApiClient;
use Sendpulse\RestApi\Storage\FileStorage;

class SendPulse implements MailService
{
    public function sendEmail($from, $to)
    {
        $SPApiClient = new ApiClient(API_USER_ID, API_SECRET, new FileStorage());
        $email = array(
            'html' => '<p>Hello!</p>',
            'text' => 'Hello!',
            'subject' => 'Mail subject',
            'from' => array(
                'name' => 'John',
                'email' => 'sender@example.com',
            ),
            'to' => array(
                array(
                    'name' => 'Subscriber Name',
                    'email' => 'subscriber@example.com',
                ),
            ),
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

        $SPApiClient->smtpSendMail($email);
    }
}