import pymysql as sql
import pandas as pd
from jinja2 import Environment, FileSystemLoader
from functools import wraps
from sanic.response import html
import json


env = Environment(loader=FileSystemLoader("./templates/"), enable_async=True)


class Before:
    @staticmethod
    def template(template_name):
        def warapper(func):
            @wraps(func)
            async def inner(request, *args, **kwargs):
                temp = env.get_template(template_name)
                # 渲染
                context = await func(request, *args, **kwargs)
                return html(await temp.render_async(context))

            return inner

        return warapper


def get_sql(username, password, host="", port="", database=""):
    try:
        data = sql.connect(
            user=username, password=password, host=host, port=port, database=database
        )
        print("连接成功!")
        return data
    except:
        print("连接失败!")


# def add_data(request):
#     sql = "INSERT INTO student(stu_id,stu_name,stu_sec,stu_age) values(?,?,?,?)"
#     value = (1, "lkb", "男", 18)
#     try:
#         request.cursor().execute(sql, value)
#         print("插入成功")
#         return json({"message": 200})
#     except Exception as e:
#         print("Error adding data to MySQL:", e)
#         return json({"error": "Error adding data"}, status=500)


def pd_dict_stu(data_list):
    data = pd.DataFrame(data_list, columns=["id", "name", "sex", "age"])
    data = data.to_dict(orient="records")
    return data


def pd_dict_tea(data_list):
    data = pd.DataFrame(data_list, columns=["id", "name", "sex", "age", "degree"])
    data = data.to_dict(orient="records")
    return data


def pd_dict_college(data_list):
    data = pd.DataFrame(data_list, columns=["id", "name"])
    data = data.to_dict(orient="records")
    data = json.dumps(data, indent=4, ensure_ascii=False, default=str)
    print(data)
    return data


def pd_dict_course(data_list):
    new_data = []
    for data in data_list:
        if data[4].__class__.__name__ == "date":
            tem = str(data[4].day) + "-" + str(data[4].month) + "-" + str(data[4].year)
            data = data[:4] + (tem,) + data[-1:]
            new_data.append(data)
    new_data = tuple(new_data)
    data = pd.DataFrame(
        new_data, columns=["id", "name", "credit", "hour", "begintime", "address"]
    )
    data = data.to_dict(orient="records")
    return data


def pd_dict_login(data_list):
    data = pd.DataFrame(data_list, columns=["id", "password"])
    data = data.to_dict(orient="records")
    print(data)
    return data


def pd_dict_major(data_list):
    data = pd.DataFrame(data_list, columns=["id", "name"])
    data = data.to_dict(orient="records")
    return data


def pd_dict_score(data_list):
    print(data_list)
    data = pd.DataFrame(data_list, columns=["timescore", "textscore", "totalscore"])
    data = data.to_dict(orient="records")
    return data


def pd_dict_score_tea(data_list):
    print(data_list)
    # student.stu_id, student.stu_name, score.totalscore, score.timescore, score.textscore
    data = pd.DataFrame(
        data_list,
        columns=[
            "id",
            "name",
            "totalscore",
            "timescore",
            "textscore",
        ],
    )
    data = data.to_dict(orient="records")
    return data


def close_sql(data: sql):
    data.close()


def close_cursor(data_cursor: sql):
    data_cursor.close()
