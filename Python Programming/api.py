# import module
from requests import get 

# get server respond by status code 200 = ok 300 = redirect 400 = not found
url = 'https://swapi.dev/api/people/1'
respond = get(url)
print(respond)

# data get from server
print(respond.json()['name'])
