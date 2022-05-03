<?php

namespace App\Modules\Icon\Models;

use Illuminate\Database\Eloquent\Model;


class Icon extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'icon_type_id',
        'source',
    ];

    public function type() {
        return $this->belongsTo(IconType::class, 'icon_type_id');
    }
}
