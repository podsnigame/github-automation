import sys
import pytesseract
from pdf2image import convert_from_path

if len(sys.argv) < 2:
    print("Penggunaan: python3 pdf_to_txt_ocr.py <nama_file_pdf>")
    sys.exit()

pdf_file_name = sys.argv[1]
if not pdf_file_name.endswith(".pdf"):
    print("Masukkan file PDF yang valid.")
    sys.exit()

# Konversi file PDF menjadi gambar
pages = convert_from_path(pdf_file_name)

# Inisialisasi string teks
text = ""

# Loop melalui gambar hasil konversi
for page in pages:
    # Ekstrak teks dari gambar dengan OCR
    text += pytesseract.image_to_string(page)

# Membuat nama file teks dengan mengganti ekstensi .pdf dengan .txt
txt_file_name = pdf_file_name.replace(".pdf", ".txt")

# Menulis teks ke file teks
text_file = open(txt_file_name, "w")
text_file.write(text)
text_file.close()

print("File PDF '%s' berhasil dikonversi ke teks '%s' dengan OCR." %
      (pdf_file_name, txt_file_name))
