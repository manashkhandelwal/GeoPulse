# GeoPulse - Complete Setup Guide

This guide will help you set up and run the GeoPulse project on your local system. Follow the steps in order for a smooth installation process.

## 📋 Table of Contents

- [System Requirements](#system-requirements)
- [Quick Start](#quick-start)
- [Detailed Setup](#detailed-setup)
  - [Backend Setup](#backend-setup)
  - [Frontend Setup](#frontend-setup)
- [Running the Application](#running-the-application)
- [Environment Variables](#environment-variables)
- [Troubleshooting](#troubleshooting)

## 🖥️ System Requirements

Before you begin, ensure your system has the following installed:

### Required Software

1. **Python 3.11.9** (recommended version for compatibility)
   - Download from [python.org](https://www.python.org/downloads/)
   - Verify installation: `python --version` or `python3 --version`

2. **Node.js 18.x or higher** and **npm**
   - Download from [nodejs.org](https://nodejs.org/)
   - Verify installation: `node --version` and `npm --version`

3. **Git**
   - Download from [git-scm.com](https://git-scm.com/)
   - Verify installation: `git --version`

### External Services (Required)

You will need access to the following services:

1. **MongoDB** - Database for storing processed data
   - Option 1: [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) (Cloud, recommended)
   - Option 2: [Local MongoDB installation](https://www.mongodb.com/try/download/community)

2. **Neo4j** - Graph database for knowledge graph
   - Option 1: [Neo4j Aura](https://neo4j.com/cloud/aura/) (Cloud, recommended)
   - Option 2: [Local Neo4j installation](https://neo4j.com/download/)

3. **API Keys** - You'll need:
   - Google Custom Search API key
   - Search Engine ID

## 🚀 Quick Start

If you're familiar with the setup process, here's a quick reference:

```bash
# 1. Clone the repository
git clone https://github.com/group-geopulse/GeoPulse.git
cd GeoPulse

# 2. Backend Setup
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
# Create .env file with your credentials
cp .env.example .env  # Edit this file with your actual values

# 3. Frontend Setup
cd ../frontend
npm install

# 4. Run the application
# Terminal 1 - Backend (if needed)
cd backend
source venv/bin/activate
# Run backend scripts as needed

# Terminal 2 - Frontend
cd frontend
npm run dev
```

## 📖 Detailed Setup

### Backend Setup

#### Step 1: Navigate to Backend Directory

```bash
cd GeoPulse/backend
```

#### Step 2: Create a Virtual Environment

Creating a virtual environment isolates project dependencies:

**On Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

**On macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

You should see `(venv)` in your command prompt when the virtual environment is active.

#### Step 3: Install Python Dependencies

Install all required packages:

```bash
pip install -r requirements.txt
```

This will install:
- pandas, numpy - Data processing
- yfinance - Financial data
- spacy, nltk - Natural language processing
- pymongo - MongoDB driver
- neo4j - Neo4j graph database driver
- transformers, torch - Machine learning models
- beautifulsoup4, requests - Web scraping
- python-dotenv - Environment variable management
- And more...

#### Step 4: Verify PyTorch Installation

Check that PyTorch was installed correctly:

```bash
python -c "import torch; print(torch.__version__)"
```

#### Step 5: Set Up Environment Variables

Create a `.env` file in the `backend` directory:

```bash
# Create .env file (use the template below)
touch .env  # On Windows: type nul > .env
```

Add the following content to your `.env` file:

```env
# MongoDB connection string
MONGO_URI=your-mongodb-connection-string

# API key for external services (Google Custom Search)
API_KEY=your-google-api-key

# Search engine ID for Google Custom Search
SEARCH_ENGINE_ID=your-search-engine-id

# API request limit
API_REQUEST_LIMIT=100
```

**How to get these credentials:**

1. **MongoDB URI:**
   - For MongoDB Atlas: Go to your cluster → Connect → Connect your application
   - Format: `mongodb+srv://username:password@cluster.mongodb.net/database`
   - For local: `mongodb://localhost:27017/geopulse`

2. **Google API Key & Search Engine ID:**
   - Visit [Google Cloud Console](https://console.cloud.google.com/)
   - Enable "Custom Search API"
   - Create credentials (API key)
   - Set up a Custom Search Engine at [Programmable Search Engine](https://programmablesearchengine.google.com/)

### Frontend Setup

#### Step 1: Navigate to Frontend Directory

```bash
cd ../frontend  # From backend directory
# OR
cd GeoPulse/frontend  # From project root
```

#### Step 2: Install Node Dependencies

Install all required npm packages:

```bash
npm install
```

This will install:
- Next.js framework
- React and React DOM
- D3.js for visualizations
- Neo4j driver for database connectivity
- Tailwind CSS for styling
- And other dependencies

The installation may take a few minutes depending on your internet connection.

## 🎯 Running the Application

### Running the Frontend

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Start the development server:
```bash
npm run dev
```

3. Open your browser and visit:
```
http://localhost:3000
```

The development server supports hot-reload, so changes to the code will automatically refresh the page.

### Running Backend Scripts

The backend contains several utility scripts for data processing:

1. **Activate the virtual environment** (if not already active):
```bash
cd backend
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. **Run specific scripts** as needed:

```bash
# Upload price data
python upload_price.py

# Upload news data
python upload_news.py

# Upload opinions data
python upload_opinions.py

# Update knowledge graph
python kg_updating.py

# Process news
python news_processing.py
```

Check the log files (`*.log`) in the backend directory for detailed execution information.

## 🔧 Environment Variables

### Backend Environment Variables (`.env`)

| Variable | Description | Example |
|----------|-------------|---------|
| `MONGO_URI` | MongoDB connection string | `mongodb+srv://user:pass@cluster.mongodb.net/db` |
| `API_KEY` | Google Custom Search API key | `AIza...` |
| `SEARCH_ENGINE_ID` | Custom Search Engine ID | `abc123...` |
| `API_REQUEST_LIMIT` | Max API requests | `100` |

### Frontend Environment Variables (if needed)

The frontend may require additional environment variables. Create a `.env.local` file in the `frontend` directory if needed:

```env
# Example - adjust based on your backend API
NEXT_PUBLIC_API_URL=http://localhost:5000
NEXT_PUBLIC_NEO4J_URI=bolt://localhost:7687
```

## ✅ Verify Your Setup

After completing the setup, run the verification script to ensure everything is configured correctly:

```bash
python verify_setup.py
```

This script will check:
- Python version and all required packages
- Node.js and npm installation
- Frontend dependencies (node_modules)
- Environment configuration (.env file)
- Virtual environment status

If all checks pass, you're ready to run the application!

## 🐛 Troubleshooting

### Common Issues and Solutions

#### Python Virtual Environment Issues

**Problem:** `venv\Scripts\activate` command not found (Windows)
**Solution:** Try using `venv\Scripts\activate.bat` or `venv\Scripts\Activate.ps1` (PowerShell)

**Problem:** Permission denied when activating virtual environment
**Solution:** On Windows PowerShell, run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

#### Python Package Installation Issues

**Problem:** `pip install` fails for certain packages
**Solution:**
1. Ensure you're using Python 3.11.9: `python --version`
2. Update pip: `pip install --upgrade pip`
3. On Windows, you may need Microsoft C++ Build Tools for some packages

**Problem:** PyTorch installation is slow
**Solution:** The requirements.txt uses CPU-only PyTorch for faster installation. This is intentional.

**Problem:** spaCy model download fails
**Solution:** Manually install: `python -m spacy download en_core_web_lg`

#### MongoDB Connection Issues

**Problem:** Cannot connect to MongoDB
**Solution:**
1. Verify your `MONGO_URI` in `.env`
2. Check if your IP is whitelisted in MongoDB Atlas
3. Ensure network connectivity
4. For local MongoDB, verify the service is running

**Problem:** Authentication failed
**Solution:** Double-check username and password in the connection string. Ensure special characters are URL-encoded.

#### Frontend Issues

**Problem:** `npm install` fails
**Solution:**
1. Delete `node_modules` and `package-lock.json`
2. Run `npm cache clean --force`
3. Run `npm install` again

**Problem:** Port 3000 already in use
**Solution:** 
- Kill the process using port 3000, or
- Use a different port: `npm run dev -- -p 3001`

**Problem:** Module not found errors
**Solution:** Ensure all dependencies are installed: `npm install`

#### Environment Variable Issues

**Problem:** Application can't read environment variables
**Solution:**
1. Ensure `.env` file is in the correct directory (backend folder)
2. Verify the file is named exactly `.env` (not `.env.txt`)
3. Restart the application after changing `.env`
4. Don't use quotes around values in `.env` unless necessary

### Checking Logs

Backend scripts generate log files:
- `upload_price.log` - Price data upload logs
- `upload_news.log` - News data upload logs
- `upload_opinions.log` - Opinion data upload logs

Check these files for detailed error messages if something goes wrong.

### Getting Help

If you encounter issues not covered here:

1. Check the [Issues](https://github.com/group-geopulse/GeoPulse/issues) page on GitHub
2. Review the backend README: `backend/README.MD`
3. Review the frontend README: `frontend/README.md`
4. Create a new issue with:
   - Your operating system
   - Python and Node.js versions
   - Error message or screenshot
   - Steps to reproduce the problem

## 📚 Additional Resources

- [Project Demo Video](https://youtu.be/Fa4aPGJKzLA)
- [Python Virtual Environments](https://docs.python.org/3/tutorial/venv.html)
- [Next.js Documentation](https://nextjs.org/docs)
- [MongoDB Atlas Setup](https://docs.atlas.mongodb.com/getting-started/)
- [Neo4j Documentation](https://neo4j.com/docs/)

## ✅ Verification Checklist

Use this checklist to verify your setup is complete:

- [ ] Python 3.11.9 is installed and accessible
- [ ] Node.js 18+ and npm are installed
- [ ] Repository is cloned successfully
- [ ] Backend virtual environment is created and activated
- [ ] All Python dependencies are installed without errors
- [ ] `.env` file is created in backend directory with all required variables
- [ ] MongoDB connection is configured and accessible
- [ ] Frontend dependencies are installed (`node_modules` exists)
- [ ] Frontend dev server starts without errors (`npm run dev`)
- [ ] Can access the application at http://localhost:3000

---

**Happy coding! 🚀** If you found this guide helpful, please star the repository!
