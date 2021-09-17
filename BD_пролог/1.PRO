NOWARNINGS % Отключение предупреждений
DOMAINS
	% Описание типов данных
	f_tittle, f_genre, f_director, f_stars = string
	f_year = integer
	
	f_tittle2, f_genre2, f_director2, f_stars2 = string
	f_year2 = integer
	
	f_tittle3, f_genre3, f_director3, f_stars3 = string
	f_year3 = integer
	% Символьное имя файла
	file = destination
	
	database
		% Предикаты динамической базы данных
		dplayer(f_tittle,f_genre,f_year,f_director,f_stars) 
		dplayer2(f_tittle2,f_genre2,f_year2,f_director2,f_stars2)
		dplayer3(f_tittle3,f_genre3,f_year3,f_director3,f_stars3)
PREDICATES

	repeat % Повтор 
	wind % Окно вывода ошбки ввода
	do_fbase % Главное правило (модуль) программы.
	menu % Реализация меню
	create_database % Открытие и чтение файла, в которм находится БД
	
	process(integer) % Различные операции из перечня меню
	clear_database % Очистка БД
	
	error % Сообщение об ошибке

CLAUSES

	repeat.
	repeat:-
		repeat.
		
	create_database:-
		openread(destination,"text1.db"),
		readdevice(destination),
		consult("text1.db"),
		dplayer(F_tittle, F_genre,F_year, F_director, F_stars),
		not(eof(destination)),
		closefile(destination),
		readdevice(keyboard).
		
		
		
	clear_database:-
		retract(dplayer(_,_,_,_,_)),fail.
		clear_database:-!.
		
	

	do_fbase:-	
		create_database,
		%База даных игроков Зенита с высоким рейтингом
		makewindow(1,63,123,"The database of players of Zenit with a high rating",0,0,24,80,1,-1,"++++-¦"),
		menu,
		clear_database.
		
	wind:-
		%Ошибка
		makewindow(9,7,59,"<<<Error>>",14,7,5,44),
		shiftwindow(9),
		%Этот игрок отсутствует в базе данных
		write("    This player is not in the database."),nl,
		nl,!,
		%Нажмите пробел
		write("              Press space.."),
		readchar(_),
		removewindow,
		shiftwindow(1).
		
	menu:-
		% 0. БД
		% 1. Добавление новой записи
		% 2. Удаление записи
		% 3. Просмотр
		% 4. Изменение записи
		% 5. Сохраните базу данных в файл в формате EXCEL
		% 6. Сохраните базу данных в файл
		% 7. Выход из программы
		repeat,
		clearwindow,
		write(" * * * * * * * * * * * * * * * * * * * * * * * * * * * *"),nl,
		write(" "),nl,
		write("      0. BD"),nl,
		write("      1. Reserve players"),nl,
		write("      2. Coach"),nl,
		write("      3. Adding a new record"),nl,
		write("      4. Adding a record of reserve players"),nl,
		write("      5. Adding an entry about the coach"),nl,
		write("      6. Record deletion"),nl,
		write("      7. Deleting a coach record from the database"),nl,
		write("      8. Deleting a  record of reserve players the database"),nl,
		write("      9. Viewing"),nl,
		write("      10. Changing a record"),nl,
		write("      11. Save the database to a file in EXCEL format"),nl,
		write("      12. Save the database to a file"),nl,
		write("      13. Save the database to a file in EXCEL format-coach"),nl,
		write("      14. Save the database to a file-coach"),nl,
		write("      15. Save the database to a file in EXCEL format-Reserve players"),nl,
		write("      16. Program exit"),nl,
		write(" "),nl,
		write("  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"),nl,
		nl,
		%Выберите номер
		write("      Select number: 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15 or 16 : "),
		readint(Choice),nl,
		process(Choice),
		Choice = 16,!.
    % Просмотр всей БД  
	process(0):-
		makewindow(2,63,-8,"The database of players of Zenit with a high rating",0,0.5,24,78,1,-1,"++++-¦"),
		shiftwindow(2),
		write("|         Name       |       Nationality      |   Number   |     Position  |"),nl,
		write("|                                  Teams                                   |"),
		dplayer(F_tittle, F_genre,F_year, F_director, F_stars),
		write("____________________________________________________________________________"),
		write("|",F_tittle," | ",F_genre," | ",F_year," | ",F_director,"|"),nl, 
		write("|",F_stars,"|"),nl,
		write("____________________________________________________________________________"),
		fail;!,
		%Нажмите пробел
		write("Press space..."),
		readchar(_),
		removewindow,
		shiftwindow(1).
		
	process(1):-
		makewindow(2,63,-8,"The database of players of Zenit with a high rating",0,0.5,24,78,1,-1,"++++-¦"),
		shiftwindow(2),
		write("|         Name       |       Nationality      |   Number   |     Position  |"),nl,
		write("|                                  Teams                                   |"),
		dplayer3(F_tittle3, F_genre3,F_year3, F_director3, F_stars3),
		write("____________________________________________________________________________"),
		write("|",F_tittle3," | ",F_genre3," | ",F_year3," | ",F_director3,"|"),nl, 
		write("|",F_stars3,"|"),nl,
		write("____________________________________________________________________________"),
		fail;!,
		%Нажмите пробел
		write("Press space..."),
		readchar(_),
		removewindow,
		shiftwindow(1).
	
	process(2):-
		makewindow(2,63,-8,"The database of players of Zenit with a high rating",0,0.5,24,78,1,-1,"++++-¦"),
		shiftwindow(2),
		write("|         Name       |       Nationality      | Years |Position when played|"),nl,
		write("|                                  Teams                                   |"),
		dplayer2(F_tittle2, F_genre2,F_year2, F_director2, F_stars2),
		write("____________________________________________________________________________"),
		write("|",F_tittle2," | ",F_genre2," | ",F_year2," | ",F_director2,"|"),nl, 
		write("|",F_stars2,"|"),nl,
		write("____________________________________________________________________________"),
		fail;!,
		%Нажмите пробел
		write("Press space..."),
		readchar(_),
		removewindow,
		shiftwindow(1).
	
	% Добавление новой записи в БД
	process(3):-
		%Добавление новой записи
		makewindow(3,63,-8,"Adding a new record",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(3),nl,
		write("  Name: "),
		readln(F_tittle),
		write("  Nationality: "),
		readln(F_genre),
		write("  Number: "),
		readint(F_year),
		write("  Position: "),
		readln(F_director),
		write("  Teams: "),
		readln(F_stars),
		assertz(dplayer(F_tittle,F_genre,F_year,F_director,F_stars)),
		openappend(destination,"text1.db"),
		writedevice(destination),
		save("text1.db"),
		writedevice(screen),
		%Теперь в базе данных
		write("  ",F_tittle," now in the database."),
		closefile(destination),
		nl,!,
		write("  Press space. "),
		readchar(_),
		removewindow.
	process(3):-
		makewindow(9,7,59,"<<<Error>>",14,7,5,39),
		shiftwindow(9),
		%Ошибка ввода, пожалуйста, попробуйте еще раз
		write("   Input error, please try again."),nl,
		nl,!,
		write("          Press space.."),
		readchar(_),
		removewindow,
		shiftwindow(1).
		
		% Добавление новой записи в БД
	process(4):-
		%Добавление новой записи
		makewindow(3,63,-8,"Adding a record of reserve players",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(3),nl,
		write("  Name: "),
		readln(F_tittle3),
		write("  Nationality: "),
		readln(F_genre3),
		write("  Number: "),
		readint(F_year3),
		write("  Position: "),
		readln(F_director3),
		write("  Teams: "),
		readln(F_stars3),
		assertz(dplayer3(F_tittle3,F_genre3,F_year3,F_director3,F_stars3)),
		openappend(destination,"t3.db"),
		writedevice(destination),
		save("t3.db"),
		writedevice(screen),
		%Теперь в базе данных
		write("  ",F_tittle3," now in the database."),
		closefile(destination),
		nl,!,
		write("  Press space. "),
		readchar(_),
		removewindow.
	process(4):-
		makewindow(9,7,59,"<<<Error>>",14,7,5,39),
		shiftwindow(9),
		%Ошибка ввода, пожалуйста, попробуйте еще раз
		write("   Input error, please try again."),nl,
		nl,!,
		write("          Press space.."),
		readchar(_),
		removewindow,
		shiftwindow(1).
     
	% Добавление новой записи в БД
	process(5):-
		%Добавление новой записи
		makewindow(3,63,-8," Adding an entry about the coach",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(3),nl,
		write("  Name: "),
		readln(F_tittle2),
		write("  Nationality: "),
		readln(F_genre2),
		write("  Years: "),
		readint(F_year2),
		write("  Position when played: "),
		readln(F_director2),
		write("Coached teams: "),
		readln(F_stars2),
		assertz(dplayer2(F_tittle2,F_genre2,F_year2,F_director2,F_stars2)),
		openappend(destination,"t1.db"),
		writedevice(destination),
		save("t1.db"),
		writedevice(screen),
		%Теперь в базе данных
		write("  ",F_tittle2," now in the database."),
		closefile(destination),
		nl,!,
		write("  Press space. "),
		readchar(_),
		removewindow.
	process(5):-
		makewindow(9,7,59,"<<<Error>>",14,7,5,39),
		shiftwindow(9),
		%Ошибка ввода, пожалуйста, попробуйте еще раз
		write("   Input error, please try again."),nl,
		nl,!,
		write("          Press space.."),
		readchar(_),
		removewindow,
		shiftwindow(1).
	
	% Удаление записи БД 
	process(6):-
		%Удаление из базы данных
		makewindow(4,15,-8,"Deleting from the database",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(4),nl,
		%Какого игрока удалить
		write("  Which player to remove? \n "),nl, 
		write("  "), 
		readln(F_tittle), 
		retract(dplayer(F_tittle,_,_,_,_)), 
		openwrite(destination,"text1.db"),
		writedevice(destination),
		save("text1.db"),nl,
		writedevice(screen),
		%Успешно удален из базы данных
		write("  ",F_tittle,"\n has been successfully deleted from the database."),
		closefile(destination),
		nl, !,
		write("  Press space."),
		readchar(_),
		removewindow.
	process(6):-
		wind.
    
	% Удаление записи БД 
	process(7):-
		%Удаление из базы данных
		makewindow(4,15,-8,"Deleting a coach record from the database",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(4),nl,
		%Какого игрока удалить
		write("  Which coach to remove? \n "),nl, 
		write("  "), 
		readln(F_tittle2), 
		retract(dplayer2(F_tittle2,_,_,_,_)), 
		openwrite(destination,"t1.db"),
		writedevice(destination),
		save("t1.db"),nl,
		writedevice(screen),
		%Успешно удален из базы данных
		write("  ",F_tittle2,"\n has been successfully deleted from the database."),
		closefile(destination),
		nl, !,
		write("  Press space."),
		readchar(_),
		removewindow.
	process(7):-
		wind.
		
		% Удаление записи БД 
	process(8):-
		%Удаление из базы данных
		makewindow(4,15,-8,"Deleting a  record of reserve players the database",2,20,18,58,1,-1,"++++-¦"),
		shiftwindow(4),nl,
		%Какого игрока удалить
		write("  Which reserve players to remove? \n "),nl, 
		write("  "), 
		readln(F_tittle3), 
		retract(dplayer2(F_tittle3,_,_,_,_)), 
		openwrite(destination,"t4.db"),
		writedevice(destination),
		save("t4.db"),nl,
		writedevice(screen),
		%Успешно удален из базы данных
		write("  ",F_tittle3,"\n has been successfully deleted from the database."),
		closefile(destination),
		nl, !,
		write("  Press space."),
		readchar(_),
		removewindow.
	process(8):-
		wind.
		
	% Просмотр информации о конкртеном игроке в БД	
	process(9):-
		%Просмотр информации об игроке
		makewindow(5,95,123,"View information about the player",4,30,16,47,1,-1,"++++-¦"), 
		shiftwindow(5),nl,
		%Введите имя игрока
		write("Enter the player's name: "), 
		readln(F_tittle), 
		dplayer(F_tittle, F_genre,F_year, F_director, F_stars),nl, 
		nl,write(" Name:	",F_tittle),
		nl,write(" Nationality:",F_genre),
		nl,write(" Number:",F_year),
		nl,write(" Position:",F_director),
		nl,write(" Teams:",F_stars),
		nl,nl,!,
		nl,write("  Press space."),
		readchar(_),
		removewindow.
	process(9):-
		wind.
		
    % Изменение запси БД
	process(10):-
		makewindow(6,95,7,"Changing",2,4,21,65,1,-1,"++++-¦"),
		shiftwindow(6),
		writedevice(screen),nl,
		%Введите имя игрока чтобы изменить параметры 
		write("Enter the player's name to change the settings: \n"),
		write(" "),readln(F_tittle),nl,
		dplayer(F_tittle,F_genre,F_year,F_director,F_stars),
		%Редактирование игрока
		write(" Editing a player : \n"),
		write("|",F_tittle," | ",F_genre," | ",F_year," | ",F_director,"|"), nl, 
		write("|",F_stars,"|"),nl,nl,
		write(" Name: "),
		readln(F1_tittle),
		write(" Nationality: "),
		readln(F1_genre),
		write(" Number: "),
		readint(F1_year),
		write(" Position: "),
		readln(F1_director),
		write(" Teams: "),
		readln(F1_stars),
		retract(dplayer(F_tittle,_,_,_,_)),
		assertz(dplayer(F1_tittle,F1_genre,F1_year,F1_director,F1_stars)),
		openappend(destination,"text1.db"),
		writedevice(destination),
		save("text1.db"),
		writedevice(screen),
		%теперь в базе данных.
		write(" ",F1_tittle," now in the database."),
		writedevice(screen),
		closefile(destination),nl,!,
		write(" Press space..."),
		readchar(_),
		removewindow.
	process(10):-
		wind.
	
	% Сохрание БД в файл ( формат EXCEL )
	process(11):-
		%Сохраните базу данных в файл в формате EXCEL
		makewindow(7,95,59,"Save the database to a file in EXCEL format",18,12,5,55),
		shiftwindow(7),
		openwrite(destination,"text.db"),
		writedevice(destination),
		dplayer(F_tittle, F_genre,F_year, F_director, F_stars),
		write( F_tittle," | ",
			F_genre," | ",
			F_year," | ",
			F_director, " | ",
			F_stars," | " ), nl, fail;
		closefile(destination),
		writedevice(screen),!,
		%Данные были успешно записаны в text. db.
		write("   Data has been written successfully to text.db.\n\n               Press space.."),readchar(_),
		removewindow,
		shiftwindow(1).
		
	% Сохрание БД в файл	
	process(12):-
		%Сохраните базу данных в файл
		makewindow(8,95,59,"Save the database to a file",18,12,5,55),
		shiftwindow(8),
		openwrite(destination,"text1.db"),
		writedevice(destination),
		dplayer(F_tittle, F_genre,F_year, F_director, F_stars),
		save("text1.db"),
		closefile(destination),
		writedevice(screen),!,
		%Данные были успешно записаны в text1. db.
		write("   Data has been written successfully to text1.db.\n\n               Press space.."),readchar(_),
		removewindow,
		shiftwindow(1).
		
		% Сохрание БД в файл ( формат EXCEL )
	process(13):-
		%Сохраните базу данных в файл в формате EXCEL
		makewindow(7,95,59,"Save the database to a file in EXCEL format-coach",18,12,5,55),
		shiftwindow(7),
		openwrite(destination,"t.db"),
		writedevice(destination),
		dplayer2(F_tittle2, F_genre2,F_year2, F_director2, F_stars2),
		write( F_tittle2," | ",
			F_genre2," | ",
			F_year2," | ",
			F_director2, " | ",
			F_stars2," | " ), nl, fail;
		closefile(destination),
		writedevice(screen),!,
		%Данные были успешно записаны в t. db.
		write("   Data has been written successfully to t.db.\n\n               Press space.."),readchar(_),
		removewindow,
		shiftwindow(1).
		
	% Сохрание БД в файл	
	process(14):-
		%Сохраните базу данных в файл
		makewindow(8,95,59,"Save the database to a file-coach",18,12,5,55),
		shiftwindow(8),
		openwrite(destination,"t1.db"),
		writedevice(destination),
		dplayer2(F_tittle2, F_genre2,F_year2, F_director2, F_stars2),
		save("t1.db"),
		closefile(destination),
		writedevice(screen),!,
		%Данные были успешно записаны в t1. db.
		write("   Data has been written successfully to t1.db.\n\n               Press space.."),readchar(_),
		removewindow,
		shiftwindow(1).
		
	% Сохрание БД в файл ( формат EXCEL )
	process(15):-
		%Сохраните базу данных в файл в формате EXCEL
		makewindow(7,95,59,"Save the database to a file in EXCEL format-Reserve players",18,12,5,55),
		shiftwindow(7),
		openwrite(destination,"t4.db"),
		writedevice(destination),
		dplayer3(F_tittle3, F_genre3,F_year3, F_director3, F_stars3),
		write( F_tittle3," | ",
			F_genre3," | ",
			F_year3," | ",
			F_director3, " | ",
			F_stars3," | " ), nl, fail;
		closefile(destination),
		writedevice(screen),!,
		%Данные были успешно записаны в t4. db.
		write("   Data has been written successfully to t4.db.\n\n               Press space.."),readchar(_),
		removewindow,
		shiftwindow(1).
	
	% Выход из программы
	process(16):-
		%Закончите работу с программой?
		write("        Finish working with the program? (y/n)  "),
		readln(Answer),
		% Успешен только в том случае,
		% если ответ пользователя на запрос программы начинается с буквы 'y'
		frontchar(Answer,'y',_), !.
	process(Choice):-
		Choice<0,Choice>16,error.
	error:-
		%Введите число от 0 до 16
		write("        Enter a number from 0 to 16 \n"),
		%Нажмите пробел, чтобы продолжить
		write("      Press the space bar to continue"),
		readchar(_).	
GOAL
	do_fbase.
