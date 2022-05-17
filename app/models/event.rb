class Event < ApplicationRecord
    validates :start_date, :duration, :title, :description, :price, :location, presence: true
    validates :title, length: {in: 5..140}
    validates :description, length: {in: 20..1000}
    validates :price, numericality: {only_integer: true, greater_than: 0}
    validate :start_after_now, :validate_duration, on: :create

    belongs_to :admin, class_name: "User"
    has_many :attendances
    has_many :attendees, class_name: "User", through: :attendances

    def start_after_now
        if start_date.present? && start_date < Date.today
            errors.add(:start_date, "un évenement ne peut pas être dans le passé")
        end
    end

    def validate_duration
        if (duration.present?) && ((duration.to_i < 0) || (duration.to_i % 5 != 0))
            errors.add(:duration, 'la durée doit être supérieure à 0 et par tranche de 5minutes')
        end
    end
end
