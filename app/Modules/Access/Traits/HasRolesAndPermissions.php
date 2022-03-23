<?php


namespace App\Modules\Access\Traits;

use App\Modules\Access\Models\Role;

Trait HasRolesAndPermissions
{
    public function roles()
    {
        return $this->belongsToMany(Role::class,'role_user');
    }

    public function permissions()
    {
//        $user = clone $this;
        $roles = $this->roles;
        $permissions = collect();
        foreach ($roles as $role) {
            $permissions = $role->permissions->merge($permissions);
        }
        return $permissions;
    }

    public function hasPermission($permission)
    {
        return !!$this->permissions()->where('slug', $permission)->count();
    }


    public function getPermissionsAttribute()
    {
        return $this->permissions()->map(function ($permission) {
            return $permission->slug;
        });
    }

}
