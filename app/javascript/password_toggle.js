document.addEventListener('DOMContentLoaded', function () {
  // パスワードを更新するボタンを取得
  const updatePasswordButton = document.getElementById('update-password-button');
  // 他のフォームフィールドを取得
  const formFields = document.querySelectorAll('.form-control:not(#new-password-field, #new-password-confirmation-field)');

  updatePasswordButton.addEventListener('click', function () {
    // フォームフィールドを無効にする
    formFields.forEach(field => field.disabled = true);
  });

  // コラプスが閉じるボタンを取得
  const closeCollapseButton = document.getElementById('close-collapse-button');
  closeCollapseButton.addEventListener('click', function () {
    // フォームフィールドを有効にする
    formFields.forEach(field => field.disabled = false);
  });
});
