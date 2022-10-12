class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies


    def received_one?(item_name)
        my_freebies = []
        self.freebies.each do |freeb|
            my_freebies << freeb.item_name
        end
        if my_freebies.include?(item_name)
            true
        else
            false
        end
    end

    def give_away(give_dev, freebie)
        if self.received_one?(freebie.item_name)
            freebie.dev = give_dev
            freebie.save
        end
    end
end
