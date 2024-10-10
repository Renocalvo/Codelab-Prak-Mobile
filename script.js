function penjumlahan() {
    var num1 = parseInt(document.getElementById('bil-pertama').value);
    var num2 = parseInt(document.getElementById('bil-kedua').value);
console.log('Bil 1: ', num1);
console.log('Bil 2: ', num2);
    var sum = num1 + num2
    console.log('jum: ', sum);
    document.getElementById('result').textContent = "Hasil : "+sum;

}



function submitform() {
    // Mendapatkan nilai dari input form
    var username = document.getElementById('name').value;
    var email = document.getElementById('form-email').value;
    var address = document.getElementById('address').value;

    // Validasi sederhana (cek jika input kosong)
    if (username === "" || email === "" || address === "") {
        // Jika ada field kosong, tampilkan alert bawaan browser
        alert("Semua field harus diisi!");
        return false;
    }

    // Jika semua field terisi, tampilkan pesan sukses
    alert("Pendaftaran berhasil!");
    return true;
}