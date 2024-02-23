import asyncio
import unittest
from app import app, Service  # 确保替换为你的应用和视图的导入
from sanic_testing.testing import SanicTestClient
import tracemalloc

tracemalloc.start()


class TestStudentView(unittest.TestCase):

    def setUp(self):
        self.app = app
        self.app.config["TESTING"] = True
        self.client = SanicTestClient(self.app)
        self.app.add_route(Service.Student.add_student, "/addstudent")
        # 创建一个异步事件循环并使用 loop.run_until_complete 来运行协程
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
        loop.run_until_complete(self.test_add_student())
        loop.close()

    async def test_add_student(self):
        # 准备测试数据
        data = {"stu_id": 123, "stu_name": "测试学生", "stu_sec": "一班", "stu_age": 20}

        # 发起POST请求
        response = await self.client.post("/add_student", json=data)

        # 检查状态码
        self.assertEqual(response.status_code, 200)

        # 检查返回的数据
        response_data = await response.text()
        self.assertEqual(response_data, '{"message": "注册成功"}')


if __name__ == "__main__":
    unittest.main()
