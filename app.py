from sanic import Sanic, json, text
from sanic.response import json
from tools import (
    get_sql,
    Before,
    close_sql,
    close_cursor,
    pd_dict_stu,
    pd_dict_score,
    pd_dict_college,
    pd_dict_course,
    pd_dict_login,
    pd_dict_major,
    pd_dict_tea,
)
from server import BaseView, Select, Insert
import json as json
from sanic_cors import CORS
from sanic_session import Session, InMemorySessionInterface


app = Sanic(__name__)
# session = Session(app, interface=InMemorySessionInterface())  # 会话管理
CORS(app)  # 跨源请求
before = Before()


def get_json(filename):
    with open(filename) as file:
        data = json.load(file)
    return data


@app.listener("before_server_start")
async def create_connect(app, loop):
    data_json = get_json("./config.json")
    app.ctx.db = await get_sql(
        data_json["USERNAME"],
        data_json["PASSWORD"],
        data_json["HOST"],
        data_json["PORT"],
        data_json["DATABASE"],
    )


@app.listener("before_server_start")
async def set_global_var(app, loop):
    app.ctx.username = -1


@app.listener("after_server_stop")
async def close_connect(app, loop):
    close_cursor(app.ctx.db.cursor())
    close_sql(app.ctx.db)
    print("连接断开")


class Service:
    class Index(BaseView):
        async def get(self, request):
            user_data = app.ctx.username
            sql = "SELECT * FROM student WHERE stu_id=%s"
            sql_data = app.ctx.db.cursor()
            sql_data.execute(sql, (user_data))
            sql_data = sql_data.fetchall()
            sql_data = pd_dict_stu(sql_data)
            return self.success(sql_data)

        def post(self, request):
            pass

    class Teacher(BaseView):
        async def get(self, request):
            sql = "SELECT * FROM teacher"
            data = Select.select_data(app.ctx.db, sql)
            data = pd_dict_tea(data)
            return self.success(data)

    class Login(BaseView):
        async def get(request):
            sql = "SELECT * FROM login"
            data = Select.select_data(app.ctx.db, sql)
            data = pd_dict_login(data)
            return Service.Login.success(data)

        async def update_password(request):
            data = json.loads(request.body.decode("utf-8").replace("'", '"'))
            id = data["id"]
            password = data["password"]
            Insert.insert_data(app.ctx.db, "log_update_password", id, password)
            return Service.Login.success(data)

        # async def update_password(request):
        #     data = json.loads(request.body.decode("utf-8").replace("'", '"'))
        #     id = data["id"]
        #     password = data["password"]
        #     sql_cursor = app.ctx.db.cursor()
        #     sql_cursor.callproc("log_update_password", args=("1001", "777777"))
        #     return text("se")

        async def post(self, request):
            data = json.loads(request.body.decode("utf-8").replace("'", '"'))
            sql = "select * from login where id=%s"
            sql_data = app.ctx.db.cursor()
            sql_data.execute(sql, (data["username"]))
            sql_data = sql_data.fetchall()
            sql_data = pd_dict_login(sql_data)
            sql_data_password = str(sql_data[0]["password"])
            if data["password"] == sql_data_password:
                print("success")
                app.ctx.username = data["username"]
                # request.ctx.session["userdata"] = data["username"]
                # print(request.ctx.session["userdata"])
                return self.success(data, 200, "登录成功")
            else:
                print("error")
                return self.error(data, 400, "用户名或密码错误")

    class Score(BaseView):
        async def get(self, request):
            sql = "SELECT * FROM score"
            cursor = app.ctx.db.cursor()
            cursor.callproc("score_all", args=("1", "1"))
            results = cursor.fetchone()
            print(results)
            return self.success({"data": "123"})

    class Student(BaseView):
        async def get(self, request):
            # user_data = request.ctx.session
            user_data = app.ctx.username
            sql = "SELECT * FROM student WHERE stu_id=%s"
            sql_data = app.ctx.db.cursor()
            sql_data.execute(sql, (user_data))
            sql_data = sql_data.fetchall()
            sql_data = pd_dict_stu(sql_data)
            print(sql_data)
            return self.success(sql_data)


app.add_route(Service.Login.get, "/login/get")
app.add_route(Service.Login.update_password, "/login/update_password")
app.add_route(Service.Login.as_view(), "/login")
app.add_route(Service.Teacher.as_view(), "/teacher")
app.add_route(Service.Score.as_view(), "/score")
app.add_route(Service.Student.as_view(), "/student", methods=["GET", "POST"])
app.add_route(Service.Index.as_view(), "/")


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8081)
