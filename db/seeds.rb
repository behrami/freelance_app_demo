Country.delete_all
Province.delete_all
City.delete_all
User.delete_all
Appointment.delete_all
Profession.delete_all

countries = ['Canada', 'United States']
provinces = ['Ontario', 'Quebec', 'Alberta', 'New York']
cities = ['Toronto', 'Scarborough', 'Montreal', 'Calgary']
professions = ['Lawyer', 'Plumber', 'None']

ca = Country.create(id:1, name: countries[0])
usa = Country.create(id:2, name: countries[1])

on = Province.create(id:1, name: provinces[0], country_id: ca.id)
qb = Province.create(id:2, name: provinces[1], country_id: ca.id)
alb = Province.create(id:3, name: provinces[2], country_id: ca.id)
ny = Province.create(id:4, name: provinces[3], country_id: usa.id)

to = City.create(id:1, name: cities[0], province_id: on.id)
scb = City.create(id:2, name: cities[1], province_id: on.id)
mon = City.create(id:3, name: cities[2], province_id: qb.id)
cal = City.create(id:4, name: cities[3], province_id: alb.id)

lawyer = Profession.create(id:1, name: professions[0])
plumber = Profession.create(id:2, name: professions[1])
regular = Profession.create(id:3, name: professions[2])

user1 = User.create(id:1, first_name: 'Bob', last_name: 'Vance', profession_id: lawyer.id, email: 'bob@finance.com', phone_number: '111-111-1111', summary: 'summary bob', picture: 'https://picsum.photos/100/?random', city_id: to.id, password: 'password')
user2 = User.create(id:2, first_name: 'Lance', last_name: 'Dance', profession_id: plumber.id, email: 'lance@finance.com', phone_number: '111-111-1111', summary: 'summary lance', picture: 'https://picsum.photos/100/?random', city_id: to.id, password: 'password')
user3 = User.create(id:3, first_name: 'Rob', last_name: 'Gaga', profession_id: lawyer.id, email: 'rob@finance.com', phone_number: '111-111-1111', summary: 'summary rob', picture: 'https://picsum.photos/100/?random', city_id: scb.id, password: 'password')
user4 = User.create(id:4, first_name: 'Josh', last_name: 'Lee', profession_id: plumber.id, email: 'josh@finance.com', phone_number: '111-111-1111', summary: 'summary josh', picture: 'https://picsum.photos/100/?random', city_id: scb.id, password: 'password')
user5 = User.create(id:5, first_name: 'Anna', last_name: 'Bell', profession_id: regular.id, email: 'anna@finance.com', phone_number: '111-111-1111', summary: 'summary anna', picture: 'https://picsum.photos/100/?random', city_id: mon.id, password: 'password')
user6 = User.create(id:6, first_name: 'Bart', last_name: 'Kuan', profession_id: lawyer.id, email: 'bart@finance.com', phone_number: '111-111-1111', summary: 'summary bart', picture: 'https://picsum.photos/100/?random', city_id: mon.id, password: 'password')
user7 = User.create(id:7, first_name: 'Lili', last_name: 'Bee', profession_id: lawyer.id, email: 'anna@finance.com', phone_number: '111-111-1111', summary: 'summary lili', picture: 'https://picsum.photos/100/?random', city_id: cal.id, password: 'password')
user8 = User.create(id:8, first_name: 'Ashley', last_name: 'Vensa', profession_id: plumber.id, email: 'ash@finance.com', phone_number: '111-111-1111', summary: 'summary ash', picture: 'https://picsum.photos/100/?random', city_id: cal.id, password: 'password')

booked_user_id = User.find(6).id

appt = Appointment.create(id:1, summary: 'regular user', user_id: user5.id, user_booked_id: booked_user_id, time: (DateTime.civil_from_format :local, 2018, 12, 17, 16, 30))
appt2 = Appointment.create(id:2, summary: 'professional user', user_id: user2.id, user_booked_id: booked_user_id, time: (DateTime.civil_from_format :local, 2018, 8, 10, 11, 30))
