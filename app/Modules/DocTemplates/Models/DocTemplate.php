<?php

namespace App\Modules\DocTemplates\Models;

use Illuminate\Database\Eloquent\Model;


class DocTemplate extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'html',
        'table',
    ];

}
