<template>
    <div class="categories">
        <div class="py-5 text-center">
            <h2 class="mx-auto text-primary"><b>Наши врачи</b></h2>

            <h4 class="mx-auto">
                Наша команда состоит из квалифицированных врачей.
            </h4>
            <h4 class="mx-auto">
                Средний стаж работы - 25 лет!
            </h4>
        </div>

        <div class="row m-3">
            <Employee v-for="employee in commonEmployees"
                      :employee="employee"
                      :key="employee.id"/>
        </div>
    </div>
</template>

<script>
    import Employee from "./Employee";

    export default {
        data() {
            return {
                commonEmployees: [
                    {
                        'id': 1,
                        'name': "Аманкулова Джилдыс Маратовна",
                        'specialty': "Зав КДО, Эндоскопист",
                        'experience': 8,
                        'photo': 'assets/img/employees/1/photo.webp'
                    },
                    {
                        'id': 2,
                        'name': "Атамкулов Алиярбек Аскарбекович",
                        'specialty': "Зав КДО, Эндоскопист",
                        'experience': 15,
                        'photo': 'assets/img/employees/2/photo.webp'
                    },
                    {
                        'id': 3,
                        'name': "Исмаилова Гульжан Мырзабековна",
                        'specialty': "Нервопатолог",
                        'experience': 10,
                        'photo': 'assets/img/employees/3/photo.webp'
                    },
                    {
                        'id': 4,
                        'name': "Козубекова Айнаш Райымбековна",
                        'specialty': "Окулист",
                        'experience': 12,
                        'photo': 'assets/img/employees/4/photo.webp'
                    },
                    {
                        'id': 5,
                        'name': "Брюховецкая Оксана Владимировна",
                        'specialty': "Медсестра процедурного кабинета",
                        'experience': 10,
                        'photo': 'assets/img/employees/5/photo.webp'
                    },
                    {
                        'id': 6,
                        'name': "Абдыкадырова Айгерим Канатбековна",
                        'specialty': "Акушер-гинеколог",
                        'experience': 8,
                        'photo': 'assets/img/employees/6/photo.webp'
                    }
                ]
            }
        },
        components: {
            Employee
        }
    }
</script>

<style scoped>
    .categories {
        background-color: #f5f0ed;
    }
</style>