<?php

namespace App\Modules\Users\Models;

use App\Modules\Configs\Models\Config;
use App\Modules\Contracts\Traits\HasContracts;
use App\Modules\Access\Traits\HasRolesAndPermissions;
use App\Modules\Email\Models\MailService;
use App\Modules\Warehouse\Traits\HasWarehouseRequest;
use App\Modules\WorkingHour\Models\WorkingHour;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Modules\Access\Models\Permission;
use Illuminate\Support\Str;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRolesAndPermissions, HasContracts, HasWarehouseRequest;

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
        'department_id',
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

    public static function create_from_request($user_array, $password = null) {
        $password = $password ?? strtolower(Str::random(8));

        $user = User::create([
            'first_name' => $user_array['first_name'],
            'last_name' => $user_array['last_name'],
            'middle_name' => array_key_exists('middle_name', $user_array) ? $user_array['middle_name'] : '',
            'email' => $user_array['email'],
            'phone' => $user_array['phone'],
            'password' => bcrypt($password),
        ]);

        $mail_service = new MailService();
        $mail_service->sendEmail([
            view('mail_templates.init_user', compact('user', 'password')),
            'Вы успешно зарегистрированы в системе организации ' . Config::value('org_name'),
            'Данные для входа в систему',
            [
                [
                    'name' => $user->full_name,
                    'email' => $user->email,
                ]
            ]
        ]);
        return $user;
    }
}
