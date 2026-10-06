<?php
class Database
{
    private static ?Database $instance = null;
    private PDO $pdo;

    private const HOST    = 'localhost';
    private const DBNAME  = 'inventaris_db';
    private const USER    = 'root';
    private const PASS    = '';
    private const CHARSET = 'utf8mb4';

    private function __construct()
    {
        $dsn = 'mysql:host=' . self::HOST . ';dbname=' . self::DBNAME . ';charset=' . self::CHARSET;
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $this->pdo = new PDO($dsn, self::USER, self::PASS, $options);
        } catch (PDOException $e) {
            error_log($e->getMessage());
            die('Koneksi database gagal. Periksa konfigurasi.');
        }
    }

    private function __clone() {}

    public static function getInstance(): Database
    {
        if (self::$instance === null) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    public function getConnection(): PDO
    {
        return $this->pdo;
    }
}