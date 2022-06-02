<?php

namespace App\Modules\Contracts\Models;

use App\Modules\Configs\Models\Config;
use App\Modules\Email\Models\MailService;
use App\Modules\Users\Models\User;
use App\Modules\Services\Models\Service;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;


class Contract extends Model implements HasMedia
{
    use InteractsWithMedia;

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('documents');
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'patient_id',
    ];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i',
    ];

    public function services()
    {
        return $this->belongsToMany(Service::class, 'contract_service')->withTimestamps();
    }

    public function patient()
    {
        return $this->belongsTo(User::class, 'patient_id');
    }

    public function services_sum()
    {
        return $this->services->reduce(function ($carry, $service) {
            return $carry + $service->price;
        });
    }

    public function send_email() {
        $contract = $this;
        $mail_service = new MailService();
        $mail_service->sendEmail([
            view('mail_templates.contract', compact('contract')),
            'Вы успешно оформили заказ №' . $this->id,
            'Вы успешно оформили заказ №' . $this->id,
            [
                [
                    'name' => $this->patient->full_name,
                    'email' => $this->patient->email,
                ]
            ]
        ]);
    }
}
