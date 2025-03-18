Soru - 1 : 
Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulmamız isteniyor. 

SELECT COUNT(*) 
FROM Invoice 
WHERE invoice_id IS NULL -- AND kullanarak devamlılığı sağladım.
  AND customer_id IS NULL 
  AND invoice_date IS NULL 
  AND billing_address IS NULL 
  AND billing_city IS NULL 
  AND billing_state IS NULL 
  AND billing_country IS NULL 
  AND billingpostal_code IS NULL 
  AND total IS NULL;

-- Row sayısı: 1
-- Tamamı null satır : 2

Soru - 2 : 
Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar. Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir sorgu yazmamız isteniyor.

SELECT 
    invoice_id,
    customer_id,
    invoice_date,
    billing_address,
    billing_city,
    billing_state,
    billing_country,
    billingpostal_code,
    total AS orijinal_toplam,
    total * 2 AS cift_toplam -- Yeni değer atadım
FROM 
    Invoice
ORDER BY 
    cift_toplam DESC; // Yeni toplam değer sütununa göre azalan sırada sıraladım.

Soru - 3 : 
Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak birleştirmemiz ve "Açık Adres" olarak yazmamız isteniyor. Ayrıca, bu yeni açık adresi 2013 yılı ve 8. ay’a göre filtrelememiz gerekiyor. 

SELECT 
    invoice_id,
    invoice_date,
    billing_address, -- ihtiyacımız olan değerleri alıyoruz
    CONCAT(LEFT(billing_address, 3), RIGHT(billing_address, 4)) AS "acık_adres",

    total
FROM 
    Invoice
WHERE 
    DATE_PART('year', invoice_date) = 2013 -- yıl parametresini ayarladım
    AND DATE_PART('month', invoice_date) = 8 -- ay parametresini ayarladım
ORDER BY 
    "acık_adres" DESC;
