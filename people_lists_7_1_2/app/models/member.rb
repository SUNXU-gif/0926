class Member < ApplicationRecord
  # name: 必填、1~20 字符、唯一
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 1, maximum: 20 }

  # height: 必填、>0，自定义错误信息
  validates :height, presence: { message: "身長を入力してください" }
  validate :height_must_be_positive

  # weight: 必填、>0，自定义错误信息
  validates :weight, presence: { message: "体重を入力してください" }
  validate :weight_must_be_positive

  private

  def height_must_be_positive
    if height.present? && height <= 0
      errors.add(:height, "は1以上の値を入力してください")
    end
  end

  def weight_must_be_positive
    if weight.present? && weight <= 0
      errors.add(:weight, "は1以上の値を入力してください")
    end
  end
end
