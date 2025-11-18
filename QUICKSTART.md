# 🚀 GeoPulse Quick Start Guide

Get GeoPulse up and running on your system in minutes!

## Prerequisites Check

Before you start, verify you have these installed:

```bash
python3 --version  # Should be 3.11.9 or higher
node --version     # Should be 18.x or higher
npm --version      # Should be installed with Node.js
git --version      # To clone the repository
```

If any of these are missing, install them first:
- **Python**: https://www.python.org/downloads/
- **Node.js**: https://nodejs.org/
- **Git**: https://git-scm.com/

## Automated Setup (Recommended)

### On Linux/macOS:

```bash
# 1. Clone the repository
git clone https://github.com/group-geopulse/GeoPulse.git
cd GeoPulse

# 2. Run the setup script
./setup.sh
```

### On Windows:

```batch
REM 1. Clone the repository
git clone https://github.com/group-geopulse/GeoPulse.git
cd GeoPulse

REM 2. Run the setup script
setup.bat
```

The script will:
- ✅ Check your Python and Node.js installations
- ✅ Create a Python virtual environment
- ✅ Install all backend dependencies
- ✅ Install all frontend dependencies
- ✅ Create a template .env file

## Manual Setup

If you prefer to set up manually or the script doesn't work:

### Step 1: Clone Repository
```bash
git clone https://github.com/group-geopulse/GeoPulse.git
cd GeoPulse
```

### Step 2: Backend Setup
```bash
cd backend

# Create and activate virtual environment
python3 -m venv venv

# On Linux/macOS:
source venv/bin/activate

# On Windows:
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create environment file
cp .env.example .env
# Edit .env with your credentials
```

### Step 3: Frontend Setup
```bash
cd ../frontend
npm install
```

## Configure Environment Variables

Edit `backend/.env` with your credentials:

```env
MONGO_URI=your-mongodb-connection-string
API_KEY=your-google-api-key
SEARCH_ENGINE_ID=your-search-engine-id
API_REQUEST_LIMIT=100
```

### Getting Credentials:

1. **MongoDB URI**: 
   - Cloud: [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) (Free tier available)
   - Local: `mongodb://localhost:27017/geopulse`

2. **Google API Credentials**:
   - Get API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Enable "Custom Search API"
   - Create Search Engine at [Programmable Search](https://programmablesearchengine.google.com/)

## Run the Application

### Start Frontend (Required)

```bash
cd frontend
npm run dev
```

Open your browser to **http://localhost:3000**

### Run Backend Scripts (As Needed)

In a separate terminal:

```bash
cd backend
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Run specific scripts
python upload_price.py
python upload_news.py
python upload_opinions.py
```

## Verification

### Automated Verification

Run the verification script to check your setup:

```bash
python verify_setup.py
```

This will check:
- Python version and packages
- Node.js and npm installation
- Frontend dependencies
- Environment configuration
- Virtual environment status

✅ **Success indicators:**
- All verification checks pass
- No error messages during installation
- Frontend dev server starts successfully
- Can access http://localhost:3000
- Page loads without errors

❌ **If you see errors:**
1. Check the [Troubleshooting](#troubleshooting) section below
2. Review the detailed [SETUP.md](SETUP.md) guide
3. Check log files in `backend/*.log`

## Troubleshooting

### Python Virtual Environment Won't Activate (Windows)

**Problem**: PowerShell blocks script execution

**Solution**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Port 3000 Already in Use

**Solution**: Use a different port
```bash
npm run dev -- -p 3001
```

### MongoDB Connection Error

**Solutions**:
1. Verify your `MONGO_URI` in `.env`
2. Check MongoDB Atlas IP whitelist (add `0.0.0.0/0` for testing)
3. Ensure credentials are correct

### npm Install Fails

**Solution**:
```bash
# Clear cache and retry
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### PyTorch Installation is Slow

This is normal - PyTorch is a large package. The installation uses CPU-only version for faster setup.

## Next Steps

Once the application is running:

1. 📺 **Watch the demo**: [Project Demo Video](https://youtu.be/Fa4aPGJKzLA)
2. 📖 **Read detailed docs**: [SETUP.md](SETUP.md) for comprehensive information
3. 🧪 **Explore the features**: Try uploading data and viewing visualizations
4. 🛠️ **Review the code**: Check `backend/` and `frontend/` directories

## Need Help?

- 📋 **Detailed Setup**: See [SETUP.md](SETUP.md)
- 🐛 **Issues**: Report at [GitHub Issues](https://github.com/group-geopulse/GeoPulse/issues)
- 📧 **Contact**: See README.md for team contact information

---

**Happy exploring! 🎉**
