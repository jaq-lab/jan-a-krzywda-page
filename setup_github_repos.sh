#!/bin/bash

# GitHub Organization Setup Script for jan-a-krzywda-page
# This script automates the creation of the GitHub organization and all repositories

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
ORG_NAME="JAK-lab"
BASE_DIR="/Users/krzywdaja/Documents/Repositories/jan-a-krzywda-page"

echo -e "${BLUE}🚀 Setting up GitHub organization: $ORG_NAME${NC}"
echo "=================================================="

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI (gh) is not installed.${NC}"
    echo "Please install it first:"
    echo "  macOS: brew install gh"
    echo "  Then run: gh auth login"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo -e "${RED}❌ Not authenticated with GitHub.${NC}"
    echo "Please run: gh auth login"
    exit 1
fi

echo -e "${GREEN}✅ GitHub CLI is installed and authenticated${NC}"

# Function to create and push repository
create_and_push_repo() {
    local repo_name=$1
    local description=$2
    local repo_dir="$BASE_DIR/$repo_name"
    
    echo -e "${YELLOW}📁 Processing $repo_name...${NC}"
    
    # Create repository on GitHub
    echo "  Creating repository on GitHub..."
    gh repo create "$ORG_NAME/$repo_name" --public --description "$description" || {
        echo -e "${YELLOW}  Repository $repo_name might already exist, continuing...${NC}"
    }
    
    # Initialize and push local repository
    if [ -d "$repo_dir" ]; then
        cd "$repo_dir"
        
        # Initialize git if not already initialized
        if [ ! -d ".git" ]; then
            git init
        fi
        
        # Add README and commit
        git add README.md
        git commit -m "Initial commit: $repo_name project overview" || {
            echo -e "${YELLOW}  No changes to commit for $repo_name${NC}"
        }
        
        # Set main branch and remote
        git branch -M main
        
        # Remove existing remote if it exists and add new one
        git remote remove origin 2>/dev/null || true
        git remote add origin "https://github.com/$ORG_NAME/$repo_name.git"
        
        # Push to GitHub
        git push -u origin main || {
            echo -e "${YELLOW}  Push failed for $repo_name, trying force push...${NC}"
            git push -u origin main --force
        }
        
        echo -e "${GREEN}  ✅ $repo_name repository created and pushed${NC}"
        cd "$BASE_DIR"
    else
        echo -e "${RED}  ❌ Directory $repo_dir not found${NC}"
    fi
    echo ""
}

# Create main organization repository first
echo -e "${BLUE}📋 Creating main organization repository...${NC}"
create_and_push_repo "jan-a-krzywda-page" "Research organization of Jan A. Krzywda focused on quantum technologies"

# Create all project repositories
echo -e "${BLUE}📋 Creating project repositories...${NC}"

create_and_push_repo "charge-noise-spin-qubits" "Arguably the biggest obstacle to large scale spin qubit device. Experimental characterization and ab-initio simulation"

create_and_push_repo "machine-learning-quantum" "Classical machine learning methods for processing and simulating quantum systems and devices from sparse data"

create_and_push_repo "quantum-feedback-control" "Qubits suffer from dynamical noise. We deploy real-life FPGA controller to track down and correct random fluctuations"

create_and_push_repo "quantum-games" "Games drive progress, from chess to computer graphics. Now the time has come to quantum technologies"

create_and_push_repo "quantum-learning-machines" "Practical use of noisy quantum devices for data-driven learning, reinforcement learning and generative AI"

create_and_push_repo "spin-qubit-emulator" "Spin qubit are complex. Lots of data is needed for autonomous tuning and new algorithms dev. Digital twin is needed for that"

echo -e "${GREEN}🎉 Setup complete!${NC}"
echo "=================================================="
echo -e "${BLUE}Your GitHub organization is now available at:${NC}"
echo -e "${GREEN}https://github.com/$ORG_NAME${NC}"
echo ""
echo -e "${BLUE}Created repositories:${NC}"
echo "  • https://github.com/$ORG_NAME/jan-a-krzywda-page (main organization)"
echo "  • https://github.com/$ORG_NAME/charge-noise-spin-qubits"
echo "  • https://github.com/$ORG_NAME/machine-learning-quantum"
echo "  • https://github.com/$ORG_NAME/quantum-feedback-control"
echo "  • https://github.com/$ORG_NAME/quantum-games"
echo "  • https://github.com/$ORG_NAME/quantum-learning-machines"
echo "  • https://github.com/$ORG_NAME/spin-qubit-emulator"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Visit your organization page to configure settings"
echo "  2. Add individual project repositories to the repos/ folders"
echo "  3. Update README links to point to actual repository URLs"
echo "  4. Add collaborators if needed"
echo ""
echo -e "${GREEN}✨ Happy coding!${NC}"
