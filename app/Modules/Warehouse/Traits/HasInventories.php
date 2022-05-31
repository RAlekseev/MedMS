<?php


namespace App\Modules\Warehouse\Traits;

use App\Modules\Warehouse\Models\Inventory;

Trait HasInventories
{
    public function inventories()
    {
        return $this->belongsToMany(Inventory::class, 'inventory_movement')->withPivot(['amount']);
    }

}
