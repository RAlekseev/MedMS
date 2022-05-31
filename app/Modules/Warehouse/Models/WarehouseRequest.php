<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Warehouse\Traits\HasCreator;
use App\Modules\Warehouse\Traits\HasInventories;
use Illuminate\Database\Eloquent\Model;


class WarehouseRequest extends Model
{
    use HasInventories;
    use HasCreator;

    private $statuses = [
        1 => ['text' => 'Создано', 'text_class' => 'text-warning'],
        2 => ['text' => 'Одобрено', 'text_class' => 'text-success'],
        3 => ['text' => 'Отклонено', 'text_class' => 'text-danger'],
    ];
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'creator_id',
        'comment',
        'status_id',
    ];

    public function getStatusAttribute()
    {
        return $this->statuses[$this->status_id];
    }
}
