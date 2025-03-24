-- İlk Soru :

SELECT SUM(total) AS faturalar_toplami --SUM ile topladık
FROM invoice
WHERE billing_country = 'USA'
  AND EXTRACT(YEAR FROM invoice_date) = 2009; --invoice_date ile sadece yılı aldık(2009)

-- İkinci Soru :

SELECT p.playlist_id, p.name AS playlist_name,t.track_id, t.name AS track_name
FROM track AS t --track tablosu, playlisttrack ve playlist tablosuna bağlanıyor
JOIN playlisttrack AS pt ON t.track_id = pt.track_id
JOIN playlist AS p ON pt.playlist_id = p.playlist_id; --listeleme işlemi yapıyoruz

-- Üçüncü Soru :

SELECT t.name AS track_name, 
       ar.name AS artist_name, 
       t.milliseconds
FROM track AS t --track tablosunu album ve artist tablosuna bağladık
JOIN album AS al ON t.album_id = al.album_id
JOIN artist AS ar ON al.artist_id = ar.artist_id
WHERE al.title = 'Let There Be Rock' --albümden şarkıları çektik
ORDER BY t.milliseconds DESC;
