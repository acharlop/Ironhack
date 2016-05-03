function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="api/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
      <a class="delete-tournament btn btn-danger" href="api/tournaments/' + tournament.id + '"><span class="glyphicon glyphicon-minus"></span></a>\
    </li>\
  '
}
