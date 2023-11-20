class Employee < ApplicationRecord
  has_secure_password #パスワードのハッシュ化
  before_save { self.email = email.downcase }
  
  validates :full_name, :kana_name, presence: true, length: { maximum: 20 } #氏名の必須入力と文字数制限
  validates :log_in_id, presence: true, uniqueness: true, length: { maximum: 50 } #ログインIDの必須入力と一意性と文字数制限
  
  EMAIL_REGEXP = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/
  validates :email, presence: true, format: { with: EMAIL_REGEXP }, uniqueness: { case_sensitive: false } #メールアドレスの必須入力とフォーマットと一意性と大文字小文字の区別
  
  validates :position, presence: true


  belongs_to :branch, optional: true #支店モデルに属する optional: trueでnilを許可する
  belongs_to :department, optional: true  #部署モデルに属する optional: trueでnilを許可する
  belongs_to :role, optional: true #権限モデルに属する optional: trueでnilを許可する
  
  belongs_to :boss, class_name: 'Employee', foreign_key: 'boss_id', optional: true #上司の従業員情報を取得するためのアソシエーション
  has_many :team_members, class_name: 'Employee', foreign_key: 'boss_id' #部下の従業員情報を取得するためのアソシエーション

  #admin権限をenumで管理する　0:一般, 1:管理者
  enum admin: { general: 0, admin: 1 } 
  
  #他にadmin権限を有している従業員がいるかどうかを判定するメソッド
  def other_admin_exists?
    # enumで定義したadminの値がgeneral（一般）の場合、
    # trueを返すのでadminかそうでないかを判定する
    if general?
      true
    else
      # else分でadminと判定されたので
      # 現在のidを持った管理者とは違うが管理者の存在をえexits?メソッドで判定する
      Employee.admin.where.not(id: id).exists?
    end
  end
  
  #社員の退職状況をenumで管理する　0:無効（退職）, 1:有効（在籍中）
  enum enable: { inactive: 0, active: 1 } 

  # 従業員を無効にするメソッド
  def deactivate!
    update(enable: :inactive)
  end

  # 従業員を有効にするメソッド
  def activate!
    update(enable: :active)
  end

  # 従業員がアクティブかどうかを判定するメソッド
  def active?
    enable == 'active'
  end

  # 従業員がアクティブでないかどうかを判定するメソッド
  def inactive?
    enable == 'inactive'
  end
  
  #社員の役職をenumで管理する　0:一般社員, 1:係長, 2:課長, 3:部長, 4:役員, 5:社長 
  enum position: {
    staff: 0, #一般社員
    chief: 1, #係長
    head: 2, #課長
    manager: 3, #部長
    officer: 4, #役員
    president: 5 #社長
  }

  # ransackの検索条件を設定する
  def self.ransackable_attributes(auth_object = nil)
    # 検索に使用したい属性の名前を配列として返す
    %w[boss_id branch_id department_id full_name position kana_name]
  end
end


