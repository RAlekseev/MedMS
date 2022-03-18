<script>
    export default {
        select: {
            info: false,
            items: 'cell',
        },
        autoFill: true,//
        colReorder: true,
        keys: true,//
        buttons: [
            'excel', 'pdf',
        ],
        searchPanes: {
            collapse: true,
            columns: [4]

        },
        dom: "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'<'pull-right'B>>>" +
            "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12'<'pull-center'p>>>" +
            "<'row'<'col-sm-12 col-md-6'P><'col-sm-12 col-md-6'Q>>",

        stateSave: true,
        language: {
            url: '/langs/data_tables/ru.json'
        },
    }
</script>
