<template>
    <div class='demo-app' id="schedule">
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

    export default {
        components: {
            FullCalendar // make the <FullCalendar> tag available
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
                    contentHeight:"auto",
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
            handleDateSelect(selectInfo) {
                let title = prompt('Please enter a new title for your event');
                let calendarApi = selectInfo.view.calendar;
                calendarApi.unselect() // clear date selection
                if (title) {
                    this.calendarOptions.events.push({
                        title,
                        start: selectInfo.startStr,
                        end: selectInfo.endStr,
                        allDay: selectInfo.allDay,
                        color: 'green',
                        user_id: this.user.id
                    })
                }
            },
            handleEventClick(clickInfo) {
                if (confirm(`Are you sure you want to delete the event '${clickInfo.event.title}'`)) {
                    clickInfo.event.remove()
                }
            },
            handleEventChange(changeInfo) {
                let event = this.calendarOptions.events.find(item => item.id == changeInfo.event.id);
                event.color = 'green';
                event.start = changeInfo.event.startStr;
                event.end = changeInfo.event.endStr;
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
                    let events = this.user.working_hours;
                    events.push({
                        endTime: "18:30:00",
                        id: 5,
                        startTime: "10:00:00",
                        user_id: 1,
                        daysOfWeek: ['5'],
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
            display: none!important;
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


