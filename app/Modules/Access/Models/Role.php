<?php

namespace App\Modules\Access\Models;

use App\Modules\Users\Models\User;
use Illuminate\Database\Eloquent\Model;


class Role extends Model
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

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'role_permission');
    }

    protected $with = ['users', 'permissions'];
}
