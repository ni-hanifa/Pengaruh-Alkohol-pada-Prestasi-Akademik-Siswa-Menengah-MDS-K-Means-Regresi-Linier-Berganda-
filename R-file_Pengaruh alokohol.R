#-- Project Metkuan Mandiri--#

#01: Install dan load semua package yang dibutuhkan
library(ggpubr)
library(magrittr)
library(dplyr)
library(tidyverse)
library(MASS)
library(factoextra)
library(ggfortify)

#02: Load dataset student-mat.csv dari lokal
data <- read.csv("C:\\Users\\Axioo Pongo\\OneDrive\\Dokumen\\ilkom\\smt 4\\metkuan\\projects\\student-mat.csv", sep = ",")

#03: Lihat struktur awal data
str(data)
head(data)
data


#04: Ambil subset kolom yang relevan untuk penelitian (numerik & berkaitan)
selected_data <- dplyr::select(data, Dalc, Walc, G1, G2, G3, studytime, absences)

names(data)

#05: Hapus NA (jika ada)
selected_data <- na.omit(selected_data)

#06: Standarisasi data numerik agar setara dalam MDS
selected_scaled <- scale(selected_data)

#07: Hitung MDS (Multidimensional Scaling)
mds_matrix <- cmdscale(dist(selected_scaled))
colnames(mds_matrix) <- c("Dim.1", "Dim.2")
mds_result <- as_tibble(mds_matrix)


#08: Visualisasi MDS awal (tanpa klaster)
ggscatter(mds_result, x = "Dim.1", y = "Dim.2",
          size = 2, repel = TRUE, title = "Visualisasi MDS siswa")

#09: Tentukan jumlah klaster optimal (elbow method)
fviz_nbclust(selected_scaled, kmeans, method = "wss") + 
  theme_minimal() + 
  ggtitle("Elbow Method untuk Menentukan K")

#10: Clustering dengan K-means (contoh: K = 3)
kmeans_result <- kmeans(mds_result, centers = 3)
mds_result$cluster <- as.factor(kmeans_result$cluster)

#11: Tambahkan cluster ke data asli untuk analisis lanjutan
clustered_data <- bind_cols(selected_data, cluster = mds_result$cluster)

#12: Visualisasi hasil klasterisasi MDS + K-Means
ggscatter(mds_result, x = "Dim.1", y = "Dim.2",
          color = "cluster", 
          palette = c("#A6CEE3", "#FDBFD7", "#D9D9D9"), # warna pastel
          size = 2,
          ellipse = TRUE, ellipse.type = "convex", repel = TRUE,
          title = "Hasil Klasterisasi MDS + K-Means (K=3)")


#13: Analisis deskriptif rata-rata nilai G3 per klaster
clustered_data %>%
  group_by(cluster) %>%
  summarise(mean_G3 = mean(G3), mean_Dalc = mean(Dalc), mean_Walc = mean(Walc))

#14: REGRESI LINIER BERGANDA
# Model regresi: pengaruh Dalc dan Walc terhadap G3 (plus variabel kontrol)
reg_model <- lm(G3 ~ Dalc + Walc + G1 + G2 + studytime + absences, data = selected_data)

#15: Tampilkan hasil regresi
summary(reg_model)

#16: Plot diagnostik regresi
autoplot(reg_model, which = 1:4, ncol = 2)