/*
Nama: Abdul Richard
NIM: 10123905
Kelas: Teknik Informatika 12
*/

import {
    insertBooking
} from "../models/BookTableModel.js";

// CREATE Booking
export const createBooking=(req,res)=>{
    const data = req.body;
    insertBooking(data,(err,results)=> {
        if (err) {
            res.send(err);
        }else {
            res.json(results);
        }
    });
};