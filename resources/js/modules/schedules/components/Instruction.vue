<template>
    <div class='demo-app-sidebar'>
        <div class='demo-app-sidebar-section'>
            <h2>Инструкция</h2>
            <div class="text-right">
                x
            </div>
            <ul>
                <li>Выберите даты, и вам будет предложено создать новое событие</li>
                <li>События: перетаскивание и изменения размера</li>
                <li>Щелкните на событие, чтобы удалить его</li>
            </ul>
        </div>
<!--        <div class='demo-app-sidebar-section'>-->
<!--            <label>-->
<!--                <input-->
<!--                        type='checkbox'-->
<!--                        :checked='calendarOptions.weekends'-->
<!--                        @change='handleWeekendsToggle'-->
<!--                />-->
<!--                Добавить выходные-->
<!--            </label>-->
<!--        </div>-->
<!--        <div class='demo-app-sidebar-section'>-->
<!--            <h2>Все события: ({{ currentEvents.length }})</h2>-->
<!--            <ul>-->
<!--                <li v-for='event in currentEvents' :key='event.id'>-->
<!--                    <b>{{ event.startStr }}</b>-->
<!--                    <i>{{ event.title }}</i>-->
<!--                </li>-->
<!--            </ul>-->
<!--        </div>-->
    </div>
</template>

<style scoped>
    .demo-app-sidebar {
        width: 300px;
        line-height: 1.5;
        background: #eaf9ff;
        border-right: 1px solid #d3e2e8;
    }
    .demo-app-sidebar-section {
        padding: 2em;
    }
    .fc { /* the calendar root */
        max-width: 1100px;
        margin: 0 auto;
    }
    .fc-button {
        background: #4e73df!important;
        border-color: #fff!important;
    }
</style>