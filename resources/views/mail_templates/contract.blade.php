@extends('mail_templates.layout')

@section('content')
    <p style="text-align:center; text-transform:uppercase; font-size:24px; line-height:30px; font-weight:bold; color:#484a42;">
        Заказ успешно оформлен!
    </p>
    <p style="">
        Ваш заказ №
        <b>{{$contract->id}}</b>
        <br>
        От <b>{{$contract->created_at->format('d.m.Y')}}</b>
        в организации {{\App\Modules\Configs\Models\Config::value('org_name')}} успешно оформлен.
    </p>

    <br>
    <p>
        <b>Инофрмация о пациенте:</b>
        <br>
        Фамилия: {{$contract->patient->last_name}}
        <br>
        Имя Отчество: {{$contract->patient->first_name}} {{$contract->patient->middle_name}}
        <br>
        Дата рождения: {{$contract->patient->birthday}}
        <br>
        Телефон: {{$contract->patient->phone}}
        <br>
        E-mail: {{$contract->patient->email}}
    </p>

    <p><b>Состав заказа:</b></p>
    <ol>
        @foreach($contract->services as $service)
            <li>
                {{$service->name}}: {{$service->price}}
                {{\App\Modules\Configs\Models\Config::value('currency')}}
            </li>
        @endforeach
    </ol>

    <p>Итого:
        <b>
            {{$contract->services_sum()}}
            {{\App\Modules\Configs\Models\Config::value('currency')}}
        </b>
    </p>
    <p>
        <b>Адрес отделения:</b>
        <br>
        {{\App\Modules\Configs\Models\Config::value('org_address')}}
    </p>

    <p style="">
        Благодарим вас за доверие нашей организации!
        <br>
        Когда результаты будут готовы, мы отправим их в ваш
        <a href="{{env('APP_URL')}}/profile"> Личный кабинет</a>
        и пришлем на электронную почту.
    </p>
    <br>
@endsection