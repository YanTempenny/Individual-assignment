import pymysql
import PySimpleGUI as sg
import traceback

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







sg.theme('Dark Blue 3')

layout1 = [[sg.Button('Отдел кадров', size=(12,6)), sg.Button('Склад', size=(12,6)), sg.Button('Заказы', size=(12,6))],
          [sg.Exit('Выход')]]

window1 = sg.Window('Ресторан - Главное меню', layout1)

while True:
    event1, values1 = window1.read()
    if event1 == sg.WIN_CLOSED or event1 == 'Выход':
        break
    if event1 == 'Заказы':
        window12 = sg.Window('Ресторан - Заказы',
                            [[sg.Text('Заказы')], [sg.Output(size=(150, 6), key='-sc-')],
                             [sg.Text('Выбор поставщика'), sg.Combo(['Выполнено', 'Не выполнено'], key='-ms-'),
                              sg.Button('Обновить')],
                             [sg.Button('Добавить'), sg.Button('Удалить')],
                             [sg.Button('Выход')]])
        while True:
            event12, values12 = window12.read()
            if event12 in (sg.WIN_CLOSED, 'Выход'):
                break
            if event12 == 'Удалить':
                window15 = sg.Window('Ресторан - Заказы - Удаление',
                                     [[sg.Text('Выберите строку для удаления заказа'), sg.Input(key='-DID-')],
                                      [sg.Button('Удалить'), sg.Button('Выход')]])
                while True:
                    event15, values15 = window15.read()
                    if event15 in (sg.WIN_CLOSED, 'Выход'):
                        break
                    if event15 == 'Удалить':
                        with connection.cursor() as cursor:
                            insert_query = "delete from orders where IDOrder = %s"
                            cursor.execute(insert_query, values15['-DID-'])
                            connection.commit()
                        window16 = sg.Window('Ресторан - Заказы - Удаление', [[sg.Text('Данные удалены!')],
                                                                             [sg.Button('Закрыть')]])
                        while True:
                            event16, values16 = window16.read()
                            if event16 == sg.WIN_CLOSED or event16 == 'Закрыть':
                                break
            if event12 == 'Добавить':
                window13 = sg.Window('Ресторан - Заказы - Добавление', [[sg.Text('Дата заказа'), sg.CalendarButton('Выбор', target='-DO-', format='%Y-%m-%d'), sg.In('*дата*', key='-DO-')],
                                                                             [sg.Text('Время заказа (формат ЧЧ:ММ:СС)'), sg.Input(key='-TO-')],
                                                                             [sg.Text('ФИО заказчика'), sg.Input(key='-FO-')],
                                                                             [sg.Text('Телефон заказчика'), sg.Input(key='-NO-')],
                                                                             [sg.Text('Выбор первого блюда'), sg.Combo(['Мясная гастрономия с хреном и горчицей', 'Овощные соленья', 'Сало с гренками и острым перцем', 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Ассорти из свежих овощей', 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Картофельное пюре', 'Пельмени', 'Лазанья'], key='-CF1-')],
                                                                             [sg.Text('Выбор второго блюда'), sg.Combo(['Мясная гастрономия с хреном и горчицей', 'Овощные соленья', 'Сало с гренками и острым перцем', 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Ассорти из свежих овощей', 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Картофельное пюре', 'Пельмени', 'Лазанья'],key='-CF2-')],
                                                                             [sg.Text('Выбор третьего блюда'), sg.Combo(['Мясная гастрономия с хреном и горчицей', 'Овощные соленья', 'Сало с гренками и острым перцем', 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Ассорти из свежих овощей', 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Картофельное пюре', 'Пельмени', 'Лазанья'],key='-CF3-')],
                                                                             [sg.Text('Цена заказа'), sg.Input(key='-CO-')],
                                                                             [sg.Text('Отметка готовности заказа'), sg.Combo(['Выполнено', 'Не выполнено'], size=(20, 1), key='-MS-')],
                                                                             [sg.Text('Код сотрудника занимающийся заказом'), sg.Spin([i for i in range(1, 11)], initial_value=1, size=(5,1), key='-PC-')],
                                                                             [sg.Button('Добавить'), sg.Button('Выход')]])
                while True:
                    event13, values13 = window13.read()
                    if event13 == sg.WIN_CLOSED or event13 == 'Выход':
                        break
                    if event13 == 'Добавить':
                        with connection.cursor() as cursor:
                            insert_query = "INSERT INTO `orders` (`IDOrder`, `DateOrder`, `TimeOrder`, `FullNameOrder`, `NumberOrder`, `CodeFood1`, `CodeFood2`, `CodeFood3`, `CostOrder`, `MarkSuccess`, `PositionCode`) VALUES (NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                            cursor.execute(insert_query, (values13['-DO-'], values13['-TO-'], values13['-FO-'], values13['-NO-'], values13['-CF1-'],values13['-CF2-'], values13['-CF3-'], values13['-CO-'], values13['-MS-'], values13['-PC-']))
                            connection.commit()
                        window14 = sg.Window('Ресторан - Заказы - Добавление', [[sg.Text('Данные записаны!')],
                                                                              [sg.Button('Закрыть')]])
                        while True:
                            event14, values14 = window14.read()
                            if event14 == sg.WIN_CLOSED or event14 == 'Закрыть':
                                break
            if event12 == 'Обновить':
                window12.FindElement('-sc-').Update('')
                with connection.cursor() as cursor:
                    insert_query = 'select IDOrder, DateOrder, FullNameOrder, NumberOrder, CodeFood1, CodeFood2, CodeFood3, CostOrder, MarkSuccess, PositionCode from orders where MarkSuccess = %s'
                    cursor.execute(insert_query, values12['-ms-'])
                    a = cursor.fetchall()
                    for row in a:
                        print(row["IDOrder"], '-', row["DateOrder"], '-', row["FullNameOrder"], '-', row["NumberOrder"], '-', row["CodeFood1"], '-', row["CodeFood2"], '-', row["CodeFood3"], '-', row["CostOrder"], '-', row["MarkSuccess"], '-', row["PositionCode"])
                        print('-------------------------------------------------------')
                window12.refresh()
    if event1 == 'Склад':
        window7 = sg.Window('Ресторан - Склад',
                            [[sg.Text('Склад')], [sg.Output(size=(100, 6), key='-sc-')],
                             [sg.Text('Выбор поставщика'), sg.Combo(['Каштан', 'Щербаков', 'Горки'], key='-cs-'),
                              sg.Button('Обновить')],
                             [sg.Button('Добавить'), sg.Button('Удалить')],
                             [sg.Button('Выход')]])
        while True:
            event7, values7 = window7.read()
            if event7 in (sg.WIN_CLOSED, 'Выход'):
                break
            if event7 == 'Удалить':
                window10 = sg.Window('Ресторан - Склад - Удаление',
                                    [[sg.Text('Выберите строку для удаления ингредиента на складе'), sg.Input(key='-NID-')],
                                     [sg.Button('Удалить'), sg.Button('Выход')]])
                while True:
                    event10, values10 = window10.read()
                    if event10 in (sg.WIN_CLOSED, 'Выход'):
                        break
                    if event10 == 'Удалить':
                        with connection.cursor() as cursor:
                            insert_query = "delete from warehouse where WarehouseID = %s"
                            cursor.execute(insert_query, values10['-NID-'])
                            connection.commit()
                        window11 = sg.Window('Ресторан - Склад - Удаление', [[sg.Text('Данные удалены!')],
                                                                                   [sg.Button('Закрыть')]])
                        while True:
                            event11, values11 = window11.read()
                            if event11 == sg.WIN_CLOSED or event11 == 'Закрыть':
                                break
            if event7 == 'Добавить':
                window8 = sg.Window('Ресторан - Склад - Добавление', [[sg.Text('Название ингредиента'), sg.Input(key='-In-')],
                                                                             [sg.Text('Дата выпуска'), sg.CalendarButton('Выбор', target='-DI-', format='%Y-%m-%d'), sg.In('*дата*', key='-DI-')],
                                                                             [sg.Text('Объём ингредиента'), sg.Input(key='-Vol-')],
                                                                             [sg.Text('Срок годности'), sg.Input(key='-SL-')],
                                                                             [sg.Text('Стоимость'), sg.Input(key='-Cost-')],
                                                                             [sg.Text('Поставщик'), sg.Combo(['Каштан', 'Щербаков', 'Горки'], key='-Sup-')],
                                                                             [sg.Button('Добавить'), sg.Button('Выход')]])
                while True:
                    event8, values8 = window8.read()
                    if event8 == sg.WIN_CLOSED or event8 == 'Выход':
                        break
                    if event8 == 'Добавить':
                        with connection.cursor() as cursor:
                            insert_query = "INSERT INTO `warehouse` (`WarehouseID`, `NameIngredient`, `DataIssue`, `Volume`, `ShelfLife`, `Cost`, `Supplier`) VALUES (NULL, %s, %s, %s, %s, %s, %s)"
                            cursor.execute(insert_query, (values8['-In-'], values8['-DI-'], values8['-Vol-'],values8['-SL-'],values8['-Cost-'],values8['-Sup-']))
                            connection.commit()
                        window9 = sg.Window('Ресторан - Склад - Добавление', [[sg.Text('Данные записаны!')],
                                                                                    [sg.Button('Закрыть')]])
                        while True:
                            event9, values9 = window9.read()
                            if event9 == sg.WIN_CLOSED or event9 == 'Закрыть':
                                break

            if event7 == 'Обновить':
                window7.FindElement('-sc-').Update('')
                with connection.cursor() as cursor:
                    insert_query = 'select WarehouseID, NameIngredient, Supplier from warehouse where Supplier = %s'
                    cursor.execute(insert_query, values7['-cs-'])
                    a = cursor.fetchall()
                    for row in a:
                        print(row["WarehouseID"], '-', row["NameIngredient"], '-', row["Supplier"])
                        print('-------------------------------------------------------')
                window7.refresh()
    if event1 == 'Отдел кадров':
        window2 = sg.Window('Ресторан - Отдел кадров', [[sg.Text('Отдел кадров')],[sg.Output(size=(100, 6), key='-gg-')],
                                                        [sg.Text('Выбор должности'),sg.Combo(['Повар', 'Официант', 'Администратор', 'Шеф повар', 'Директор'], key='-hh-'), sg.Button('Обновить')],
                                                        [sg.Button('Добавить'), sg.Button('Удалить')],
                                                        [sg.Button('Выход')]])
        while True:
            event2, values2 = window2.read()
            if event2 in (sg.WIN_CLOSED, 'Выход'):
                break
            if event2 == 'Удалить':
                window5 = sg.Window('Ресторан - Отдел кадров - Удаление', [[sg.Text('Выберите строку для удаления сотрудника'), sg.Input(key='-IDW-')],
                                                                           [sg.Button('Удалить'), sg.Button('Выйти')]])
                while True:
                    event5, values5 = window5.read()
                    if event5 in (sg.WIN_CLOSED, 'Выход'):
                        break
                    if event5 == 'Удалить':
                        with connection.cursor() as cursor:
                            insert_query = "delete from workers where WorkersID = %s"
                            cursor.execute(insert_query, values5['-IDW-'])
                            connection.commit()
                        window6 = sg.Window('Ресторан - Отдел кадров - Удаление', [[sg.Text('Данные удалены!')],
                                                                                    [sg.Button('Закрыть')]])
                        while True:
                            event6, values6 = window6.read()
                            if event6 == sg.WIN_CLOSED or event6 == 'Закрыть':
                                break
            if event2 == 'Обновить':
                window2.FindElement('-gg-').Update('')
                with connection.cursor() as cursor:
                    insert_query = 'select WorkersID, FullName, CodePosition from workers where CodePosition = %s '
                    cursor.execute(insert_query, values2['-hh-'])
                    a = cursor.fetchall()
                    for row in a:
                        print(row["WorkersID"], '-', row["FullName"], '-', row["CodePosition"])
                        print('-------------------------------------------------------')
                window2.refresh()
            if event2 == 'Добавить':
                window3 = sg.Window('Ресторан - Отдел кадров - Добавление', [[sg.Text('ФИО'), sg.Input(key='-FIO-')],
                                                                             [sg.Text('Возраст'), sg.Input(key='-Age-')],
                                                                             [sg.Text('Пол'), sg.Input(key='-Gen-')],
                                                                             [sg.Text('Адрес'), sg.Input(key='-Adr-')],
                                                                             [sg.Text('Номер телефона'), sg.Input(key='-Num-')],
                                                                             [sg.Text('Паспортные данные'), sg.Input(key='-Pass-')],
                                                                             [sg.Text('Должность'), sg.Combo(['Повар', 'Официант', 'Администратор', 'Шеф повар', 'Директор'], key='-Pos-')],
                                                                             [sg.Button('Добавить'), sg.Button('Выход')]])
                while True:
                    event3, values3 = window3.read()
                    if event3 == sg.WIN_CLOSED or event3 == 'Выход':
                        break
                    if event3 == 'Добавить':
                        with connection.cursor() as cursor:
                            insert_query = "INSERT INTO `workers` (`WorkersID`, `FullName`, `Age`, `Gender`, `Adress`, `Number`, `PassportDate`, `CodePosition`) VALUES (NULL, %s, %s, %s, %s, %s, %s, %s)"
                            cursor.execute(insert_query, (values3['-FIO-'], values3['-Age-'], values3['-Gen-'], values3['-Adr-'], values3['-Num-'], values3['-Pass-'], values3['-Pos-']))
                            connection.commit()
                        window4 = sg.Window('Ресторан - Отдел кадров - Добавление', [[sg.Text('Данные записаны!')],
                                                                                    [sg.Button('Закрыть')]])
                        while True:
                            event4, values4 = window4.read()
                            if event4 == sg.WIN_CLOSED or event4 == 'Закрыть':
                                break

