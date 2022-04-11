class Services
  def can_use_services?(person)
    of_age?(person) || person.parent_permission == true
  end

  private

  def of_age?(person)
    person.age >= 18
  end
end
