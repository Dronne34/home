import os
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow

# Set the path to store the token file
TOKEN_PATH = 'token.json'

# Google API scopes required for Gmail
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']

def authenticate():
    # Set up the OAuth 2.0 flow for user authorization
    flow = InstalledAppFlow.from_client_secrets_file(
        '/home/dell/Downloads/token.json',  # Replace with the path to your client secret file
        scopes=SCOPES
    )

    # Try to load existing credentials from the token file
    credentials = None
    if os.path.exists(TOKEN_PATH):
        try:
            credentials = Credentials.from_authorized_user_file(TOKEN_PATH, SCOPES)
        except ValueError:
            pass

    # If no valid credentials are available, let the user log in
    if not credentials or not credentials.valid:
        credentials = flow.run_local_server(port=0)

        # Save the credentials for the next run
        with open(TOKEN_PATH, 'w') as token_file:
            token_file.write(credentials.to_json())

    return credentials

def main():
    try:
        # Authenticate and get credentials
        credentials = authenticate()

        # Use the credentials to access Gmail API or perform other tasks
        # For example, print the user's profile information
        print("User's Profile Information:")
        print("Name:", credentials.id_token['name'])
        print("Email:", credentials.id_token['email'])
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == '__main__':
    main()
