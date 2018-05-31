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

trip2 = Trip.create!(
  title: "Petit repos en Italie",
  destination: "italie",
  start_date: "2018-05-03",
  end_date: "2018-05-07",
  user: user1
  )

trip3 = Trip.create!(
  title: "A la découverte de l'Argentine",
  destination: "argentine",
  start_date: "2018-04-12",
  end_date: "2018-04-20",
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

accomodation4 = Accomodation.create!(
  address: " Località Pineta di Torrenuova, 57027 San Vincenzo LI, Italie",
  phone_number: "+39 0565 701018",
  name: "Park Albatros Village",
  e_mail: "parkalbatros@gmail.com",
  kind: "hotel")


accomodation5 = Accomodation.create!(
  address: " Via P. F. Calvi, 9, 00071 Pomezia RM, Italie",
  phone_number: "+39 06 9837 2778",
  name: "Simon Hotel",
  e_mail: "simonhotel@gmail.com",
  kind: "hotel")

accomodation6 = Accomodation.create!(
  address: " Av. Pres. Dr. Nestor C. Kirchner 1505, Z9400BBB Río Gallegos, Santa Cruz, Argentine",
  phone_number: "+54 2966 43-4314",
  name: "Apart Hotel Austral",
  e_mail: "australhotel@gmail.com",
  kind: "b_b")

accomodation7 = Accomodation.create!(
  address: " España 919, U9000CUK Comodoro Rivadavia, Chubut, Argentine",
  phone_number: "+54 297 446-5673",
  name: "Ventia Hotel Comodoro",
  e_mail: "ventiahotel@gmail.com",
  kind: "habitant")

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

stay4 = Stay.create!(
  accomodation: accomodation4,
  trip: trip2,
  start_date: "2018-05-03",
  end_date: "2018-05-04",
  )

stay5 = Stay.create!(
  accomodation: accomodation5,
  trip: trip2,
  start_date: "2018-05-04",
  end_date: "2018-05-07",
  )

stay6 = Stay.create!(
  accomodation: accomodation6,
  trip: trip3,
  start_date: "2018-04-12",
  end_date: "2018-04-14",
  )

stay7 = Stay.create!(
  accomodation: accomodation7,
  trip: trip3,
  start_date: "2018-04-14",
  end_date: "2018-04-20",
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

Travel.create!(
    start_date: stay4.end_date,
    end_date: stay5.start_date,
    address_in: accomodation4.address,
    address_out: accomodation5.address,
    trip: trip2,
    mode: "bateau"
  )

Travel.create!(
    start_date: stay6.end_date,
    end_date: stay7.start_date,
    address_in: accomodation6.address,
    address_out: accomodation7.address,
    trip: trip3,
    mode: "avion"
  )

p "super j'ai créé"
p "#{Trip.count} trips"
p "#{User.count} users"
p "#{Travel.count} travels"
p "#{Stay.count} stays"
