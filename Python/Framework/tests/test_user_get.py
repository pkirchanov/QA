from Framework.lib.base_case import BaseCase
from Framework.lib.assertions import Assertions
from Framework.lib.my_requests import MyRequests

class TestUserGet(BaseCase):
    def test_get_user_details_not_auth(self):
        response = MyRequests.get("/user/2")

        Assertions.assert_json_has_key(response, "username")
        Assertions.assert_json_has_no_key(response, "email")
        Assertions.assert_json_has_no_key(response, "firstName")
        Assertions.assert_json_has_no_key(response, "lastName")

    def test_get_user_details_auth_as_same_user(self):
        data = {
            'email': 'vinkotov@example.com',
            'password': '1234'
        }

        response_1 = MyRequests.post("/user/login", data=data)

        auth_sid = self.get_cookie(response_1, "auth_sid")
        token = self.get_header(response_1, "x-csrf-token")
        user_id_from_auth_method = self.get_json_value(response_1, "user_id")

        response_2 = MyRequests.get(
            f"/user/{user_id_from_auth_method}",
            headers={"x-csrf-token": token},
            cookies={"auth_sid": auth_sid}
        )

        expected_fields = ["username", "email", "firstName", "lastName"]
        Assertions.assert_json_has_keys(response_2, expected_fields)
