﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Проверка расчета поля Заказ
	И Я запоминаю в переменную "Организация" значение 'ООО \"1000 мелочей\"'
	И Я запоминаю в переменную "Покупатель" значение 'Магазин \"Бытовая техника\"'
	И Я запоминаю в переменную "Склад" значение "Склад отдела продаж"
	и я Создаю и заполняю шапку заказа в данном контексте
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000006" | "Ботинки"      |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Товары' я завершаю редактирование строки
	Тогда элемент формы с именем 'ТоварыИтогКоличество' стал равен "2"
	И в таблице 'Товары' я перехожу к строке:
		| "Количество" | "Сумма"    | "Товар"     | "Цена"     |
		| "1"          | "2 200,00" | "Босоножки" | "2 200,00" |
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "5"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я перехожу к строке:
		| "Количество" | "Сумма"    | "Товар"   | "Цена"     |
		| "1"          | "2 300,00" | "Ботинки" | "2 300,00" |
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "6"
	И в таблице 'Товары' я завершаю редактирование строки
	Тогда элемент формы с именем 'ТоварыИтогКоличество' стал равен "11"
		
		