<template>
    <div class='demo-app' id="schedule">
        <vuedal></vuedal>
        <div class='demo-app-main'>
            <FullCalendar
                    class='demo-app-calendar'
                    :options='calendarOptions'>
                <template v-slot:eventContent='arg'>
                    <b>{{ arg.timeText }}</b>
                </template>
            </FullCalendar>
            <div hidden>{{eventSources}}</div>
        </div>
    </div>
</template>


<script>
    import FullCalendar from '@fullcalendar/vue'
    import dayGridPlugin from "@fullcalendar/daygrid";
    import timeGridPlugin from "@fullcalendar/timegrid";
    import interactionPlugin from "@fullcalendar/interaction";
    import ruLocale from '@fullcalendar/core/locales/ru';
    import {mapGetters} from "vuex";
    import Print from "../../../core/utils/print";
    import moment from "moment";
    import {Component as Vuedal, Bus} from 'vuedals';
    import DaysOfWeekModal from "./DaysOfWeekModal";

    export default {
        components: {
            FullCalendar,
            Vuedal,
        },
        props: ['user'],
        data() {
            return {
                calendarOptions: {
                    plugins: [
                        dayGridPlugin,
                        timeGridPlugin,
                        interactionPlugin // needed for dateClick
                    ],
                    headerToolbar: {
                        left: 'save print prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
                    contentHeight: "auto",
                    initialView: 'timeGridWeek',
                    editable: true,
                    selectable: true,
                    selectMirror: true,
                    dayMaxEvents: true,
                    weekends: true,
                    select: this.handleDateSelect,
                    eventClick: this.handleEventClick,
                    locale: ruLocale,
                    events: [],
                    eventChange: this.handleEventChange,
                    customButtons: {
                        save: {
                            icon: 'fa fa fa-save',
                            click: this.handleUpdate,
                        },
                        print: {
                            icon: 'fa fa fa-print',
                            click: this.print,
                        },
                    },
                },
            }
        },
        methods: {
            createWorkingHour(selectInfo, data) {
                let calendarApi = selectInfo.view.calendar;
                calendarApi.unselect(); // clear date selection
                let new_wh = {
                    start: selectInfo.startStr,
                    end: selectInfo.endStr,
                    allDay: selectInfo.allDay,
                    color: 'green',
                    user_id: this.user.id,
                };
                if (data.length) {
                    new_wh['daysOfWeek'] = data;
                    new_wh['startTime'] = moment(selectInfo.startStr).format('HH:mm:ss');
                    new_wh['endTime'] = moment(selectInfo.endStr).format('HH:mm:ss');
                }
                this.calendarOptions.events.push(new_wh)
            },
            handleDateSelect(selectInfo) {
                let create = this.createWorkingHour;
                Bus.$emit('new', {
                    name: 'days-of-week-select',
                    component: DaysOfWeekModal,
                    title: 'Выберите дни недели',
                    size: 'xs',
                    props: {selectInfo},
                    onClose(data){
                        create(selectInfo, data)
                    }
                });
            },
            handleEventClick(clickInfo) {
                if (confirm(`Вы действительно хотите удалить событие?`)) {
                    this.$store.dispatch('deleteWorkingHouse', clickInfo.event.id)
                    .then(() => clickInfo.event.remove());
                }
            },
            handleEventChange(changeInfo) {
                var event = this.calendarOptions.events.find(item => item.id == changeInfo.event.id);
                event.color = 'green';
                event.start = changeInfo.event.startStr;
                event.end = changeInfo.event.endStr;
                if (event.daysOfWeek?.length) {
                    event.startTime = moment(changeInfo.event.startStr).format('HH:mm:ss');
                    event.endTime = moment(changeInfo.event.endStr).format('HH:mm:ss');
                }
            },
            handleUpdate() {
                this.$store.dispatch('updateWorkingHours', {events: this.calendarOptions.events})
                    .then(this.$emit('updateUser'))
            },
            print() {
                Print.print('schedule')
            }

        },
        computed: {
            ...mapGetters([
                'employees'
            ]),
            eventSources() {
                if (this.user?.working_hours) {
                    let events = this.user.working_hours.map(function (working_hours) {
                        if (working_hours.days_of_week) {
                            return {
                                endTime: moment(working_hours.end).format('HH:mm:ss'),
                                id: working_hours.id,
                                startTime: moment(working_hours.start).format('HH:mm:ss'),
                                user_id: working_hours.user_id,
                                daysOfWeek: working_hours.days_of_week,
                            }
                        } else {
                            return working_hours;
                        }
                    });
                    this.calendarOptions.events = events;
                } else {
                    this.calendarOptions.events = [];
                }
            }
        }
    }
</script>

<style lang='css' scoped>
    .demo-app {
        font-size: 14px;
    }
</style>

<style>
    @media screen and (max-width: 990px) {
        .fc-toolbar-title {
            font-size: 16px !important;
        }

        .fc-button {
            font-size: 10px !important;
        }

        .fc-save-button {
            display: none !important;
        }
    }

    @media screen and (max-width: 500px) {
        .fc-toolbar-title {
            font-size: 10px !important;
        }

        .fc-button {
            font-size: 8px !important;
        }
    }

    .fc { /* the calendar root */
        /*min-height: 100%;*/
        max-width: 1100px;
        margin: 0 auto;
    }

    .fc-button {
        background: #4e73df !important;
        border-color: #fff !important;
    }

    .fc-save-button {
        background: green !important;
    }

    .fc-icon-fa {
        font-family: "Font Awesome 5 Free" !important;
        font-weight: 900 !important
    }
</style>


