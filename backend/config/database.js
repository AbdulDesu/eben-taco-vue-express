/*
Nama: Abdul Richard
NIM: 10123905
Kelas: Teknik Informatika 12
*/

import mysql from "mysql2";

// Konfigurasi database
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "eben_stand"
});


db.connect(error => {
  if (error) throw error;
  console.log("Berhasil Terhubung Dengan Database");
});

export default db;