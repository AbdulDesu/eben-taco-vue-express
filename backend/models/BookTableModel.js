/*
Nama: Abdul Richard
NIM: 10123905
Kelas: Teknik Informatika 12
*/

import db from "../config/database.js";

export const insertBooking = (data,result) => {
    db.query("INSERT INTO booktable SET ?",data, (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};