# Yang perlu di install
# pip install pdfminer

import sys
import io
from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage


def pdf_to_text(pdf_file):
    # Buka file PDF
    with open(pdf_file, "rb") as file:
        resource_manager = PDFResourceManager()
        text_io = io.StringIO()
        pdf_interpreter = PDFPageInterpreter(resource_manager, TextConverter(
            resource_manager, text_io, laparams=LAParams()))

        # Ambil teks dari setiap halaman
        for page in PDFPage.get_pages(file, caching=True, check_extractable=True):
            pdf_interpreter.process_page(page)

        # Ambil teks dari buffer dan tutup file
        text = text_io.getvalue()
        text_io.close()
        file.close()

        return text


if __name__ == '__main__':
    # Baca nama file PDF dari argumen komando
    pdf_file = sys.argv[1]

    # Konversi PDF ke teks
    text = pdf_to_text(pdf_file)

    # Tulis teks ke file teks
    text_file = pdf_file.replace(".pdf", ".txt")
    with open(text_file, "w") as file:
        file.write(text)
