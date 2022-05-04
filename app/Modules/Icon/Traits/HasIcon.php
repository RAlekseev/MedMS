<?php


namespace App\Modules\Icon\Traits;


use App\Modules\Icon\Models\Icon;

Trait HasIcon
{
    public function icon() {
        return $this->belongsTo(Icon::class, 'icon_id');
    }
}
