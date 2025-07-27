# 🌱 SCRIPT-DIRT-FARM

Script otomatis untuk membangun **Dirt Farm** Growtopia dengan sistem pintar dan efisien. Cocok untuk pengelolaan world farming skala besar dengan banyak bot.

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiUdLOdyVnQO1-YAv-P0NOY0ASTWHM-4wYlw&amp;s" class="sFlh5c FyHeAf" alt="How to make a Dirt Farm??? - Growtopia Forums" jsname="JuXqh" style="max-width: 1600px; position: absolute; visibility: hidden;" data-ilt="1753601546787">

---

## ✨ Fitur Utama

- ✍️ **Custom Nama World**
  - Buat nama world acak dengan huruf atau kombinasi huruf & angka.

- 🧱 **2 Desain Dirt Farm**
  - **Normal Design** – Pola klasik
  - **Rotation Design** – Cocok untuk world tertentu agar lebih optimal

- 🔄 **2 Mode Otomatis**
  - **Find & Lock Mode**: Cari world kosong lalu langsung dikunci.
  - **Build DF Mode**: Membangun desain Dirt Farm secara otomatis.

- 🌱 **Opsi Simpan Seed**
  - Simpan seed hasil break ke world terpisah (opsional).

- 💼 **Ambil Otomatis**
  - Ambil World Lock, Jammer, dan item penting lainnya dari storage world.

- 🪜 **Ambil Platform Otomatis**
  - Ambil platform dari plat world untuk digunakan saat build.

- 🤖 **Multi-Bot Support**
  - Banyak bot bisa bekerja di satu world saat proses pembangunan DF.

- 🔢 **Limit Bot**
  - Atur jumlah maksimum bot dalam satu world agar lebih efisien.

- 🛡️ **Anti-Banned Strategy**
  - Gunakan bot berbeda untuk membangun world yang sudah dikunci.

- 🔔 **Webhook Ringan & Custom**
  - Semua aktivitas bot dikirim ke webhook. Format lebih ringan dan efisien.
  - Bisa dikustomisasi sesuai keinginan.

- 📄 **Log Lengkap**
  - Setiap Dirt Farm yang dibuat tercatat di file TXT (`world_created_df.txt`).

- 🌱 **Tanam Otomatis Dirt**
  - Jika tidak ada Dirt, bot otomatis tanam Dirt Seed dulu.

- 🧠 **Deteksi Otomatis**
  - Cek apakah world:
    - Sudah datar atau belum
    - Sudah dikunci atau belum
    - Terdeteksi sebagai world nuked

- 🪨 **Break Rock Otomatis (Opsional)**
  - Bisa menghapus batuan pengganggu dalam proses build.

- 🏁 **Info Progress**
  - Notifikasi jika world sudah selesai dibuat
  - Menampilkan uptime bot

- 🌍 **Publikasi Otomatis**
  - Otomatis buka world ke publik dan pasang ulang lock jika perlu.

- 🗑️ **Trash Otomatis (Opsional)**
  - Item tidak penting bisa langsung dibuang.

- 🔐 **Lock Owner/License (Opsional)**
  - Fitur penguncian world menggunakan sistem license/owner bot.

- ⏱️ **Delay Bisa Diatur**
  - Semua delay dapat disesuaikan untuk menghindari flood atau banned.

---

## 👑 Lock Owner / License Mode

🔐 World dikunci oleh bot utama  
🧠 Bot lain hanya bertugas membangun untuk menghindari banned  
🤖 Cocok untuk farming berskala besar dan otomatis

> "Boss Mode ON – Dunia sudah dikunci, tinggal bangun dan panen! 💼🌱"

---

## 📦 Contoh Penggunaan

```lua
-- Mulai script dengan mode Find & Lock
scriptMode = "find_lock"

-- Atau dengan mode Build DF
scriptMode = "build_df"
