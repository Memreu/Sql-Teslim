-- Kategoriler Tablosu
CREATE TABLE categories (
    id SMALLINT PRIMARY KEY,
    kategori_adi VARCHAR(100) NOT NULL UNIQUE
);

-- Üyeler Tablosu
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    kullanici_adi VARCHAR(50) NOT NULL UNIQUE,
    eposta VARCHAR(100) NOT NULL UNIQUE,
    sifre VARCHAR(255) NOT NULL,
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                                  -- Kayıt zamanı, otomatik atanır
    ad VARCHAR(50),
    soyad VARCHAR(50)
);

-- Eğitimler Tablosu
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    adi VARCHAR(200) NOT NULL,
    aciklama TEXT,
    baslangic DATE,
    bitis DATE,
    egitmen_bilgisi VARCHAR(100),
    category_id SMALLINT,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL             -- Kategori silinirse, burada NULL olur
);

-- Katılım Tablosu
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    member_id INTEGER,
    course_id INTEGER,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE,                 -- Üye silinirse kayıt da silinir
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Sertifikalar Tablosu
CREATE TABLE certificates (
    id SERIAL PRIMARY KEY,
    sertifika_kodu VARCHAR(100) NOT NULL UNIQUE,
    verilis_tarihi DATE NOT NULL
);

-- Sertifika Atama Tablosu
CREATE TABLE certificate_assignments (
    id SERIAL PRIMARY KEY,
    member_id INTEGER,
    certificate_id INTEGER,
    alim_tarihi DATE,
    FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE,
    FOREIGN KEY (certificate_id) REFERENCES certificates(id) ON DELETE CASCADE       -- Sertifika silinirse atama da silinir
);

-- Blog Yazıları Tablosu
CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    baslik VARCHAR(255) NOT NULL,
    icerik TEXT NOT NULL,
    yayin_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    yazar_id INTEGER,
    FOREIGN KEY (yazar_id) REFERENCES members(id) ON DELETE CASCADE                  -- Yazar silinirse yazı da silinir
);
