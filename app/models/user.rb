class User < ApplicationRecord
  has_secure_password
  
  has_many :appointments
  belongs_to :profession
  belongs_to :city

  def self.api_return_professional(usr)
    # make sure user is not an instance of profession none
    if usr.profession_id == 3
      return {status: 'not found', code: 404}
    else
      return User.individual_create_data_structure(usr)
    end
  end

  def self.api_return_professionals_by_city(array_of_objects, city)
    professionals = []
    origin = {}
    array_of_objects.each do |person_hash|
      person = {}
      person[:first_name] = person_hash[:first_name]
      person[:last_name] = person_hash[:last_name]
      person[:email] = person_hash[:email]
      person[:profession] = (Profession.find(person_hash[:profession_id])).name
      professionals.push(person)
    end
    origin[city] = professionals
    return origin
  end

  def self.api_return_professionals_by_province(array_of_arrays, province)
    origin = {}
    array_of_people = User.create_data_structure(array_of_arrays)
    origin[province] = array_of_people
    return origin
  end



  def self.api_return_professionals_by_country(array_of_arrays, country)
    origin = {}
    array_of_people = User.create_data_structure(array_of_arrays)
    origin[country] = array_of_people
    return origin
  end

  private

  def self.create_data_structure(array)
    array_of_people = []
    array.each do |person_object_array|
      person_object_array.each do |person_hash|
        person = {}
        person[:first_name] = person_hash[:first_name]
        person[:last_name] = person_hash[:last_name]
        person[:email] = person_hash[:email]
        person[:profession] = Profession.find(person_hash[:profession_id]).name
        person[:city] = City.find(person_hash[:city_id]).name
        array_of_people.push(person)
      end
    end
    return array_of_people
  end

  def self.individual_create_data_structure(usr)
    return {
      first_name: usr.first_name,
      last_name: usr.last_name,
      email: usr.email,
      profession: (Profession.find(usr.profession_id)).name,
      city: (City.find(usr.city_id)).name,
      province: (City.find(usr.city_id).province.name),
    }
  end
end
