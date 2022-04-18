<template>
    <div class='demo-app'>
        <div class='demo-app-main'>
            <FullCalendar
                    class='demo-app-calendar'
                    :options='calendarOptions'
            >
                <template v-slot:eventContent='arg'>
                    <b>{{ arg.timeText }}</b>
<!--                    <i>{{ arg.event.title }}</i>-->
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
                        left: 'save prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
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
                        // id: createEventId(),
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
                console.log(changeInfo);
            },
            handleUpdate() {
                this.$store.dispatch('updateWorkingHours', {events: this.calendarOptions.events})
            }
        },
        computed: {
            eventSources() {
                if (this.user?.working_hours) {
                    this.calendarOptions.events = this.user.working_hours;
                } else {
                    this.calendarOptions.events = [];
                }
            }
        }
    }
</script>

<style lang='css' scoped>
    .demo-app {
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
    }
</style>

<style>
    @media screen and (max-width: 935px) {
        .fc-toolbar-title {
            font-size: 16px!important;
        }
        .fc-button {
            font-size: 10px!important;
        }
    }

    @media screen and (max-width: 500px) {
        .fc-toolbar-title {
            font-size: 10px!important;
        }
        .fc-button {
            font-size: 8px!important;
        }
    }

    .fc { /* the calendar root */
        /*min-height: 100%;*/
        max-width: 1100px;
        margin: 0 auto;
    }
    .fc-button {
        background: #4e73df!important;
        border-color: #fff!important;
    }
    .fc-save-button{
        background: green!important;
    }
    .fc-icon-fa{
        font-family: "Font Awesome 5 Free"!important;
        font-weight: 900!important
    }
</style>


