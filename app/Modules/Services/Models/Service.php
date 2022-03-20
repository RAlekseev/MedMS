<?php

namespace App\Modules\Services\Models;

use Illuminate\Database\Eloquent\Model;


class Service extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'price',
        'description',
        'category_id',
    ];

    public function childServices()
    {
        return $this->belongsToMany(Service::class, 'service_service',
            'parent_id', 'child_id');
    }

    public function parentServices()
    {
        return $this->belongsToMany(Service::class, 'service_service',
            'child_id', 'parent_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
}
