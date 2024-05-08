class User < ApplicationRecord
  attr_accessor :workout_logs_count
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :nutrition_logs
  has_many :workout_logs
  has_many :posts
  has_many :likes, dependent: :destroy

  def warriorlevel
    if workout_logs_count.present?
      if workout_logs_count >= 50
        :gold
      elsif workout_logs_count >= 10
        :silver
      elsif workout_logs_count >= 5
        :bronze
      end
    else
      :none
    end
  end

  def add_workout_count(workout_log_count)
    previous_count = self.workout_logs_count
    total_count = previous_count + workout_log_count
    self.update_attribute(:workout_logs_count, total_count)
  end
  #def nerdlevel
    #if nutrition_logs_count >= 50
     # :gold
    #elsif nutrition_logs_count >= 10
    #  :silver
    #elsif nutrition_logs_count >= 5
    #  :bronze
  #end
end
