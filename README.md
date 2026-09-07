# Pengaruh Alkohol pada Prestasi Akademik Siswa Menengah (MDS, K-Means, Regresi Linier Berganda)

Repositori ini berisi kode dan laporan penelitian terkait analisis faktor gaya hidup—khususnya konsumsi alkohol—terhadap capaian akademik siswa sekolah menengah. Analisis dilakukan menggunakan bahasa pemrograman R dengan pendekatan statistika inferensial dan *machine learning* (reduksi dimensi, klasterisasi, dan regresi).

## Latar Belakang
Konsumsi alkohol di kalangan remaja sering kali dikaitkan dengan defisit kognitif dan penurunan motivasi belajar. Proyek ini mengeksplorasi secara kuantitatif hubungan antara intensitas minum alkohol pada hari sekolah (`Dalc`) dan akhir pekan (`Walc`) terhadap nilai akademik siswa (`G1`, `G2`, `G3`). 

## Dataset
Data yang digunakan bersumber dari **Student Performance Dataset** (Cortez & Silva, 2008) yang mencakup latar belakang sosial ekonomi, kebiasaan belajar, tingkat kehadiran, dan konsumsi alkohol siswa di Portugal.

## Metodologi
1. **Prapemrosesan Data**: Penanganan *missing values* dan standardisasi data numerik untuk menyamakan skala sebelum reduksi dimensi.
2. **Multidimensional Scaling (MDS)**: Mereduksi dimensi data untuk memvisualisasikan kemiripan profil antar siswa ke dalam koordinat 2D.
3. **K-Means Clustering**: Mengelompokkan observasi siswa. Jumlah klaster optimal (K=3) ditentukan menggunakan *Elbow Method*.
4. **Regresi Linier Berganda**: Membangun model prediksi untuk nilai akhir (`G3`) dengan mengontrol variabel seperti nilai awal (`G1`), nilai tengah semester (`G2`), waktu belajar (`studytime`), dan ketidakhadiran (`absences`).

## Temuan Utama
* **Analisis Klaster**: Terbentuk 3 kelompok utama. Klaster dengan nilai rata-rata tertinggi (Klaster 3: G3=14.0) memiliki tingkat konsumsi alkohol terendah. Klaster dengan tingkat konsumsi alkohol tertinggi (Klaster 2) berada pada tingkat capaian akademik menengah.
* **Analisis Regresi**: Model regresi memiliki R-squared sebesar 82.76%. Nilai akademik sebelumnya (`G1` dan `G2`) menjadi prediktor paling dominan dan signifikan terhadap nilai akhir, sementara variabel konsumsi alkohol tidak menunjukkan hubungan linier yang signifikan ketika variabel lain dikontrol.
* **Diagnostik Model**: Evaluasi asumsi regresi (melalui plot *Residuals vs Fitted* dan *Scale-Location*) menunjukkan adanya indikasi heteroskedastisitas, yang menyarankan potensi eksplorasi model non-linier di masa depan.

## Persyaratan Sistem & Library (R)
Proyek ini membutuhkan R dan beberapa *package* berikut:
* `tidyverse`, `dplyr`, `magrittr` (Manipulasi data)
* `MASS`, `factoextra` (MDS, K-Means, dan evaluasi klaster)
* `ggpubr`, `ggfortify` (Visualisasi data dan plot diagnostik regresi)

## Cara Penggunaan
1. Lakukan *clone* pada repositori ini.
2. Pastikan file `student-mat.csv` berada di direktori yang sama dengan *script* R.
3. Jalankan file `project metkuan mandiri.R`.
