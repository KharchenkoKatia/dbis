-- LABORATORY WORK 4
-- BY Drapak_Volodymyr

/* Курсор по імені клієнта виводить назви жанрів, які він (клієнт) дивився. */

SET SERVEROUTPUT ON;

DECLARE

    v_client_first_name Clients.first_name%TYPE := 'Lexa';
    v_client_last_name Clients.last_name%TYPE := 'Subotin';
    CURSOR Genre_cursor(c_client_first_name IN Clients.first_name%TYPE,
                        c_client_last_name IN Clients.last_name%TYPE) IS
    SELECT Genres.genre
    FROM Genres
    JOIN Film_genre ON Genres.genre = Film_genre.genre
    JOIN Films ON Film_genre.title = Films.title
    JOIN Seances ON Films.title = Seances.film_title
    JOIN Clients ON (Clients.first_name = Seances.client_first_name)
                AND (Clients.last_name = Seances.client_last_name)
    WHERE (Clients.first_name = c_client_first_name) AND
          (Clients.last_name = c_client_last_name);
BEGIN

    v_client_first_name := '&first_name';
    v_client_last_name := '&last_name';

    FOR genre_record IN Genre_cursor(v_client_first_name, v_client_last_name) LOOP
        DBMS_OUTPUT.PUT_LINE(genre_record.genre);
    END LOOP;

END;

/*курсор параеметр название страни віводит имена студентов что пользуються операторами в єтой стране*/
CURSOR num3(coutr IN Countries.country_name%TYPE,) IS
    SELECT Students.student_name
    FROM phoneNumbers
    WHERE Countries.country_name = coutr ;
BEGIN
    coutrs := '&country_name';
    FOR num IN num3(coutrs) LOOP
        DBMS_OUTPUT.PUT_LINE(Students.student_name);
    END LOOP;
END;
