<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Roman Alekseev">

    @if (file_exists('storage/favicon.ico'))
        <link rel="icon" type="image/x-icon" sizes="32x32" href="{{ asset('storage/favicon.ico') }}">
    @else
        <link rel="icon" type="image/x-icon" sizes="32x32" href="{{ asset('assets/img/favicon.ico') }}">
    @endif

{{--    <meta data-vue-meta="1" name="description" content="MedMS – Medical Management System // CRM system for managing a medical organization">--}}

    <title>MedMS</title>

    <link href="{{asset('assets/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
</head>
<body id="page-top">
<div id="app"></div>

<script src="{{ mix('js/app.js') }}"></script>
</body>
</html>
