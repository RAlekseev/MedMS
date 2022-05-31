<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Warehouse\Traits\HasCreator;
use App\Modules\Warehouse\Traits\HasInventories;
use Illuminate\Database\Eloquent\Model;


class WarehouseRequest extends Model
{
    use HasInventories;
    use HasCreator;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'creator_id',
        'commented',
        'status_id',
    ];

}
