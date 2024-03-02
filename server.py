from sanic.views import HTTPMethodView
from tortoise.contrib.sanic import register_tortoise
from sanic import json


class Result:
    @classmethod
    def success(cls, data: any, code=200, message="success", **kwargs):
        if type(data) is list:
            for item in data:
                item = dict(item)
        elif data is None:
            return json({"code": code, "message": message, **kwargs})
        else:
            data = dict(data)
        return json({"data": data, "code": code, "message": message, **kwargs})

    @classmethod
    def error(cls, data: any, code=200, message="error"):
        if type(data) is list:
            for item in data:
                item = dict(item)
        else:
            data = dict(data)
        return json({"data": data, "code": code, "message": message})


class BaseView(HTTPMethodView):
    @classmethod
    def success(self, data: any, code=200, message="success", **kwargs):
        return Result.success(data, code, message, **kwargs)

    def error(self, data: any, code=400, message="error"):
        return Result.error(data, code, message)


class Select:
    @classmethod
    def select_data(self, data, sql):
        try:
            data_cursor = data.cursor()
            data_cursor.execute(sql)
            print("查询成功")
            data_list = data_cursor.fetchall()
            return data_list
        except Exception as e:
            print("查询失败", e)
            return json({"error": "Error adding data"}, status=500)


class Insert:
    @classmethod
    def insert_data(self, data, sql):
        try:
            data_cursor = data.cursor()
            data_cursor.execute(sql)
            print("插入成功")
            return json({"message": 200})
        except Exception as e:
            print("Error adding data to MySQL:", e)
            return json({"error": "Error adding data"}, status=500)

    @classmethod
    def insert_data(self, db, fun_name, args_one=None, args_two=None, args_three=None):
        try:
            print(db)
            cursor = db.cursor()  # 设置游标
            print(args_three, args_two, args_one)
            if args_two is None:
                print(1)
                cursor.callproc(fun_name, args=(args_one))  # 调用的sql一个函数
            elif args_three is None:
                print(2)
                cursor.callproc(fun_name, args=(args_one, args_two))
            else:
                print(3)
                cursor.callproc(fun_name, args=(args_one, args_two, args_three))
            db.commit()
            print("ok")
            return cursor.fetchone()
        except Exception as e:
            print("Error adding data to MySQL:", e)
            return json({"error": "Error adding data"}, status=500)
