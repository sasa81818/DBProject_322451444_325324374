import random

# Generate specific constraints
def generate_constraints():
    constraint_types = ["age", "physical state", "fitness level", "experience", "health condition"]
    constraint_details = {
        "age": ["above 8", "below 60", "above 12", "below 50", "between 18 and 40"],
        "physical state": ["healthy", "injured", "recovering", "pregnant", "disabled"],
        "fitness level": ["beginner", "intermediate", "advanced"],
        "experience": ["novice", "experienced", "expert"],
        "health condition": ["heart condition", "diabetes", "asthma", "obesity", "hypertension"]
    }
    constraint_type = random.choice(constraint_types)
    constraint_detail = random.choice(constraint_details[constraint_type])
    return f"{constraint_type} {constraint_detail}"

# Generate the file content
def generate_training_data(num_trainings=500):
    trainings = []
    training_types = ["Zumba", "Yoga", "Pilates", "CrossFit", "Spinning", "Boxing", "HIIT", "Strength Training", "Cardio", "Dance"]
    
    for i in range(1, num_trainings + 1):
        training_code = i
        training_type = random.choice(training_types)
        duration = random.randint(30, 120)
        constraint = generate_constraints()
        trainings.append(f"({training_code}, '{training_type}', {duration}, '{constraint}');")
    
    return trainings

# Write to file
file_path = "Insert_Training.sql"
with open(file_path, "w") as file:
    for line in generate_training_data():
        file.write("INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES\n" + line + "\n")

print(f"Data successfully written to {file_path}")
