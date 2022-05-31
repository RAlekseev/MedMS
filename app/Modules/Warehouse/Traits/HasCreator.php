<?php


namespace App\Modules\Warehouse\Traits;

use App\Modules\Users\Models\User;

Trait HasCreator
{
    public function creator()
    {
        return $this->belongsTo(User::class, 'creator_id');
    }
}
