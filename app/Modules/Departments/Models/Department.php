<?php

namespace App\Modules\Departmeents\Models;

use App\Modules\Icon\Traits\HasIcon;
use App\Modules\Users\Models\User;
use Illuminate\Database\Eloquent\Model;


class Department extends Model
{
    use HasIcon;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'description',
        'icon_id',
    ];

    public function users()
    {
        return $this->hasMany(User::class, 'department_id');
    }
}
