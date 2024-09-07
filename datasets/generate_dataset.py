import pandas as pd
import numpy as np
from faker import Faker
import uuid
import random
from datetime import timedelta

# Initialize Faker
fake = Faker()

# Function to create user data
def create_users(num_rows):
    data = {
        "user_id": range(1, num_rows + 1),
        "signup_date": [fake.date_this_decade() for _ in range(num_rows)],
        "country": [fake.country() if np.random.rand() > 0.1 else None for _ in range(num_rows)],
        "age": [np.random.randint(-5, 120) for _ in range(num_rows)],
        "gender": [np.random.choice(["Male", "Female", None]) for _ in range(num_rows)],
        "device": [np.random.choice(["mobile", "web", None]) for _ in range(num_rows)],
    }
    return pd.DataFrame(data)

# Function to create user engagement data
def create_user_engagement(num_rows):
    data = {
        "user_id": np.random.randint(1, 100000, num_rows),
        "date": [fake.date_this_year() for _ in range(num_rows)],
        "session_duration": [np.random.randint(-300, 3600) for _ in range(num_rows)],
        "feature_used": [fake.word() if np.random.rand() > 0.1 else None for _ in range(num_rows)],
        "action": [np.random.choice(["login", "click", "purchase", "unknown"]) for _ in range(num_rows)],
        "conversion": [np.random.choice([True, False, None]) for _ in range(num_rows)],
    }
    return pd.DataFrame(data)

# Function to create feature usage data
def create_feature_usage(num_rows):
    data = {
        "user_id": np.random.randint(1, 100000, num_rows),
        "feature_id": np.random.randint(1, 5000, num_rows),
        "feature_name": [fake.word() if np.random.rand() > 0.1 else None for _ in range(num_rows)],
        "date": [fake.date_this_year() for _ in range(num_rows)],
        "usage_count": [np.random.randint(-10, 100) for _ in range(num_rows)],
    }
    return pd.DataFrame(data)

# Function to create churn data
def create_churn(num_rows):
    data = {
        "user_id": np.random.randint(1, 100000, num_rows),
        "churn_date": [fake.date_this_year() if np.random.rand() > 0.2 else None for _ in range(num_rows)],
        "churn_reason": [fake.word() if np.random.rand() > 0.1 else None for _ in range(num_rows)],
        "satisfaction_score": [np.random.randint(1, 11) if np.random.rand() > 0.1 else None for _ in range(num_rows)],
    }
    return pd.DataFrame(data)

# Function to create customer feedback data
def create_customer_feedback(num_rows):
    data = {
        "user_id": np.random.randint(1, 100000, num_rows),
        "feedback_date": [fake.date_this_year() for _ in range(num_rows)],
        "rating": [np.random.randint(1, 6) if np.random.rand() > 0.1 else None for _ in range(num_rows)],
        "comment": [fake.text(max_nb_chars=200) if np.random.rand() > 0.1 else None for _ in range(num_rows)],
    }
    return pd.DataFrame(data)

# Function to create session data
def generate_session_data(num_records=200000):
    session_data = []
    
    for _ in range(num_records):
        start_time = fake.date_time_this_year()
        # Generate session duration between 1 minute and 2 hours
        session_duration = timedelta(minutes=random.randint(1, 120))
        end_time = start_time + session_duration

        record = {
            'user_id': random.randint(1, 100000),
            'session_id': str(uuid.uuid4()),
            'session_start': start_time,
            'session_end': end_time,
            'session_type': random.choice(['login', 'interaction', 'purchase', 'logout']),
        }
        session_data.append(record)
    
    return pd.DataFrame(session_data)

# Generate and save CSV files
def generate_csv_files():
    create_users(100000).to_csv('datasets/datasets/users.csv', index=False)
    create_user_engagement(500000).to_csv('datasets/datasets/user_engagement.csv', index=False)
    create_feature_usage(200000).to_csv('datasets/datasets/feature_usage.csv', index=False)
    create_churn(100000).to_csv('datasets/datasets/churn.csv', index=False)
    create_customer_feedback(50000).to_csv('datasets/datasets/customer_feedback.csv', index=False)
    generate_session_data(200000).to_csv('datasets/datasets/session_data.csv', index=False)

# if __name__ == "__main__":
#     generate_csv_files()
generate_session_data(200000).to_csv('datasets/datasets/session_data.csv', index=False)
