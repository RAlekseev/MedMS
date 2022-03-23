<?php

namespace App\Modules\Contracts\Models;

use App\Modules\Services\Models\Service;
use Illuminate\Database\Eloquent\Model;


class Contract extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'patient_id',
    ];

    protected $casts = [
        'created_at' => 'datetime:d.m.Y H:i',
    ];

    public function services()
    {
        return $this->belongsToMany(Service::class, 'contract_service')->withTimestamps();
    }

}
