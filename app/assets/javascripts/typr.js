$(document).ready(function() {
    $('.customer-typeahead').typeahead({
        name: 'customer-search',
        prefetch: {
            url: '/customers/autocomplete.json?secret=123',
            ttl: 432000000
        },
        remote: '/customers/autocomplete_query?query=%QUERY',
        limit: 10
    });
    $('.customer-typeahead').on('typeahead:selected', function (e, datum) {
        var destination = '/customers/'+datum.record;
        window.location = destination;
    });

});