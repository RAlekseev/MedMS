<?php


namespace App\Modules\Warehouse\Traits;

use App\Modules\Warehouse\Models\WarehouseRequest;

Trait HasWarehouseRequest
{
    public function warehouse_requests()
    {
        return $this->hasMany(WarehouseRequest::class, 'creator_id');
    }
}
