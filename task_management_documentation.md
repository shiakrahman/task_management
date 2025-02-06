# instructions to install
git clone  repository

cd task_management
bundle install or bundle update
rails db:create
rails db:migrate

# started creating an api with the below rails command
rails new task_management --api

# created a user model -- by default rails will give data type as string if we dont mention
rails generate model user name email password_digest phone status

# created controller
rails g controller users

# i have used JWT gem for the token generation and encoded with HS256 algoritham. After every 30 miutes it will expire. 

# Tested the actions by providing routes
# register
$$
curl --location 'http://127.0.0.1:3000/register' \
--header 'Content-Type: application/json' \
--data-raw '{
  "user": {
    "name": "test_user",
    "email": "testemail9@mailinator.com",
    "password": "Welcome@123",
    "password_confirmation": "Welcome@123",
    "phone": "9823456708"
  }
}'
$$


# login
$$
curl --location 'http://127.0.0.1:3000/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "testemail45@mailinator.com",
    "password": "Welcome@123"
}'
$$

# listusers
# for one page we will be seeing only five records. i have used Kaminari gem for pagination.

$$
curl --location 'http://127.0.0.1:3000/list_users?page=2&per_page=5'
$$



# created task model
rails generate model task title description status due_date:datetime
# except due_date all the remainig data types are strings.

# created controller 
rails g controller tasks

# started testing my code by got a logic in between that user should create a task so created relationship. added user associationto tasks
rails generate migration AddUserToTasks user:references

# not able to create the task with user due to user authentication is not done. 
# i took an approach of getting user_id from token and mapping it with tasks. 

# Tested task actions

# task_creation
$$
curl --location 'http://127.0.0.1:3000/task_creation' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mzg4Njg4Njh9.K__gsbhXH10tgcftmN7LuFVGB3LKhxTW4Gkyr4T24bM' \
--data '{
  "task": {
    "title": "Complete API Documentation",
    "description": "Document all API endpoints with request and response examples.",
    "due_date": "2024-09-15",
    "status": "pending"
  }
}
'
$$

# list_tasks
$$
curl --location 'http://127.0.0.1:3000/list_tasks?page=1&per_page=1' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mzg4Njg4Njh9.K__gsbhXH10tgcftmN7LuFVGB3LKhxTW4Gkyr4T24bM'
$$

# list_task_by_id
$$
curl --location 'http://127.0.0.1:3000/list_tasks_by_id?id=6' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mzg4Njg4Njh9.K__gsbhXH10tgcftmN7LuFVGB3LKhxTW4Gkyr4T24bM'
$$

# update_task_by_id
$$
curl --location --request PATCH 'http://127.0.0.1:3000/update_task_by_id?id=6' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mzg4Njg4Njh9.K__gsbhXH10tgcftmN7LuFVGB3LKhxTW4Gkyr4T24bM' \
--data '{
  "task": {
    "title": "Complete API Documentation",
    "description": "Document all API endpoints with request and response examples.",
    "due_date": "2024-09-15",
    "status": "inprogress"
  }
}'
$$

# delete_task_by_id
$$
curl --location --request DELETE 'http://127.0.0.1:3000/delete_task_by_id?id=6' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mzg4Njg4Njh9.K__gsbhXH10tgcftmN7LuFVGB3LKhxTW4Gkyr4T24bM'
$$


# i have created serializers for task and uers.

Note: I have missed using enum, because i never used it. 
All the code present here is written by own. And took the jwt token decoding from my current project work space.

# i was able to document the api with the help of swagger ui, due to the one story point  i was not moving a head with it.









