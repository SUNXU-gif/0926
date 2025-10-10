class RelaxUsersEmailConstraint < ActiveRecord::Migration[8.0]
  def up
    # 1) 去掉唯一索引
    remove_index :users, :email if index_exists?(:users, :email)

    # 2) 允许为 NULL，且默认值改为 NULL
    change_column_default :users, :email, from: "", to: nil
    change_column_null    :users, :email, true

    # 3) 把历史数据里的空串置为 NULL，防止再冲突
    execute "UPDATE users SET email = NULL WHERE email = ''"

    # 4) 需要的话再建普通索引（非唯一）
    add_index :users, :email unless index_exists?(:users, :email)
  end

  def down
    # 回滚：恢复成 Devise 默认约束（唯一 + 非空 + 默认空串）
    remove_index :users, :email if index_exists?(:users, :email)
    execute "UPDATE users SET email = '' WHERE email IS NULL"
    change_column_null    :users, :email, false
    change_column_default :users, :email, ""
    add_index :users, :email, unique: true
  end
end
