# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
#...
Product.create!(title: 'MGS1 Picture',
    description:
    %{<p>
        <em>Something cool</em>
        See this, this is intriguing.
        </p>},
    image_url: 'mgs1.jpg',
    price: 1.00,
    locale: "en")
#...
Product.create!(title: 'MGS2 Picture',
    description:
    %{<p>
        <em>Something cool</em>
        See this, this is intriguinger.
        </p>},
    image_url: 'mgs2.jpg',
    price: 1.00,
    locale: "en")
#...
Product.create!(title: 'MGS3 Picture',
    description:
    %{<p>
        <em>Something cool</em>
        See this, this is intriguingest.
        </p>},
    image_url: 'mgs3.jpg',
    price: 1.00,
    locale: "en")

Product.create!(title: 'MGS4 Picture',
    description:
    %{<p>
        <em>Algo muy buenol</em>
            Eso es mejor.
        </p>},
    image_url: 'mgs4.jpg',
    price: 1.00,
    locale: "es")