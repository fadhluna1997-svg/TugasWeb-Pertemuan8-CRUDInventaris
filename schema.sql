DROP DATABASE IF EXISTS inventaris_db;
CREATE DATABASE inventaris_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE inventaris_db;

CREATE TABLE kategori (
    id_kategori   INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE supplier (
    id_supplier   INT AUTO_INCREMENT PRIMARY KEY,
    nama_supplier VARCHAR(150) NOT NULL,
    telepon       VARCHAR(20)  NOT NULL,
    alamat        VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE produk (
    id_produk   INT AUTO_INCREMENT PRIMARY KEY,
    kode_produk VARCHAR(20)  NOT NULL UNIQUE,
    nama_produk VARCHAR(150) NOT NULL,
    id_kategori INT NOT NULL,
    id_supplier INT NOT NULL,
    harga       DECIMAL(12,2) NOT NULL CHECK (harga >= 0),
    stok        INT NOT NULL DEFAULT 0 CHECK (stok >= 0),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produk_kategori FOREIGN KEY (id_kategori)
        REFERENCES kategori(id_kategori) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_produk_supplier FOREIGN KEY (id_supplier)
        REFERENCES supplier(id_supplier) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- SEED DATA (minimal 5 per tabel)
INSERT INTO kategori (nama_kategori) VALUES
('Elektronik'), ('Alat Tulis'), ('Perabot'), ('Makanan & Minuman'), ('Perlengkapan Kebersihan');

INSERT INTO supplier (nama_supplier, telepon, alamat) VALUES
('PT Maju Jaya', '061-4567890', 'Jl. Gatot Subroto No. 10, Medan'),
('CV Sinar Abadi', '061-7788990', 'Jl. Sisingamangaraja No. 25, Medan'),
('UD Berkah Sentosa', '0812-3456-7890', 'Jl. Setia Budi No. 5, Medan'),
('PT Nusantara Supply', '061-8899001', 'Jl. Gajah Mada No. 18, Medan'),
('CV Mitra Sejahtera', '0813-9876-5432', 'Jl. Pemuda No. 7, Medan');

INSERT INTO produk (kode_produk, nama_produk, id_kategori, id_supplier, harga, stok) VALUES
('PRD-001', 'Mouse Wireless Logitech', 1, 1, 150000, 25),
('PRD-002', 'Keyboard Mechanical',     1, 1, 450000, 12),
('PRD-003', 'Pulpen Gel 0.5mm (Box)',  2, 2, 35000, 100),
('PRD-004', 'Buku Tulis A5 (Pack 10)', 2, 2, 48000, 60),
('PRD-005', 'Kursi Kantor Ergonomis',  3, 3, 850000, 8),
('PRD-006', 'Meja Lipat Serbaguna',    3, 3, 320000, 15),
('PRD-007', 'Air Mineral 600ml (Dus)', 4, 4, 42000, 80),
('PRD-008', 'Kopi Instan (Box)',       4, 4, 55000, 40),
('PRD-009', 'Sabun Cuci Tangan 500ml', 5, 5, 22000, 70),
('PRD-010', 'Tisu Gulung (Pack 6)',    5, 5, 30000, 90);