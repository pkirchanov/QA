import requests
from Framework.lib.base_case import BaseCase
from Framework.lib.assertions import Assertions
from datetime import datetime


class TestUserRegister(BaseCase):
    def setup(self):
        base_part = "learnqa"
        domain = "example.com"
        random_part = datetime.now().strftime("%m%d%Y%H%M%S")
        self.email = f"{base_part}{random_part}@{domain}"

    def test_create_user_successfully(self):
        data = {
            'password': '123',
            'username': 'learnqa',
            'firstName': 'learnqa',
            'lastName': 'leatnqa',
            'email': self.email
        }

        response = requests.post("https://playground.learnqa.ru/api/user/", data=data)

        assert response.status_code == 200, f"Unexpected status code {response.status_code}"
        # print('content = ', response.json())

    def test_create_user_with_existing_email(self):
        email = 'vinkotov@example.com'
        data = {
            'password': '123',
            'username': 'learnqa',
            'firstName': 'learnqa',
            'lastName': 'leatnqa',
            'email': email
        }

        response = requests.post("https://playground.learnqa.ru/api/user/", data=data)

        # assert response.status_code == 400, f"Unexpected status code {response.status_code}"
        Assertions.assert_code_status(response, 400)
        assert response.content.decode(
            "utf-8") == f"Users with email '{email}' already exists", f"Unexpected response content {response.content}"
