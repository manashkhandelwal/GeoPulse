#!/usr/bin/env python3
"""
GeoPulse Installation Verification Script

This script checks if all required components are properly installed
and configured for running the GeoPulse project.
"""

import sys
import os
import subprocess
from pathlib import Path

# Color codes for terminal output
GREEN = '\033[92m'
RED = '\033[91m'
YELLOW = '\033[93m'
BLUE = '\033[94m'
RESET = '\033[0m'

def print_header(text):
    """Print section header"""
    print(f"\n{BLUE}{'='*60}{RESET}")
    print(f"{BLUE}{text.center(60)}{RESET}")
    print(f"{BLUE}{'='*60}{RESET}\n")

def print_success(text):
    """Print success message"""
    print(f"{GREEN}✓ {text}{RESET}")

def print_error(text):
    """Print error message"""
    print(f"{RED}✗ {text}{RESET}")

def print_warning(text):
    """Print warning message"""
    print(f"{YELLOW}⚠ {text}{RESET}")

def print_info(text):
    """Print info message"""
    print(f"{BLUE}ℹ {text}{RESET}")

def check_python_version():
    """Check Python version"""
    print_info("Checking Python version...")
    version = sys.version_info
    version_str = f"{version.major}.{version.minor}.{version.micro}"
    
    if version.major == 3 and version.minor >= 11:
        print_success(f"Python {version_str} (>= 3.11 required)")
        return True
    else:
        print_warning(f"Python {version_str} (3.11.9 recommended, but may work)")
        return True

def check_module(module_name, package_name=None):
    """Check if a Python module is installed"""
    if package_name is None:
        package_name = module_name
    
    try:
        __import__(module_name)
        print_success(f"{package_name} installed")
        return True
    except ImportError:
        print_error(f"{package_name} not installed")
        return False

def check_python_packages():
    """Check if required Python packages are installed"""
    print_info("Checking Python packages...")
    
    packages = {
        'pandas': 'pandas',
        'yfinance': 'yfinance',
        'numpy': 'numpy',
        'spacy': 'spacy',
        'gdeltdoc': 'gdeltdoc',
        'pymongo': 'pymongo',
        'transformers': 'transformers',
        'requests': 'requests',
        'dotenv': 'python-dotenv',
        'neo4j': 'neo4j',
        'torch': 'torch (PyTorch)',
        'nltk': 'nltk',
        'bs4': 'beautifulsoup4'
    }
    
    all_installed = True
    for module, package in packages.items():
        if not check_module(module, package):
            all_installed = False
    
    # Check spaCy model
    try:
        import spacy
        nlp = spacy.load('en_core_web_lg')
        print_success("spaCy en_core_web_lg model installed")
    except:
        print_error("spaCy en_core_web_lg model not installed")
        print_info("Install with: python -m spacy download en_core_web_lg")
        all_installed = False
    
    return all_installed

def check_node_npm():
    """Check if Node.js and npm are installed"""
    print_info("Checking Node.js and npm...")
    
    try:
        node_version = subprocess.check_output(['node', '--version'], 
                                               stderr=subprocess.DEVNULL).decode().strip()
        print_success(f"Node.js {node_version} installed")
    except (subprocess.CalledProcessError, FileNotFoundError):
        print_error("Node.js not installed")
        return False
    
    try:
        npm_version = subprocess.check_output(['npm', '--version'], 
                                              stderr=subprocess.DEVNULL).decode().strip()
        print_success(f"npm {npm_version} installed")
    except (subprocess.CalledProcessError, FileNotFoundError):
        print_error("npm not installed")
        return False
    
    return True

def check_frontend_dependencies():
    """Check if frontend dependencies are installed"""
    print_info("Checking frontend dependencies...")
    
    frontend_dir = Path(__file__).parent / 'frontend'
    node_modules = frontend_dir / 'node_modules'
    
    if node_modules.exists() and node_modules.is_dir():
        print_success("Frontend node_modules directory exists")
        return True
    else:
        print_error("Frontend dependencies not installed")
        print_info("Run: cd frontend && npm install")
        return False

def check_env_file():
    """Check if .env file exists in backend"""
    print_info("Checking environment configuration...")
    
    backend_dir = Path(__file__).parent / 'backend'
    env_file = backend_dir / '.env'
    env_example = backend_dir / '.env.example'
    
    if env_file.exists():
        print_success("Backend .env file exists")
        
        # Check if it has required variables
        with open(env_file, 'r') as f:
            content = f.read()
            required_vars = ['MONGO_URI', 'API_KEY', 'SEARCH_ENGINE_ID']
            missing_vars = []
            
            for var in required_vars:
                if var not in content:
                    missing_vars.append(var)
            
            if missing_vars:
                print_warning(f"Missing variables in .env: {', '.join(missing_vars)}")
                return False
            else:
                print_success("All required environment variables present")
                return True
    else:
        print_error("Backend .env file not found")
        if env_example.exists():
            print_info("Copy .env.example to .env and fill in your credentials")
        return False

def check_virtual_env():
    """Check if running in a virtual environment"""
    print_info("Checking virtual environment...")
    
    if hasattr(sys, 'real_prefix') or (hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix):
        print_success("Running in a virtual environment")
        return True
    else:
        print_warning("Not running in a virtual environment (recommended)")
        print_info("Create one with: python -m venv venv")
        print_info("Activate with: source venv/bin/activate (Linux/Mac) or venv\\Scripts\\activate (Windows)")
        return False

def main():
    """Main verification function"""
    print_header("GeoPulse Installation Verification")
    
    print_info("This script will check if your GeoPulse setup is complete.\n")
    
    results = {
        'Python Version': check_python_version(),
        'Virtual Environment': check_virtual_env(),
        'Python Packages': check_python_packages(),
        'Node.js & npm': check_node_npm(),
        'Frontend Dependencies': check_frontend_dependencies(),
        'Environment Config': check_env_file()
    }
    
    print_header("Verification Summary")
    
    all_passed = True
    for check, passed in results.items():
        if passed:
            print_success(f"{check}: OK")
        else:
            print_error(f"{check}: FAILED")
            all_passed = False
    
    print()
    if all_passed:
        print_success("All checks passed! ✨")
        print_info("You're ready to run GeoPulse!")
        print_info("\nNext steps:")
        print_info("  1. Start frontend: cd frontend && npm run dev")
        print_info("  2. Open http://localhost:3000 in your browser")
        return 0
    else:
        print_error("Some checks failed. Please fix the issues above.")
        print_info("\nFor help, see:")
        print_info("  - SETUP.md for detailed setup instructions")
        print_info("  - QUICKSTART.md for quick setup guide")
        return 1

if __name__ == '__main__':
    try:
        exit(main())
    except KeyboardInterrupt:
        print(f"\n{YELLOW}Verification cancelled.{RESET}")
        exit(1)
