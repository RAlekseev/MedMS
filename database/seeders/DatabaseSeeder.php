<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'first_name' => 'Роман',
            'last_name' => 'Алексеев',
            'middle_name' => 'Максимович',
            'email' => 'roma99@bk.ru',
            'phone' => '79241171690',
            'birthday' => '1999-01-08',
            'password' => bcrypt('admin'),
        ]);
        DB::table('users')->insert([
            'first_name' => 'Роман',
            'last_name' => 'Алексеев',
            'middle_name' => 'Максимович',
            'email' => '11@11.11',
            'phone' => '1111111111',
            'birthday' => '1999-01-08',
            'password' => bcrypt('1111'),
        ]);

        DB::table('roles')->insert([
            'name' => 'SuperAdmin',
            'slug' => 'super-admin',
        ]);

        DB::table('roles')->insert([
            'name' => 'Administrator',
            'slug' => 'administrator',
        ]);

        DB::table('roles')->insert([
            'name' => 'Registry',
            'slug' => 'registry',
        ]);

        DB::table('roles')->insert([
            'name' => 'Doctor',
            'slug' => 'doctor',
        ]);

        DB::table('roles')->insert([
            'name' => 'Patient',
            'slug' => 'patient',
        ]);


        DB::table('permissions')->insert([
            'name' => 'Права доступа',
            'slug' => 'permissions-index',
        ]);


        DB::table('permissions')->insert([
            'name' => 'Просмотр ролей',
            'slug' => 'roles-index',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Редактирование роли',
            'slug' => 'roles-update',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Просмотр роли',
            'slug' => 'roles-show',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Создание роли',
            'slug' => 'roles-create',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Удаление роли',
            'slug' => 'roles-delete',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Просмотр пользователей',
            'slug' => 'users-index',
        ]);

        DB::table('permissions')->insert([
            'name' => 'Проосмотр пользователя',
            'slug' => 'users-show',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Создание пользователя',
            'slug' => 'users-create',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Редактирование пользователя',
            'slug' => 'users-update',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Уудаление пользователя',
            'slug' => 'users-delete',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Просмотр всех услуг',
            'slug' => 'services-index',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Просмотр услуги',
            'slug' => 'services-show',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Создание услуги',
            'slug' => 'services-create',
        ]);
        DB::table('permissions')->insert([
            'name' => 'Редактирование услуги',
            'slug' => 'services-update',
        ]);

        DB::table('permissions')->insert([
            'name' => 'Удаление услуги',
            'slug' => 'services - delete',
        ]);

        DB::table('role_user')->insert([
            'user_id' => 1,
            'role_id' => 1,
        ]);

        DB::table('role_user')->insert([
            'user_id' => 2,
            'role_id' => 1,
        ]);

        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 1,
        ]);

        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 2,
        ]);

        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 3,
        ]);

        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 4,
        ]);
        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 5,
        ]);
        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 6,
        ]);
        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 7,
        ]);
        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 8,
        ]);
        DB::table('role_permission')->insert([
            'role_id' => 1,
            'permission_id' => 9,
        ]);

    }
}
