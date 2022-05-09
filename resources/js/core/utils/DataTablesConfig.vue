<script>
    export default {
        select: {
            info: false,
            items: 'cell',
        },
        autoFill: true,
        colReorder: true,
        keys: true,
        buttons: [
            {
                extend: 'excel',
                className: 'btn',
                titleAttr: 'Скачать таблицу в формате Excel'
            },
            {
                extend: 'pdf',
                className: 'btn',
                titleAttr: 'Скачать таблицу в формате PDF'
            },
            {
                extend: 'print',
                className: 'btn',
                titleAttr: 'Распечатать таблицу'
            },
        ],
        searchPanes: {
            collapse: true,
            columns: [4]

        },
        searchBuilder: true,
        dom: "<'row m-0'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'<'text-right'B>>>" +
            "<'row m-0'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
            "<'row m-0'<'col-sm-12'tr>>" +
            "<'row m-0'<'col-sm-12'<'pull-center'p>>>",

        stateSave: true,
        language: {
            url: '/langs/data_tables/ru.json'
        },
    }
</script>
