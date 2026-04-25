# PDF Converter by TechSaby

A pixel-perfect file-to-PDF converter powered by **LibreOffice headless**.  
Your DOCX, XLSX, PPTX, images and more come out as PDFs that look *exactly* like the originals.

---

## Why LibreOffice?

Browser-only converters (Mammoth.js, html2canvas, etc.) re-interpret your document structure,
causing fonts, layouts, columns, and spacing to break.

LibreOffice uses the same rendering engine as Microsoft Word/Excel, so the PDF is
**visually identical** to your original file.

---

## Supported Formats

| Category     | Extensions                              |
|--------------|-----------------------------------------|
| Documents    | .docx .doc .odt .rtf                   |
| Spreadsheets | .xlsx .xls .ods .csv                   |
| Presentations| .pptx .ppt .odp                        |
| Text/Web     | .txt .html .htm                        |
| Images       | .png .jpg .jpeg .gif .bmp .webp .svg .tiff |
| Already PDF  | .pdf (returned as-is)                  |

---

## Quick Start (Local)

```bash
# 1. Install LibreOffice
sudo apt install libreoffice          # Ubuntu/Debian
brew install --cask libreoffice       # macOS

# 2. Install Python deps
pip install flask flask-cors gunicorn

# 3. Run
python app.py
# → Open http://localhost:8000
```

---

## Deploy with Docker (Recommended)

The `Dockerfile` installs LibreOffice automatically.

```bash
# Build and run
docker compose up --build

# → App running at http://localhost:8000
```

---

## Deploy to Render.com (Free Tier)

1. Push this folder to a GitHub repo
2. Go to [render.com](https://render.com) → **New Web Service**
3. Connect your GitHub repo
4. Choose **Docker** as environment
5. Click **Deploy** — done ✅

Render will use the `render.yaml` config automatically.

---

## Deploy to Fly.io

```bash
# Install flyctl: https://fly.io/docs/hands-on/install-flyctl/
fly auth login
fly launch          # detects fly.toml automatically
fly deploy
```

---

## Deploy to Railway

1. Go to [railway.app](https://railway.app) → **New Project** → **Deploy from GitHub**
2. Connect your repo
3. Railway auto-detects the Dockerfile and deploys ✅

---

## Deploy to DigitalOcean / Any Linux VPS

```bash
# On your server (Ubuntu):
sudo apt update
sudo apt install -y libreoffice python3 python3-pip

git clone <your-repo>
cd pdf-converter-deploy
pip install -r requirements.txt

# Run in production with gunicorn
gunicorn --bind 0.0.0.0:8000 --workers 2 --timeout 120 app:app

# (Optional) Set up nginx reverse proxy + SSL with certbot
sudo apt install nginx certbot python3-certbot-nginx
```

---

## Environment Variables

| Variable | Default | Description           |
|----------|---------|-----------------------|
| `PORT`   | `8000`  | Port to listen on     |
| `DEBUG`  | `false` | Enable Flask debug mode |

---

## Project Structure

```
pdf-converter-deploy/
├── app.py              ← Flask backend (LibreOffice conversion)
├── templates/
│   └── index.html      ← Frontend UI
├── requirements.txt    ← Python dependencies
├── Dockerfile          ← Container build (includes LibreOffice)
├── docker-compose.yml  ← Easy local Docker run
├── render.yaml         ← Render.com config
├── fly.toml            ← Fly.io config
└── README.md           ← This file
```

---

Made by **Sabyasachi Bhattacharjee** · TechSaby
