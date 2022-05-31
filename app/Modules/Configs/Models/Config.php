<?php

namespace App\Modules\Configs\Models;

use Illuminate\Database\Eloquent\Model;


class Config extends Model
{
    protected $fillable = [
        'value',
    ];

    public static function value($slug) {
        $config = Config::where('slug', $slug)->first();
        return $config ? $config->value : null;
    }
}
