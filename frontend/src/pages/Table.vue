<template>
    <vue-basic-alert :duration="300" :closeIn="2000" ref="alert" />
    <section class="order-section">

        <div class="heading">
            <span>book a table</span>
            <h3>Nikmati momen berharga mu</h3>
        </div>

        <div class="icons-container">

            <div class="icons ">
                <img src="../assets/images/icon-1.png" alt="">
                <h3>7:00am - 22:00</h3>
            </div>

            <div class="icons">
                <img src="../assets/images/icon-2.png" alt="">
                <h3>+62 85156069757</h3>
            </div>

            <div class="icons">
                <img src="../assets/images/icon-3.png" alt="">
                <h3>Buah Batu No 911, Bandung</h3>
            </div>

        </div>

        <!-- booking form -->
        <form id="bookTableForm" @submit="handleSubmit" novalidate autocomplete="off">

            <div class="row">
                <div class="input-box">
                    <label for="uName">Nama </label>
                    <input type="text" name="uName" id="uName" v-model="orderObj.name">
                    <p v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="uPhone">Nomor Handphone</label>
                    <input type="text" name="uPhone" id="uPhone" v-model="orderObj.phone" maxlength="15">
                    <p v-if="errorObj.phoneErr.length > 0">{{ errorObj.phoneErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="oPeople">Berapa Orang</label>
                    <input type="number" name="oPeople" id="oPeople" v-model="orderObj.people">
                    <p v-if="errorObj.peopleErr.length > 0">{{ errorObj.peopleErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="oTables">Berapa Meja</label>
                    <input type="number" name="oTables" id="oTables" v-model="orderObj.tables">
                    <p v-if="errorObj.tablesErr.length > 0">{{ errorObj.tablesErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="uCard">Kode Referal</label>
                    <input type="text" name="uCard" id="uCard" v-model="orderObj.card" maxlength="10">
                    <p v-if="errorObj.cardErr.length > 0">{{ errorObj.cardErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="oWhen">Kapan</label>
                    <input type="datetime-local" name="oWhen" id="oWhen" v-model="orderObj.when"
                        @click="availableTime()">
                    <p v-if="errorObj.whenErr.length > 0">{{ errorObj.whenErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="uMessage">Pesan untuk kami</label>
                    <textarea placeholder="Apakah anda ingin kami menghias meja anda?" name="uMessage"
                        id="uMessage" cols="30" rows="10" v-model="orderObj.note"></textarea>
                </div>
                <div class="input-box">
                    <iframe class="map"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63350.99983666024!2d107.60967800826961!3d-6.952669499874677!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68e9303ed67d77%3A0x8f6d97dc4e8f3d04!2sBuah%20Batu%2C%20Bandung%2C%20West%20Java%2C%20Indonesia!5e0!3m2!1sen!2s!4v1691537643765!5m2!1sen!2s"
                        loading="lazy"></iframe>
                </div>
            </div>

            <input type="submit" value="Book Now" class="btn">
        </form>

    </section>
</template>

<script>
import axios from 'axios';
import VueBasicAlert from 'vue-basic-alert'
export default {
    name: "Table",

    data() {
        return {
            orderObj: { name: "", phone: "", people: "", tables: "", card: "", when: "", note: "" },
            errorObj: { nameErr: [], phoneErr: [], peopleErr: [], tablesErr: [], cardErr: [], whenErr: [] },
        }
    },

    methods: {
        availableTime: function () {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var currentMonth = ("0" + (now.getMonth() + 1)).slice(-2);
            var maxMonth = ("0" + (now.getMonth() + 3)).slice(-2);
            var hour = ("0" + (now.getHours())).slice(-2);
            var min = ("0" + (now.getMinutes())).slice(-2);
            var minRange = now.getFullYear() + "-" + currentMonth + "-" + day + "T" + hour + ":" + min;
            var maxRange = now.getFullYear() + "-" + maxMonth + "-" + day + "T" + hour + ":" + min;

            document.getElementById("oWhen").setAttribute("min", minRange);
            document.getElementById("oWhen").setAttribute("max", maxRange);
        },

        resetCheckErr: function () {
            this.errorObj.nameErr = [];
            this.errorObj.phoneErr = [];
            this.errorObj.peopleErr = [];
            this.errorObj.tablesErr = [];
            this.errorObj.cardErr = [];
            this.errorObj.whenErr = [];
        },

        checkEmptyErr: function () {
            for (var typeErr in this.errorObj) {
                if (this.errorObj[typeErr].length != 0) {
                    return false;
                }
            }
            return true;
        },



        checkForm: function () {
            this.resetCheckErr();

            // Name validate
            if (!this.orderObj.name) {
                this.errorObj.nameErr.push("Silahkan isi nama lengkap anda");
            }
            else {
                if (!/^[A-Za-z]+$/.test(this.orderObj.name.replace(/\s/g, ""))) {
                    this.errorObj.nameErr.push('Nama hanya boleh mengandung huruf');
                }
            }

            // Phone validate
            if (!this.orderObj.phone) {
                this.errorObj.phoneErr.push('Silahkan isi nomor handphone anda');
            }
            else {
                if (!/[0-9]{10}/.test(this.orderObj.phone)) {
                    this.errorObj.phoneErr.push('Format Nomor telepon tidak valid');
                }

                if (this.orderObj.phone.length < 11) {
                    this.errorObj.phoneErr.push('Nomor telepon tidak valid');
                }
            }

            if (!this.orderObj.people) {
                this.errorObj.peopleErr.push("Silahkan isi jumlah orang yang memesan meja ini");
            }
            else {
                if (parseInt(this.orderObj.people) > 100) {
                    this.errorObj.peopleErr.push("Tempat kami hanya menerima maksimal 100 orang");
                }

                if (parseInt(this.orderObj.people) < 1) {
                    this.errorObj.peopleErr.push("Minimal 1 orang dipilih!");
                }
            }

            if (!this.orderObj.tables) {
                this.errorObj.tablesErr.push("Silahkan pilih jumlah meja yang dipesan");
            }
            else {
                if (parseInt(this.orderObj.tables) > 50) {
                    this.errorObj.tablesErr.push("Tempat kami hanya menerima maksimal 50 meja");
                }

                if (parseInt(this.orderObj.tables) < 1) {
                    this.errorObj.tablesErr.push("Minimal 1 meja dipilih");
                }

                if (parseInt(this.orderObj.people) < parseInt(this.orderObj.tables)) {
                    this.errorObj.tablesErr.push("Jumlah meja tidak boleh lebih dari jumlah orang yang memesan");
                }
            }

            if (this.orderObj.card) {
                if (!/[0-9]{10}/.test(this.orderObj.card)) {
                    this.errorObj.cardErr.push('Kode referal hanya boleh mengandung angka');
                }

                if (this.orderObj.card.length != 10) {
                    this.errorObj.cardErr.push('Kode referal minimal 10 digit');
                }
            }

            if (!this.orderObj.when) {
                this.errorObj.whenErr.push("Silahkan pilih kapan anda dilayani");
            }
            else {
                let minRange = document.getElementById("oWhen").getAttribute("min");
                let maxRange = document.getElementById("oWhen").getAttribute("max");
                let dateMin = new Date(minRange);
                let dateMax = new Date(maxRange);
                let dateInput = new Date(this.orderObj.when);

                if (dateInput === "Invalid Date") {
                    this.errorObj.whenErr.push("Tanggal tidak valid");
                }

                if (dateInput.getTime() < dateMin.getTime() || dateInput.getTime() > dateMax.getTime()) {
                    this.errorObj.whenErr.push("Maksimal booking tidak lebih dari 2 buland dari sekarang");
                }

                if (dateInput.getHours() < 7 || dateInput.getHours() > 22) {
                    this.errorObj.whenErr.push("Eben's Taco hanya buka dari jam 07:00 hingga 22:00");
                }
            }


        },

        async handleSubmit(e) {
            this.checkForm();

            if (!this.checkEmptyErr()) {
                e.preventDefault();
            } else {
                e.preventDefault();

                let data = {
                    book_name: this.orderObj.name,
                    book_phone: parseInt(this.orderObj.phone),
                    book_people: parseInt(this.orderObj.people),
                    book_tables: parseInt(this.orderObj.tables),
                    user_id: parseInt(this.orderObj.card),
                    book_when: this.orderObj.when,
                    book_note: this.orderObj.note,
                }

                await axios.post("/booking", data);

                this.$refs.alert.showAlert('Berhasil', 'Terima kasih, Silahkan tunggu panggilan dari tim kami', 'Berhasil melakukan booking !')
                document.getElementById("bookTableForm").reset();
            }
        }
    },

    components: {
        VueBasicAlert
    }

}
</script>

<style scoped>
.order-section {
    padding: 2rem 9%;
}

.order-section .icons-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(40rem, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.order-section .icons-container .icons {
    border-radius: .5rem;
    padding: 2rem;
    text-align: center;
    background: #f7f7f7;
}

.order-section .icons-container .icons img {
    height: 10rem;
}

.order-section .icons-container .icons h3 {
    font-size: 2rem;
    color: #130f40;
    margin-top: .5rem;
}

.order-section form {
    background: #f7f7f7;
    padding: 2rem;
    border-radius: .5rem;
}

.order-section form .row {
    justify-content: space-between;
}

.order-section form .row .input-box {
    width: 49%;
    padding: 1.8rem 0;
}

.order-section form .row label {
    font-size: 1.7rem;
    color: #666;
}

.order-section form .row p {
    font-size: 1.5rem;
    position: absolute;
    color: rgb(243, 47, 47);
    margin: 0;
    padding-top: 5px;
}

.order-section form .row input,
.order-section form .row textarea {
    width: 100%;
    margin-top: .5rem;
    padding: 1rem 1.2rem;
    width: 100%;
    border-radius: .5rem;
    font-size: 1.6rem;
    text-transform: none;
    color: #130f40;
}

.order-section form .row textarea {
    height: 20rem;
    resize: none;
}

.order-section form .row .map {
    height: 100%;
    width: 100%;
    border-radius: .5rem;
}

@media (max-width: 768px) {
    .order form .row .input-box {
        width: 100%;
    }

    .order-section form .row {
        display: block;
        max-width: 100%;
        width: 100%;
        margin: 0;
    }

    .order-section form .row .input-box {
        width: 100%;
    }

}

@media (max-width: 576px) {
    .order-section .icons-container {
        grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
    }
}
</style>