# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = [
    User.create!(
        email: 'admin@example.com',
        firstname: 'Janusz',
        lastname: 'Nowak',
        password: 'password',
        admin: true
    ),
    User.create!(
        email: 'adam@mail.com',
        firstname: 'Adam',
        lastname: 'Kowalski',
        password: 'password',
        admin: false
    ),
    User.create!(
        email: 'janusz@mail.com',
        firstname: 'Janusz',
        lastname: 'Kowalski',
        password: 'password',
        admin: false
    ),
    User.create!(
        email: 'marcin@mail.com',
        firstname: 'Marcin',
        lastname: 'Bronowicz',
        password: 'password',
        admin: false
    ),
    User.create!(
        email: 'Mateusz@mail.com',
        firstname: 'Mateusz',
        lastname: 'Nowacki',
        password: 'password',
        admin: false
    ),
    User.create!(
        email: 'Jakub@mail.com',
        firstname: 'Jakub',
        lastname: 'Janowicz',
        password: 'password',
        admin: false
    )
]

c = [
    Category.create!( name: 'Smartphones'),
    Category.create!( name: 'Laptops')
]

p = [
    Product.create!(
        title: 'Samsung Galaxy V',
        description: "Android smartphone produced by Samsung Electronics. The phone was released on 11 April 2014 in 150 countries as the immediate successor to the Galaxy S4. As with the S4, the S5 is an evolution of the prior year's model, placing a particular emphasis on an improved build with a textured rear cover and IP67 certification for dust and water resistance, a more refined user experience, new security features such as a fingerprint reader and private mode, expanded health features (such as a built-in heart rate monitor), and an updated camera.

    The Galaxy S5 received mostly positive reviews; while praised for the improvements to its design, display, software, and camera, the S5 was criticized for its fingerprint scanner and hardware improvements over its predecessor",
        price: 1000,
        category: c[0],
        user: u[1]
    ),
    Product.create!(
        title: 'LG G2',
        description: "LG G2 smartphone with 5.20-inch 1080x1920 display powered by 2.26GHz processor alongside 2GB RAM and 13-megapixel rear camera. ",
        price: 800,
        category: c[0],
        user: u[1]
    ),
    Product.create!(
        title: 'Motorola Moto G',
        description: "Product InformationThe intriguing Motorola Moto G, which runs on the Android operating system, version 4.3 Jelly Bean, has a variety of applications to explore. The heart of this smartphone is a Qualcomm Snapdragon 400 processor with 1.2 GHz quad-core CPU. Its power is hidden into the slim body, weighting only 143 g. The wide 4.5-inch 720p HD display on the black Motorola cell phone enables users to effortlessly navigate the Web, watch video with HD quality or enjoy some of the various applications. ",
        price: 600,
        category: c[0],
        user: u[2]
    )
]

Review.create!(
    content: 'Nice mobile,camera is amezing. Bt no external storage. This one is big -ve point. Good bettery life. Over all nice mobile. Video quality is amezing. I like this device due to its colour confi. ',
    rating: 3,
    user: u[1],
    product: p[0]
)

Review.create!(
    content: 'Very good',
    rating: 5,
    user: u[1],
    product: p[1]
)

Review.create!(
    content: 'Nice phone for such a price',
    rating: 4,
    user: u[1],
    product: p[2]
)

Review.create!(
    content: 'Thins fon is awesome. great screen resolution different power button amazing battery life best camera result the best processor i recommend this fon ',
    rating: 4,
    user: u[2],
    product: p[0]
)