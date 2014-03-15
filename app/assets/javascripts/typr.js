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
      templates: {
          empty: [
            '<div class="empty-message">',
            'unable to find any customers that match the current query',
            '</div>'
          ].join('\n'),
          suggestion: Handlebars.compile('<div class="searchy"><p class="white"><strong>{{name}}</strong> – {{carrier}}</p></div>')
        }
  });

  $('.customer-autocomplete').on('typeahead:selected', function (e, datum) {
    var destination = '/customers/'+datum.record;
    window.location = destination;
  });

});
