module ShareHelper
  def get_people_name people_id
    person = Person.find people_id
    person.name
  end
end
