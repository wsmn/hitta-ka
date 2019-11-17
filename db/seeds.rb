# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(
  name: "Company A",
  address: {
    city: "Norrhult",
    street: "Idvägen 75",
    zip_code: "36071",
  },
  slug: "comp-a"
)
Company.create(
  name: "Company B",
  address: {
    city: "Munka-ljungby",
    street: "Granträsk 19",
    zip_code: "26080",
  },
  slug: "comp-b"
)
Company.create(
  name: "Company C",
  address: {
    city: "Rydaholm",
    street: "Nybyvägen",
    zip_code: "33017",
  },
  slug: "comp-c"
)
Company.create(
  name: "Company D",
  address: {
    city: "Vittsjö",
    street: "Esplanadgatan 31",
    zip_code: "28022",
  },
  slug: "comp-d"
)
Company.create(
  name: "Company E",
  address: {
    city: "Axvall",
    street: "Eggelstad 13",
    zip_code: "53259",
  },
  slug: "comp-e"
)
