$(function() {
  // TODO 設計の変更が完了次第復活させること。利用しなくなった場合は削除すること。
  // トップページのリンク
  // $('.table-link').on('click', function() {
  //   location.href = $(this).data('href');
  // });

  let keyword = '';
  let commandType = '';

  // サイドバーのcommandType選択によるcommand検索イベント
  $('#command_type_category button').on('click', function(e) {
    $('#command_type_category button').removeClass('active');
    $(this).addClass('active');
    commandType = $(this).data('commandtype');
    searchCommand(commandType, keyword);
  });

  // 検索バーの入力によるcommand検索イベント
  let delaySearchFunction;
  $('#command-search-bar').on('keyup', function() {
    keyword = $(this).val();
    window.clearTimeout(delaySearchFunction);
    delaySearchFunction = window.setTimeout(
      searchCommand,
      400,
      commandType,
      keyword
    );
  });

  // APIに対する検索処理
  const searchCommand = (commandType, keyword) => {
    $('#commands-list')
      .children()
      .remove();
    $.ajax({
      type: 'GET',
      url: '/commands/search',
      data: {commandType, keyword},
      dataType: 'json',
    })
      .done(function(commands) {
        if (commands.length !== 0) {
          commands.forEach(function(c) {
            $('#commands-list').append(commandsTableHTML(c));
          });
        } else {
          $('#commands-list').append(nothingCommandsHTML);
        }
      })
      .fail(function() {
        console.log('失敗しました');
      });
  };

  // commandのHTMLを作成する。
  const commandsTableHTML = json => {
    let html = `<tr class="table-link" data-href="commands/${json.id}">
    <td>
    ${json.command}
    </td>
    <td>
    ${json.description}
    </td>
    </tr>`;
    return html;
  };

  // commandの検索結果がなかった時の表示。
  const nothingCommandsHTML = `<tr class="table-link" >
    <td>
    コマンドが見つかりませんでした！
    </td>
    <td>
    </td>
    </tr>`;
});
