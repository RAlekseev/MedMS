<?php


namespace App\Modules\Auth\Requests;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class RegisterUserRequest
 * @package App\Http\Requests
 */
class RegisterUserRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'last_name' => 'required',
            'first_name' => 'required',
            'phone' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
        ];
    }
}
