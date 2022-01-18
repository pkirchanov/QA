import pytest
import allure
# импортируем из библиотеки созданный класс testbase и методы
from Framework.lib.base_case import BaseCase
from Framework.lib.assertions import Assertions

# Положительный тест на авторизацию

from Framework.lib.my_requests import MyRequests

# прописываем название импортированного класса в параметрах

@allure.epic("Authorizations cases")
class TestUserAuth(BaseCase):
    # параметры для негативного теста
    exclude_params = [
        {"no_cookie"},
        {"no_token"}
    ]

    # пишем функцию для оптимизации кода
    def setup(self):
        data = {
            'email': 'vinkotov@example.com',
            'password': '1234'
        }
        #  запрос
        response_1 = MyRequests.post("/user/login", data=data)

        # пишем проверки. Проверки и для хэдеров, куки и json берем из методов test_base

        self.auth_sid = self.get_cookie(response_1, "auth_sid")
        self.token = self.get_header(response_1, "x-csrf-token")
        self.user_id_from_auth_method = self.get_json_value(response_1, "user_id")

    @allure.description("This test successfully authorize user by email and password")
    def test_user_auth(self):  # создаем функцию

        # пишем второй запрос
        # вызываем переменные через self

        response_2 = MyRequests.get(
            "/user/auth",
            headers={"x-csrf-token": self.token},
            cookies={"auth_sid": self.auth_sid}
        )

        # проверка второго запроса

        Assertions.assert_json_value_by_name(
            response_2,
            "user_id",
            self.user_id_from_auth_method,
            "User id from auth method is not equal to user id from check method"
        )

    # Окончание положительного теста авторизации

    # Параметризованный негативный тест

    @allure.description("This test checks authorization status without cookies and token")
    @pytest.mark.parametrize('condition', exclude_params)
    # функция для негативного теста
    def test_negative_auth_check(self, condition):

        # пишем условие для второго запроса

        if condition == "no_cookie":
            response_2 = MyRequests.get(
                "/user/auth",
                headers={"x-csrf-token": self.token},
            )
        else:
            # пишем второй запрос

            response_2 = MyRequests.get(
                "/user/auth",
                cookies={"auth_sid": self.auth_sid}
            )

        Assertions.assert_json_value_by_name(
            response_2,
            "user_id",
            0,
            f"User authorized with condition {condition}"
        )
