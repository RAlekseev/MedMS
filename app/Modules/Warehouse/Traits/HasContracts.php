<?php


namespace App\Modules\Contracts\Traits;

use App\Modules\Contracts\Models\Contract;

Trait HasContracts
{
    public function contracts()
    {
        return $this->hasMany(Contract::class, 'patient_id');
    }
}
