<?php

namespace App\Modules\Services\Models;

use Illuminate\Database\Eloquent\Model;


class Category extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'is_public',
        'category_id',
    ];

    public function services()
    {
        return $this->hasMany(Service::class, 'category_id');
    }

    public function getParentServicesAttribute()
    {
        return $this->services()->with(['parentServices'])->filter(function ($service) {
            return $service->parentServices->count();
        });
    }

    public function subCategories()
    {
        return $this->hasMany(Category::class, 'category_id');
    }

}
