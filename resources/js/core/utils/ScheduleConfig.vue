<script>
    import dayGridPlugin from "@fullcalendar/daygrid";
    import timeGridPlugin from "@fullcalendar/timegrid";
    import interactionPlugin from "@fullcalendar/interaction";
    import {INITIAL_EVENTS} from "../components/event-utils";

    export default {
        // calendarOptions: {
        //     plugins: [
        //         dayGridPlugin,
        //         timeGridPlugin,
        //         interactionPlugin // needed for dateClick
        //     ],
        //     headerToolbar: {
        //         left: 'prev,next today',
        //         center: 'title',
        //         right: 'dayGridMonth,timeGridWeek,timeGridDay'
        //     },
        //     initialView: 'dayGridMonth',
        //     initialEvents: INITIAL_EVENTS, // alternatively, use the `events` setting to fetch from a feed
        //     editable: true,
        //     selectable: true,
        //     selectMirror: true,
        //     dayMaxEvents: true,
        //     weekends: true,
        //     select: this.handleDateSelect,
        //     eventClick: this.handleEventClick,
        //     eventsSet: this.handleEvents
        //     /* you can update a remote database when these fire:
        //     eventAdd:
        //     eventChange:
        //     eventRemove:
        //     */
        // },
        // currentEvents: []
    }
</script>