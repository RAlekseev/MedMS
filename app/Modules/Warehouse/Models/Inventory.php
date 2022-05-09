<?php

namespace App\Modules\Warehouse\Models;

use Illuminate\Database\Eloquent\Model;


class Inventory extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'amount',
        'unit',
    ];

//    public function getMovementsAttribute()
//    {
//        return $this->belongsToMany(Movement::class, 'inventory_movement')->get()
//            ->map(function ($movement) {
//                return $movement->id;
//            });
//    }
//
//    protected $appends = ['movements'];


    public function movements()
    {
        return $this->belongsToMany(Movement::class, 'inventory_movement')->with(['inventories', 'creator']);
    }
}
