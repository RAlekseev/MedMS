@extends('mail_templates.layout')

@section('content')
    <p style="text-align:center; text-transform:uppercase; font-size:24px; line-height:30px; font-weight:bold; color:#484a42;">
        Вы успешно зарегестрированы в системе!
    </p>
    <b>{{$user->full_name}}</b>
    <p>Ваш пароль: <b>{{$password}}</b></p>
    <p>Адрес системы: <b><a href="https://imu.clinic">imu.clinic</a></b></p>

    <br>
@endsection


