# Pengaruh Alkohol pada Prestasi Akademik Siswa Menengah (MDS, K-Means, Regresi Linier Berganda)

Repositori ini berisi kode dan laporan penelitian mengenai hubungan konsumsi alkohol dengan prestasi akademik siswa sekolah menengah. Analisis dilakukan menggunakan R dengan pendekatan Multidimensional Scaling (MDS), K-Means Clustering, dan regresi linier berganda.

## Latar Belakang
Konsumsi alkohol pada remaja dapat berkaitan dengan proses belajar dan capaian akademik. Penelitian ini menganalisis hubungan antara konsumsi alkohol pada hari sekolah (`Dalc`) dan akhir pekan (`Walc`) dengan nilai akademik siswa (`G1`, `G2`, `G3`).

## Dataset
Data yang digunakan berasal dari **Student Performance Dataset** (Cortez & Silva, 2008). Dataset mencakup informasi mengenai latar belakang siswa, kebiasaan belajar, kehadiran, serta konsumsi alkohol siswa sekolah menengah di Portugal.

## Metodologi
1. **Prapemrosesan Data**: Menangani *missing values* dan melakukan standardisasi data numerik sebelum analisis.
2. **Multidimensional Scaling (MDS)**: Memetakan kemiripan profil siswa ke dalam koordinat 2D untuk melihat pola antar observasi.
3. **K-Means Clustering**: Mengelompokkan siswa berdasarkan karakteristik yang dianalisis. Jumlah klaster optimal (K=3) ditentukan menggunakan *Elbow Method*.
4. **Regresi Linier Berganda**: Menganalisis faktor yang berhubungan dengan nilai akhir (`G3`) dengan mempertimbangkan nilai awal (`G1`), nilai tengah (`G2`), waktu belajar (`studytime`), dan ketidakhadiran (`absences`).

## Temuan Utama
* **Analisis Klaster:** Terbentuk 3 kelompok siswa. Klaster dengan rata-rata nilai tertinggi (Klaster 3: G3=14.0) memiliki tingkat konsumsi alkohol terendah. Klaster dengan konsumsi alkohol tertinggi (Klaster 2) memiliki capaian akademik pada tingkat menengah.
* **Analisis Regresi:** Model menghasilkan R-squared sebesar 82.76%. Nilai sebelumnya (`G1` dan `G2`) menjadi prediktor yang paling dominan dan signifikan terhadap nilai akhir. Setelah variabel lain dikontrol, konsumsi alkohol tidak menunjukkan hubungan linier yang signifikan dengan `G3`.
* **Diagnostik Model:** Plot *Residuals vs Fitted* dan *Scale-Location* menunjukkan indikasi heteroskedastisitas. Hal ini menunjukkan bahwa model non-linier dapat menjadi salah satu pendekatan yang dapat dieksplorasi pada analisis berikutnya.

## Persyaratan Sistem & Library (R)
Proyek ini membutuhkan R dan beberapa *package* berikut:
* `tidyverse`, `dplyr`, `magrittr` untuk manipulasi data
* `MASS`, `factoextra` untuk MDS, K-Means, dan evaluasi klaster
* `ggpubr`, `ggfortify` untuk visualisasi dan diagnostik regresi

## Cara Penggunaan
1. Lakukan *clone* repositori ini.
2. Pastikan file `student-mat.csv` berada di direktori yang sama dengan *script* R.
3. Jalankan file `project metkuan mandiri.R`.
