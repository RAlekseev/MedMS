<template>
    <div class="col-xs-12 col-sm-6 col-lg-4 p-4">
        <div class="card p-3  h-100">
            <img class="w-100 h-100" :src="employee.photo">
            <h5 class="mt-3">{{employee.name}}</h5>
            <h6>{{employee.specialty}}</h6>
            <h6>Стаж более {{employee.experience}} лет</h6>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['employee']
    }
</script>