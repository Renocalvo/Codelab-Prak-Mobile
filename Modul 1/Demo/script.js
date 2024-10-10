
// /* ----- FUNCTION BUTTON HIRE-ME ---- */
// function btnHireMe() {
//   document.getElementById('contact').scrollIntoView({ behavior: 'smooth' });
// }

// /* ----- FUNCTION BUTTON DOWNLOAD RESUME ----*/
// function downloadCV() {
//   // Membuat elemen anchor (<a>) sementara
//   var tempLink = document.createElement('a');
  
//   // Menetapkan atribut unduhan dan href
//   tempLink.setAttribute('href', '/assets/vendor/file/Contoh-resume.pdf'); // Gantilah dengan path yang sesuai
//   tempLink.setAttribute('download', 'Contoh-resume.pdf'); // Gantilah dengan nama file yang sesuai

//   // Menambahkan elemen ke dokumen
//   document.body.appendChild(tempLink);

//   // Mengklik elemen untuk memulai pengunduhan
//   tempLink.click();

//   // Menghapus elemen dari dokumen setelah pengunduhan selesai
//   document.body.removeChild(tempLink);
// }

/* ----- TYPING EFFECT ----- */
 var typingEffect = new Typed(".typedText",{
    strings : ["Programmer","Networker","Developer"],
    loop : true,
    typeSpeed : 100, 
    backSpeed : 80,
    backDelay : 2000
 })
