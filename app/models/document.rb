class Document < ApplicationRecord
    validates :body, presence: true
end
