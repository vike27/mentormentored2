class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  dragonfly_accessor :image

  def self.search(search)
    scope = User.order(:first_name)
    scope.where!("first_name LIKE ?", "%#{search[:first_name]}%") if search[:first_name].present?
    scope.where!("last_name LIKE ?", "%#{search[:last_name]}%") if search[:last_name].present?
    scope.where!("job_title LIKE ?", "%#{search[:job_title]}%") if search[:job_title].present?
    scope.where!("industry LIKE ?", "%#{search[:industry]}%") if search[:industry].present?
    scope.where!("location LIKE ?", "%#{search[:location]}%") if search[:location].present?
    if search[:week_day].present? && search[:time_availability].blank?
      scope.where!(DAYS_HASH[search[:week_day][0]] => true)
    elsif search[:week_day].present? && search[:time_availability].present?
      scope.where!(DAYS_HASH[search[:week_day]][0] => true)
      scope = scope.select{|obj| (DateTime.parse(obj.send(DAYS_HASH[search[:week_day]][1])).strftime("%H:%M") < DateTime.parse(search[:time_availability]).strftime("%H:%M")) && (DateTime.parse(obj.send(DAYS_HASH[search[:week_day]][2])).strftime("%H:%M") > DateTime.parse(search[:time_availability]).strftime("%H:%M"))}
      # scope.where!(DAYS_HASH[search[:week_day]][1] < Time.parse(search[:time_availability]))
      # scope.where!(DAYS_HASH[search[:week_day]][2] > Time.parse(search[:time_availability]))
    end
    scope
  end

end
