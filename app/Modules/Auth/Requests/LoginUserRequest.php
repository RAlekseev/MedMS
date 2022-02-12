<?php


namespace App\Modules\Auth\Requests;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class RegisterUserRequest
 * @package App\Http\Requests
 */
class LoginUserRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'required|email',
            'password' => 'required',
        ];
    }
}
