<?php

namespace App\Models;

use App\Modules\Contracts\Traits\HasContracts;
use App\Modules\Access\Traits\HasRolesAndPermissions;
use App\Modules\WorkingHour\Models\WorkingHour;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Modules\Access\Models\Permission;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRolesAndPermissions, HasContracts;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'email',
        'first_name',
        'last_name',
        'middle_name',
        'birthday',
        'phone',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'birthday' => 'date:d.m.Y',
    ];

    protected $appends = [
        'full_name'
    ];

    protected function name_array()
    {
        return [
            $this->last_name,
            $this->first_name,
            $this->middle_name,
        ];
    }

    public function getFullNameAttribute()
    {
        return implode(' ', $this->name_array());
    }

    public static function employees()
    {
        return Permission::where('slug', 'employee')->get()->first()->users();
    }

    public function working_hours()
    {
        return $this->hasMany(WorkingHour::class, 'user_id');
    }
}
