<?php

namespace App\Modules\Icon\Models;

use Illuminate\Database\Eloquent\Model;


class IconType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [

    ];

    protected $casts = [
        'icon_list' => 'array'
    ];

    public function icons() {
        return $this->hasMany(Icon::class, 'icon_type_id');
    }
}
