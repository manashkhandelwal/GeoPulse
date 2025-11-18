#!/bin/bash

# GeoPulse Setup Script
# This script helps automate the initial setup of the GeoPulse project

set -e  # Exit on error

echo "================================================"
echo "   GeoPulse Project Setup"
echo "================================================"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}➜ $1${NC}"
}

# Check if Python is installed
check_python() {
    print_info "Checking Python installation..."
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | awk '{print $2}')
        print_success "Python $PYTHON_VERSION found"
        return 0
    else
        print_error "Python 3 is not installed. Please install Python 3.11.9 or higher."
        return 1
    fi
}

# Check if Node.js is installed
check_node() {
    print_info "Checking Node.js installation..."
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_success "Node.js $NODE_VERSION found"
        return 0
    else
        print_error "Node.js is not installed. Please install Node.js 18 or higher."
        return 1
    fi
}

# Check if npm is installed
check_npm() {
    print_info "Checking npm installation..."
    if command -v npm &> /dev/null; then
        NPM_VERSION=$(npm --version)
        print_success "npm $NPM_VERSION found"
        return 0
    else
        print_error "npm is not installed. Please install npm."
        return 1
    fi
}

# Setup backend
setup_backend() {
    echo ""
    print_info "Setting up Backend..."
    
    cd backend
    
    # Create virtual environment
    print_info "Creating Python virtual environment..."
    python3 -m venv venv
    print_success "Virtual environment created"
    
    # Activate virtual environment
    print_info "Activating virtual environment..."
    source venv/bin/activate
    print_success "Virtual environment activated"
    
    # Install dependencies
    print_info "Installing Python dependencies (this may take a few minutes)..."
    pip install --upgrade pip > /dev/null 2>&1
    pip install -r requirements.txt
    print_success "Python dependencies installed"
    
    # Check if .env exists
    if [ ! -f .env ]; then
        print_info "Creating .env file from template..."
        cp .env.example .env
        print_success ".env file created"
        echo ""
        print_info "IMPORTANT: Please edit backend/.env with your actual credentials!"
        echo ""
    else
        print_info ".env file already exists"
    fi
    
    # Verify PyTorch installation
    print_info "Verifying PyTorch installation..."
    python -c "import torch; print('PyTorch version:', torch.__version__)" 2>/dev/null
    print_success "PyTorch verified"
    
    cd ..
}

# Setup frontend
setup_frontend() {
    echo ""
    print_info "Setting up Frontend..."
    
    cd frontend
    
    # Install dependencies
    print_info "Installing npm dependencies (this may take a few minutes)..."
    npm install
    print_success "npm dependencies installed"
    
    cd ..
}

# Main setup process
main() {
    echo "This script will set up the GeoPulse project on your system."
    echo "Please ensure you have the following installed:"
    echo "  - Python 3.11.9 or higher"
    echo "  - Node.js 18 or higher"
    echo "  - npm"
    echo ""
    
    # Check prerequisites
    if ! check_python; then
        exit 1
    fi
    
    if ! check_node; then
        exit 1
    fi
    
    if ! check_npm; then
        exit 1
    fi
    
    echo ""
    read -p "Do you want to continue with the setup? (y/n) " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Setup cancelled."
        exit 0
    fi
    
    # Run setup
    setup_backend
    setup_frontend
    
    echo ""
    echo "================================================"
    print_success "Setup completed successfully!"
    echo "================================================"
    echo ""
    echo "Next steps:"
    echo "  1. Edit backend/.env with your credentials"
    echo "  2. Start the frontend: cd frontend && npm run dev"
    echo "  3. Open http://localhost:3000 in your browser"
    echo ""
    echo "For more information, see SETUP.md"
    echo ""
}

# Run main function
main
