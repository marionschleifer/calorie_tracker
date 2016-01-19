$(document).ready ->
  $(".new_entry").on("ajax:success", (e, data, status, xhr) ->
    content = '<tr class="crosshair ui-sortable-handle" id="' + data.id + '">
              <td class="food">' + data.food + '</td>
              <td class="calories pink">' + data.calories + '</td>
              <td class="action">
                <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/entries/' + data.id + '"><span aria-hidden="true" class="glyphicon glyphicon-trash trash grey"></span>
                <br>
                </a>
              </td>
            </tr>'
    $(".entries.real-table tbody").prepend content
  ).on "ajax:error", (e, xhr, status, error) ->
    errorText = 'The following errors were found:\n'
    for field, errors of JSON.parse(xhr.responseText)
      errorText += '  ' + field + ':\n'
      for index, err of errors
        errorText += '    ' + err + '\n'
    alert errorText
