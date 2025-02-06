# RoR Developer
# Scenario:
# Create a simple RESTful API for managing tasks with user authentication. Each task is
# associated with a user.
# Requirements:
# 1. User Authentication
# a. Create a User model with name, email, password, phone, and status.
# b. Use encryption to secure passwords.
# c. Implement the following endpoints.
# - POST /register: Allow users to register with their details.
# - POST /login: Allow users to login with their email and password. Return a JWT
# token for authentication.
# 2. Task Management
# a. Create a Task model with title, description, status(enum), due_date.
# b. Implement the following endpoints.
# - POST /tasks: Allow users to create a new task.
# - GET /tasks: Allow users to retrieve all tasks.
# - GET /tasks/:id: Allow users to retrieve a specific task.
# - PATCH /tasks/:id: Allow users to update a specific task.
# - DELETE /tasks/:id: Allow users to delete a specific task.
# c. Validate:
# - title is required.
# - status is enum with values: [pending, in_progress, completed].
# - due_date is a valid date.

# 3. Error Handling:
# - Handle validation errors with meaningful error messages.
# - Return proper HTTP status codes.
# 4. Deliverables:
# a. A Github repo with setup instructions.
# b. Postman collection for the API.
# 5. Checkpoints
# a. Use JWT for token-based authentication (return access token and refresh token with
# proper expiry and validations)
# b. Add pagination to the GET/tasks endpoint.
# c. Use serializers for the JSON responses.
# d. Protect all task related endpoints so only authenticated users can access them.

# Important Note: We encourage all the candidates to solve the problem independently and
# demonstrate their problem solving and coding skills. The use of AI-generated solutions (such
# as ChatGPT, Copilot, or similar tools) is strictly not allowed.
# Submissions may be manually reviewed or validated to ensure they align with expected
# originality and logical progression.
# Candidates found submitting AI-generated code may be disqualified from further evaluation.
# We value quality and adherence to coding best practices over quantity. Show us how you
# approach the problem thoughtfully, even if the full solution isn’t achieved within the given time.