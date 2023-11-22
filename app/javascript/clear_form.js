document.addEventListener('turbolinks:load', function() {
  // クリアボタンのセレクターを適切に設定
  var clearButton = document.getElementById('clear-button');

  if (clearButton) {
    clearButton.addEventListener('click', function() {
      // 編集と新規作成の両方のフォームに対応するセレクター
      var form = document.querySelector('form');
      if (form) {
        form.reset();
      }
    });
  }
});
