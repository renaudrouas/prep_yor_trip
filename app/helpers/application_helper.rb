# frozen_string_literal: true

module ApplicationHelper
  def choose_country_img(name)

    country_imgs = ['argentine', 'italie', 'bolivie', 'surf', 'mexico']

    if country_imgs.include? name
      "#{name}.jpg"
    else
      # TODO mettre la methode random
      "#{country_imgs.sample}.jpg"
    end

  end
end
