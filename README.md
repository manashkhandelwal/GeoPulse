<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/group-geopulse/GeoPulse">
    <img src="images/logo1.png" alt="Logo" width="120" height="120">
  </a>

<h3 align="center">GeoPulse</h3>
  
  <p align="center">
    An AI-powered system to analyze the impact of geopolitical events on crude oil pricing.
    <br />
    <a href="https://github.com/group-geopulse/GeoPulse"><strong>Explore the repo»</strong></a>
    <br />
    <br />
    <a href="QUICKSTART.md"><strong>🚀 Quick Start Guide</strong></a>
    ·
    <a href="SETUP.md"><strong>📖 Complete Setup Guide</strong></a>
    <br />
    <a href="https://youtu.be/Fa4aPGJKzLA">View Demo</a>
    ·
    <a href="https://github.com/group-geopulse/GeoPulse/issues">Report Bug</a>
    ·
    <a href="https://github.com/group-geopulse/GeoPulse/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Issues</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details><br>



<!-- ABOUT THE PROJECT -->
## About The Project

GeoPulse is an AI-powered system designed to analyze the relationship between geopolitical events and crude oil pricing. By integrating financial data, news sentiment analysis, and knowledge graph-based insights, the platform helps users understand how global events influence market trends. 

It use natural language processing and retrieval-augmented generation (RAG) to process news articles, assess sentiment, and provide data-driven insights through an interactive interface. 

GeoPulse is built for policymakers, analysts, and researchers seeking a clearer understanding of market volatility driven by geopolitical factors.

### Built With

[![tools](https://skillicons.dev/icons?i=py,nextjs,tailwind,mongodb,react)](https://skillicons.dev)
![neo4j](https://skills-icons.vercel.app/api/icons?i=neo4j)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running, follow these steps:

### Prerequisites

Before you begin, ensure you have the following installed:
- **Python 3.11.9** - [Download here](https://www.python.org/downloads/)
- **Node.js 18+** and **npm** - [Download here](https://nodejs.org/)
- **Git** - [Download here](https://git-scm.com/)

You'll also need access to:
- **MongoDB** (Atlas or local installation)
- **Neo4j** (Aura or local installation)
- **Google Custom Search API** credentials

### Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/group-geopulse/GeoPulse.git
cd GeoPulse

# 2. Backend Setup
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env  # Edit with your credentials

# 3. Frontend Setup
cd ../frontend
npm install

# 4. Run the application
npm run dev
# Open http://localhost:3000 in your browser

# 5. Verify setup (optional but recommended)
cd ..
python verify_setup.py
```

### Complete Setup Guide

**📖 For detailed setup instructions, troubleshooting, and configuration, see [SETUP.md](SETUP.md)**

This comprehensive guide includes:
- Detailed prerequisites and system requirements
- Step-by-step installation instructions
- Environment variable configuration
- Running backend scripts
- Common issues and troubleshooting
- Verification checklist

Alternatively, follow the dedicated READMEs:
- [Backend Setup](backend/README.MD) - Python backend configuration
- [Frontend Setup](frontend/README.md) - Next.js frontend configuration

### Setup Tools Available

To make setup easier, we provide several tools:

| Tool | Description | Usage |
|------|-------------|-------|
| `setup.sh` | Automated setup script for Linux/macOS | `./setup.sh` |
| `setup.bat` | Automated setup script for Windows | `setup.bat` |
| `verify_setup.py` | Verify your installation is complete | `python verify_setup.py` |
| `backend/.env.example` | Template for environment variables | Copy to `.env` and edit |

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ISSUES -->
## Issues

See the [open issues](https://github.com/group-geopulse/GeoPulse/issues) for a full list of known issues,  priorities and assignees.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CREATED BY -->
## Created by

### Group 8

* Dania Mohamed - [@daniamohamed](https://github.com/daniamohamed) - sc20dm@leeds.ac.uk
* Ruhma Fatima - [@sc20rf](https://github.com/sc20rf) - sc20rf@leeds.ac.uk
* Yashvi Shah - [@yashvishah16](https://github.com/yashvishah16) - sc20yjs@leeds.ac.uk
* Vindhyaa Saravanan - [@Vindhyaa-Saravanan](https://github.com/Vindhyaa-Saravanan) - sc21vs@leeds.ac.uk
* Deep Waghulde - [@deepw02](https://github.com/deepw02) - sc20dpw@leeds.ac.uk
* Swayam Arora - [@swayamaror](https://github.com/swayamaror) - sc21sa@leeds.ac.uk


### Project Links:

* [Project Repository](https://github.com/group-geopulse/GeoPulse)
* [Project Demo Video](https://youtu.be/Fa4aPGJKzLA)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
