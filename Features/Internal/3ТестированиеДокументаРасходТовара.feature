﻿#language: ru

@tree

Функционал: функционал

Добавлен документ РасходТовара (Продажи – Документ Продажи). Необходимо написать тесты
для его полной проверки, включая проведение, движения по регистрам, а также печатные формы
Расходная товарная накладная (в печатной форме проверка по заполнению значения в поле Дата
не нужна).

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: ТестированиеДокументаРасходТовара
*Создаем документ, заполняем данными с ошибкойв табличной части(товаров на 1 больше чем на складе)
	И В командном интерфейсе я выбираю "Продажи" "Документы продаж"
	Тогда открылось окно "Документы продаж"
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно "Продажа товара (создание)"
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Шлюзовая ООО"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
	И реквизиты формы имеют значение:
		| 'Имя'                  | 'Значение'             | 'КакИскать' |
		| 'Валюта'               | ""                     | ''          |
		| 'ВидЦен'               | "Оптовая"              | ''          |
		| 'Номер'                | ""                     | ''          |
		| 'ОбоснованиеОтгрузки'  | ""                     | ''          |
		| 'Организация'          | "ООО \"1000 мелочей\"" | ''          |
		| 'Покупатель'           | "Шлюзовая ООО"         | ''          |
		| 'Склад'                | "Склад отдела продаж"  | ''          |
		| 'ТоварыИтогКоличество' | "0"                    | ''          |
		| 'ТоварыИтогСумма'      | "0"                    | ''          |	
	
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"

	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Продукты"     |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Список' я перехожу к строке:
		| "Артикул" | "Код"       | "Количество" | "Наименование" |
		| "Т78"     | "000000032" | "270,00"     | "Торт "        |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Продажа товара (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Электротовары"     |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Чайники"     |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Veko67NE"     |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Продажа товара (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "51,00"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'КомандаПодбор'
	Тогда открылось окно "Подбор товара"
	И я нажимаю на кнопку с именем 'ОК'
	Тогда открылось окно "Продажа товара (создание) *"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля с именем 'Номер' как 'НомерДокумента'
	И я нажимаю на кнопку с именем 'ФормаПровести'
*Получаем ошибку	
	Тогда открылось окно "1С:Предприятие"
	И я нажимаю на кнопку с именем 'OK'
	Тогда в логе сообщений TestClient есть строки:
		|'Не хватает 1 единиц товара"Veko67NE" на складе"Склад отдела продаж".Максимальное количество: 50.'|
*Исправляем данные и проверяем после проведения регистры и печатную форму Расходная товарная накладная
	Тогда открылось окно "Продажа * от *"
	И в таблице 'Товары' я перехожу к строке:
		| "N" | "Количество" | "Сумма"      | "Товар"    | "Цена"      |
		| "2" | "51,00"      | "510 000,00" | "Veko67NE" | "10 000,00" |
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "50,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда открылось окно "Продажа * от *"
	И я нажимаю на кнопку с именем 'ФормаПровести'
	Тогда открылось окно "Продажа * от *"
	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр взаиморасчетов с контрагентами"
	Тогда таблица 'Список' стала равной по шаблону:
		| 'Период'             | 'Регистратор'                             | 'Номер строки' | 'Контрагент'   | 'Сумма'      | 'Валюта' |
		| '*' | 'Продажа $НомерДокумента$ от *' | '1'            | 'Шлюзовая ООО' | '500 200,00' | ''       |
	
		
	
	
	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр продаж"
	Тогда таблица 'Список' стала равной по шаблону:
		| 'Период'             | 'Регистратор'                             | 'Номер строки' | 'Покупатель'   | 'Товар'    | 'Количество' | 'Сумма'      |
		| '*' | 'Продажа $НомерДокумента$ от *' | '1'            | 'Шлюзовая ООО' | 'Торт '    | '1,00'       | '200,00'     |
		| '*' | 'Продажа $НомерДокумента$ от *' | '2'            | 'Шлюзовая ООО' | 'Veko67NE' | '50,00'      | '500 000,00' |
	
			

	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр товарных запасов"
	Тогда таблица 'Список' стала равной по шаблону:
		| 'Период'             | 'Регистратор'                             | 'Номер строки' | 'Товар'    | 'Склад'               | 'Количество' |
		| '*' | 'Продажа $НомерДокумента$ от *' | '1'            | 'Торт '    | 'Склад отдела продаж' | '1,00'       |
		| '*' | 'Продажа $НомерДокумента$ от *' | '2'            | 'Veko67NE' | 'Склад отдела продаж' | '50,00'      |
	
			
	И В текущем окне я нажимаю кнопку командного интерфейса "Основное"



	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда открылось окно "Таблица"
	Тогда табличный документ 'SpreadsheetDocument' равен по шаблону:
		| 'Расход товара' | ''                                             | ''           | ''        |
		| ''              | ''                                             | ''           | ''        |
		| 'Номер'         | '$НомерДокумента$'                                    | ''           | ''        |
		| 'Дата'          | '*'                           | ''           | ''        |
		| 'Покупатель'    | 'Шлюзовая ООО'                                 | ''           | ''        |
		| 'Склад'         | 'Склад отдела продаж'                          | ''           | ''        |
		| 'Сумма'         | '500 200 рублей (Пятьсот тысяч двести рублей)' | ''           | ''        |
		| 'Вес'           | ''                                             | ''           | ''        |
		| ''              | ''                                             | ''           | ''        |
		| 'Товар'         | 'Цена'                                         | 'Количество' | 'Сумма'   |
		| 'Торт '         | '200'                                          | '1'          | '200'     |
		| 'Veko67NE'      | '10 000'                                       | '50'         | '500 000' |
	
		
