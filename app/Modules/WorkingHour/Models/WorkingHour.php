<?php

namespace App\Modules\WorkingHour\Models;

use Illuminate\Database\Eloquent\Model;


class WorkingHour extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'start',
        'end',
        'user_id',
    ];


    protected $casts = [
        'start' => 'datetime:Y-m-d\TH:i:s',
        'end'  => 'datetime:Y-m-d\TH:i:s',
    ];

    public $timestamps = false;
}
