class EmailValidator < ActiveModel::Validator

    def validate(post)

        unless post.where.not(title: [nil,"Won't Believe", "Secret", "Top ", "Guess"])
            record.errors[:name] << "Title doesn't allow to include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'"
        end
    end
end