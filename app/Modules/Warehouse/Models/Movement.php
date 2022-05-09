<?php

namespace App\Modules\Warehouse\Models;

use App\Models\User;
use App\Modules\Services\Models\Service;
use Illuminate\Database\Eloquent\Model;


class Movement extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
//        'patient_id',
    ];

    public function creator()
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function inventories()
    {
        return $this->belongsToMany(Inventory::class, 'inventory_movement')->withPivot(['amount']);
    }

}
