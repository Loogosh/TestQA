﻿#language: ru

@tree

Функционал: <описание фичи>

1. Протестируйте заполнение следующих полей документа Заказ покупателя:
 Партнер, Соглашение, блокировку поля Контрагент – в случае, если не выбран Партнер. 
 В качестве отчета пришлите ссылку на созданный feature файл в репозитории и скриншот о выполнении теста.   
Прогон осущствляется на Демо базе
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий:Заказ покупателя
	И В командном интерфейсе я выбираю "Продажи" "Заказы покупателей"
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем 'Agreement'
*Заполнение Соглашения и ее проверку
	И в таблице 'List' я перехожу к строке:
		| "Вид"     | "Вид взаиморасчетов"         | "Код" | "Наименование"                                         |
		| "Обычное" | "По стандартным соглашениям" | "5"   | "Общее соглашение (расчет по стандартным соглашениям)" |
	
	И я нажимаю на кнопку с именем 'FormChoose'
	Тогда элемент формы с именем 'Agreement' стал равен "Общее соглашение (расчет по стандартным соглашениям)"
*Проверка недоступности формы контрагент
	И элемент формы "Контрагент" не доступен
*Выбор партнера
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"         |
		| "10"  | "Розничный покупатель" |
	И я нажимаю на кнопку с именем 'FormChoose'
*Проверка доступности формы контрагент
	И элемент формы "Контрагент"  доступен

	И я закрываю все окна клиентского приложения
	

