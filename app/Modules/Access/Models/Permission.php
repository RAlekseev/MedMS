<?php

namespace App\Modules\Access\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;


class Permission extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'slug',
    ];

    protected $hidden = ['pivot'];

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_permission');
    }

}
