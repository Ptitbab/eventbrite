class User < ApplicationRecord
    validates :email, :first_name, :last_name, presence: true
    
    has_many :attend_events, foreign_key: 'attendee_id', class_name: "Attendance"
    has_many :admin_events, foreign_key: 'admin_id', class_name: 'Event'
end
