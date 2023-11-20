function setupPasswordToggle() {
  // パスワードを更新するボタンを取得
  const updatePasswordButton = document.getElementById('update-password-button');
  // 他のフォームフィールドを取得
  const formFields = document.querySelectorAll('.form-control:not(#new-password-field, #new-password-confirmation-field)');

  if (updatePasswordButton) {
    updatePasswordButton.addEventListener('click', function () {
      // フォームフィールドを無効にする
      formFields.forEach(field => field.disabled = true);
    });
  }

  // コラプスが閉じるボタンを取得
  const closeCollapseButton = document.getElementById('close-collapse-button');
  if (closeCollapseButton) {
    closeCollapseButton.addEventListener('click', function () {
      // フォームフィールドを有効にする
      formFields.forEach(field => field.disabled = false);
    });
  }
}

// ドキュメントが読み込まれたときに実行
document.addEventListener('DOMContentLoaded', setupPasswordToggle);

// Turboリンクのページ遷移後にも実行
document.addEventListener('turbo:load', setupPasswordToggle);
