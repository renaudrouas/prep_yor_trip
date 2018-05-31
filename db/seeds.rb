#je supprime tout
p "destroying db ..."


Trip.destroy_all
User.destroy_all
Accomodation.destroy_all

p "creating users"


user1 = User.create!(
  email: "tonton.david@gmail.com",
  password: "password",
)

p "creating trips"

trip1 = Trip.create!(
  title: "A la découverte des Aymaras dans les hauts plateaux boliviens",
  destination: "bolivie",
  start_date: "2018-06-03",
  end_date: "2018-06-07",
  user: user1
  )

p "creating Accomodations"

accomodation1 = Accomodation.create!(
  address: "Sagarnaga 326, La Paz City Centre, 3049 La Paz, Bolivie ",
  phone_number: "+591 2 2350252",
  name: "Sagarnaga Hotel",
  e_mail: "Sagarnaga@gmail.com",
  kind: "hotel"
  )

accomodation2 = Accomodation.create!(
  address: "Hotel de Sal Samarikuna,Comunidad Villa Candelaria, Nor Lípez, Bolivie",
  phone_number: "+591 71835474",
  name: "Hotel de Sal",
  e_mail: "contacto@salardeuyunijkl.com",
  kind: "auberge"
  )

accomodation3 = Accomodation.create!(
  address: "Laguna Hediona, Camacho No. 19, Uyuni, Bolivie",
  phone_number: "+591 2 6933107",
  name: "Los Flamencos Hotel Ecologico",
  e_mail: "contactos@flamencoslocos.com",
  kind: "auberge"
  )

p "Creating Stay"

stay1 = Stay.create!(
  accomodation: accomodation1,
  trip: trip1,
  start_date: "2018-06-03",
  end_date: "2018-06-04",
  )

stay2 = Stay.create!(
  accomodation: accomodation2,
  trip: trip1,
  start_date: "2018-06-04",
  end_date: "2018-06-05",
  )

stay3 = Stay.create!(
  accomodation: accomodation3,
  trip: trip1,
  start_date: "2018-06-05",
  end_date: "2018-06-07",
  )


p "Creating Travels"

Travel.create!(
    start_date: stay1.end_date,
    end_date: stay2.start_date,
    address_in: accomodation1.address,
    address_out: accomodation2.address,
    trip: trip1,
    mode: "car"
  )

Travel.create!(
    start_date: stay2.end_date,
    end_date: stay3.start_date,
    address_in: accomodation2.address,
    address_out: accomodation3.address,
    trip: trip1,
    mode: "train"
  )

p "super j'ai créé"
p "#{Trip.count} trips"
p "#{User.count} users"
p "#{Travel.count} travels"
p "#{Stay.count} stays"
