import pymysql
import PySimpleGUI as sg

try:
    connection = pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             database='restaurant',
                             cursorclass=pymysql.cursors.DictCursor)
    print("successfully")
except Exception as ex:
    print("connection refused")
    print(ex)


"""def execute_read_query(connection, query):
    cursor = connection.cursor()
    result = None
    select_users = "SELECT * FROM users"
    users = execute_read_query(connection, select_users)

    for user in users:
        print(user)"""




sg.theme('Dark Blue 3')

layout1 = [[sg.Button('Отдел кадров', size=(12,6)), sg.Button('Склад'), sg.Button('Заказы')],
          [sg.Exit('Выход')]]

window1 = sg.Window('Ресторан - Главное меню', layout1)

while True:
    event1, values1 = window1.read()
    if event1 == sg.WIN_CLOSED or event1 == 'Выход':
        break
    if event1 == 'Отдел кадров':
        window2 = sg.Window('Ресторан - Отдел кадров', [[sg.Text('Отдел кадров:')],[sg.Output(size=(100, 6), key='-gg-')],
                                                        [sg.Input(key='-hh-')],
                                                        [sg.Button('Обновить'), sg.Button('Выход')]])
        while True:
            event2, values2 = window2.read()
            if event2 == sg.WIN_CLOSED or event2 == 'Выход':
                break
            if event2 == 'Обновить':
                with connection.cursor() as cursor:
                    insert_query = 'select * from workers'
                    cursor.execute(insert_query)
                    a = cursor.fetchall()
                    print(a)
                window2.refresh()
        window2.close()
