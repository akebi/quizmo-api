class Role
    include Mongoid::Document

    validates :name, presence: true, uniqueness: { case_sensitive: false,
                                                                  message: "already exists" }

    field :name, type: String

    has_many :users

end
