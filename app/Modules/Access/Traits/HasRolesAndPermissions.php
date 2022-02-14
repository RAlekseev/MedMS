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
        $roles = $this->roles;
        $permissions = collect();
        foreach ($roles as $role) {
            $permissions = $role->permissions->merge($permissions);
        }
        return $permissions;
    }

    public function getPermissionsArrayAttribute()
    {
        $roles = $this->roles;
        $permissions = [];
        foreach ($roles as $role) {
            foreach ($role->permissions as $permission) {
                $permissions[] = $permission->slug;
            }
        }
        return $permissions;
    }

    public function hasPermission($permission)
    {
        return !!$this->permissions()->where('slug', $permission)->count();
    }


}
