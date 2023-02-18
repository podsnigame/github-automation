import sys
import pytesseract
from PIL import Image

if len(sys.argv) < 2:
    print("Penggunaan: python3 image_to_txt_ocr.py <nama_file_gambar>")
    sys.exit()

image_file_name = sys.argv[1]

# Cek ekstensi file gambar
if not image_file_name.endswith((".jpg", ".jpeg", ".png")):
    print("Masukkan file gambar yang valid (jpg, jpeg, png).")
    sys.exit()

# Membuka file gambar
image = Image.open(image_file_name)

# Ekstrak teks dari gambar menggunakan OCR
text = pytesseract.image_to_string(image)

# Membuat nama file teks dengan mengganti ekstensi .jpg/.jpeg/.png dengan .txt
txt_file_name = image_file_name.replace(
    (".jpg", ".jpeg", ".png"), ".txt")

# Menulis teks ke file teks
text_file = open(txt_file_name, "w")
text_file.write(text)
text_file.close()

print("File gambar '%s' berhasil dikonversi ke teks '%s' dengan OCR." %
      (image_file_name, txt_file_name))
