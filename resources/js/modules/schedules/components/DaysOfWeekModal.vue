<template>
    <span>
        <p class="text-warning mb-3">Если событие не повторяется, закройте окно</p>
        <form @submit.prevent="createWorkingHour()" method="post">
            <div class="row" v-for="day in days">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="checkbox" v-model="day.is_selected"> <b>{{day.name}}</b>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Создать</button>
                <button id="close" type="button" class="btn btn-danger" @click="close">Закрыть
                </button>
            </div>
        </form>

    </span>
</template>

<script>
    import {Bus} from 'vuedals';
    import moment from "moment";

    export default {
        name: 'days-of-week',
        data() {
            return {
                days: [
                    {
                        id: 1,
                        name: 'Понедельник',
                        is_selected: null,
                    },
                    {
                        id: 2,
                        name: 'Вторник',
                        is_selected: null,
                    },
                    {
                        id: 3,
                        name: 'Среда',
                        is_selected: null,
                    },
                    {
                        id: 4,
                        name: 'Четверг',
                        is_selected: null,
                    },
                    {
                        id: 5,
                        name: 'Пятница',
                        is_selected: null,
                    },
                    {
                        id: 6,
                        name: 'Суббота',
                        is_selected: null,
                    },
                    {
                        id: 0,
                        name: 'Воскресенье',
                        is_selected: null,
                    },
                ]
            }
        },
        props: ['selectInfo'],
        mounted() {
            let day = moment(this.selectInfo.start).day();
            console.log(day)
            this.days.find(i => i.id == day).is_selected = true
        },
        methods: {
            createWorkingHour() {
                let data = this.days
                    .filter(i => {return i.is_selected})
                    .map(i => {return i.id});

                this.close(data);
            },
            close(data = []) {
                Bus.$emit('close', data)
            }
        }
    }
</script>
