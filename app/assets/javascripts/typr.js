$(document).ready(function() {
  var customers, promise;

  customers = new Bloodhound({
    remote: '/customers/autocomplete_query.json?query=%QUERY',
    datumTokenizer: function(d) { return d.tokens; },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    limit: 10,
    prefetch: '/customers/autocomplete_query.json?filter=all'
  });

  promise = customers.initialize();

  promise.done(function() {
    console.log('playing with promises!');
  }).fail(function() {
    console.log('err!');
  });


  $('.customer-autocomplete').typeahead(null,{
    name: 'customer-search',
    source: customers.ttAdapter(),
  });

  $('.customer-autocomplete').on('typeahead:selected', function (e, datum) {
    var destination = '/customers/'+datum.record;
    window.location = destination;
  });

});
