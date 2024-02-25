# OOP = Object Oreinted Programming
# class Dog

class Dog:
  def __init__(d, name, age, specie):
    d.name = name
    d.age = age
    d.specie = specie

  def sitting(d):
    print("I'm sitting now.")

  def get_older(d, year):
    d.age +=  year
    print(f"I'm getting older {year} year.")

dog1 = Dog("andy", 3, "chihuahua")
print(dog1.name, dog1.age, dog1.specie)
