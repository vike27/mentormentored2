class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  PRIVATE_ATTRIBUTES = [:private_twitter, :private_industry, :private_job_title, :private_location,
                        :private_occupation, :private_gender, :private_work_history,
                        :private_years_of_experience]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessor *PRIVATE_ATTRIBUTES
  attr_accessor :form_submitted

  dragonfly_accessor :image

  acts_as_messageable

  serialize :private_attrs

  before_save :set_private_attributes

  def self.search(search)
    scope = User.order(:first_name)
    scope.where!("first_name LIKE ?", "%#{search[:first_name]}%") if search[:first_name].present?
    scope.where!("last_name LIKE ?", "%#{search[:last_name]}%") if search[:last_name].present?
    scope.where!("job_title LIKE ?", "%#{search[:job_title]}%") if search[:job_title].present?
    scope.where!("industry LIKE ?", "%#{search[:industry]}%") if search[:industry].present?
    scope.where!("location LIKE ?", "%#{search[:location]}%") if search[:location].present?
    if search[:week_day].present? && search[:time_availability].blank?
      scope.where!(DAYS_HASH[search[:week_day]][0] => true)
    elsif search[:week_day].present? && search[:time_availability].present?
      scope.where!(DAYS_HASH[search[:week_day]][0] => true)
      scope = scope.select{|obj| (DateTime.parse(obj.send(DAYS_HASH[search[:week_day]][1])).strftime("%H:%M") < DateTime.parse(search[:time_availability]).strftime("%H:%M")) && (DateTime.parse(obj.send(DAYS_HASH[search[:week_day]][2])).strftime("%H:%M") > DateTime.parse(search[:time_availability]).strftime("%H:%M"))}
      # scope.where!(DAYS_HASH[search[:week_day]][1] < Time.parse(search[:time_availability]))
      # scope.where!(DAYS_HASH[search[:week_day]][2] > Time.parse(search[:time_availability]))
    end
    scope
  end

  def mailboxer_email(object)
    email
  end

  # PRIVATE_ATTRIBUTES.each do |attribute_name|
  #   define_method(attribute_name) { private_attrs.include? attribute_name.to_s.match(/private_/).post_match.to_sym }
  # end

  private

    def set_private_attributes
      if form_submitted
        self.private_attrs = PRIVATE_ATTRIBUTES.map do |attribute|
            if self.send(attribute) == '1'
              attribute.to_s.match(/private_/).post_match.to_sym
            end
        end.compact
      end
    end

end
