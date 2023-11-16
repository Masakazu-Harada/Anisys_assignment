// passwords_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["editPasswordForm"]

  connect() {
    // edit時にだけパスワードフォームを表示
    if (this.hasEditPasswordFormTarget) {
      this.editPasswordFormTarget.classList.remove("hidden")
    }
  }

  // 編集時に新しいパスワードの入力を有効にする
  enableEditPasswordForm() {
    this.editPasswordFormTarget.querySelectorAll('input').forEach((input) => {
      input.disabled = false;
    });
  }
}
