################################################################################
# OpenCode Skills — Windows PowerShell Installer
# 
# This script installs opencode-skills on Windows systems and sets up
# the necessary directories, configuration, and PowerShell profile.
#
# Usage: powershell -ExecutionPolicy Bypass -File install-windows.ps1
# 
# Note: Run as Administrator for best results (optional but recommended)
################################################################################

param(
    [switch]$SkipGitCheck = $false,
    [switch]$Verbose = $false
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Colors for output
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Write-Header {
    Write-Host ""
    Write-ColorOutput "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "Cyan"
    Write-ColorOutput "  OpenCode Skills — Windows Installation" "Cyan"
    Write-ColorOutput "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "Cyan"
    Write-Host ""
}

function Write-Step {
    param([string]$Message)
    Write-ColorOutput "→ $Message" "Yellow"
}

function Write-Success {
    param([string]$Message)
    Write-ColorOutput "✓ $Message" "Green"
}

function Write-Error-Custom {
    param([string]$Message)
    Write-ColorOutput "✗ $Message" "Red"
}

function Write-Info {
    param([string]$Message)
    Write-ColorOutput "ℹ $Message" "Cyan"
}

################################################################################
# CONFIGURATION
################################################################################

$InstallDir = Join-Path $env:USERPROFILE ".opencode-skills"
$ConfigDir = Join-Path $env:APPDATA "opencode"
$SkillsDir = Join-Path $InstallDir "skills"
$ConfigFile = Join-Path $ConfigDir "config.yaml"
$RepoUrl = "https://github.com/opencode-skills/opencode-skills.git"

################################################################################
# FUNCTIONS
################################################################################

function Test-Administrator {
    Write-Step "Checking administrator privileges..."
    
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $isAdmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    
    if (-not $isAdmin) {
        Write-Info "Running without administrator privileges (optional)"
        Write-Info "Some features may require elevation"
    } else {
        Write-Success "Running with administrator privileges"
    }
}

function Test-Dependencies {
    Write-Step "Checking dependencies..."
    
    $gitFound = $false
    $psVersionOK = $false
    
    # Check Git
    try {
        $gitVersion = git --version 2>$null
        if ($?) {
            Write-Success "Git found: $gitVersion"
            $gitFound = $true
        }
    } catch {
        Write-Error-Custom "Git is not installed or not in PATH"
    }
    
    # Check PowerShell version (5.0+)
    if ($PSVersionTable.PSVersion.Major -ge 5) {
        Write-Success "PowerShell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"
        $psVersionOK = $true
    } else {
        Write-Error-Custom "PowerShell 5.0 or higher required (you have $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor))"
    }
    
    if (-not $gitFound -and -not $SkipGitCheck) {
        Write-Host ""
        Write-Error-Custom "Missing dependencies. Please install Git for Windows:"
        Write-Host "  Download: https://git-scm.com/download/win"
        Write-Host "  Or use: choco install git  (if you have Chocolatey)"
        exit 1
    }
    
    if (-not $psVersionOK) {
        exit 1
    }
}

function New-DirectoriesIfNotExist {
    Write-Step "Creating directories..."
    
    $dirs = @($InstallDir, $ConfigDir, $SkillsDir)
    
    foreach ($dir in $dirs) {
        if (-not (Test-Path -Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Success "Created: $dir"
        } else {
            Write-Info "Already exists: $dir"
        }
    }
}

function Clone-Repository {
    Write-Step "Setting up opencode-skills repository..."
    
    if (Test-Path -Path (Join-Path $InstallDir ".git")) {
        Write-Info "Repository already exists, updating..."
        Push-Location $InstallDir
        try {
            git pull origin main 2>$null | Out-Null
            Write-Success "Repository updated"
        } catch {
            Write-Info "Repository update skipped (may be offline)"
        }
        Pop-Location
    } else {
        Write-Info "Cloning from $RepoUrl"
        try {
            git clone $RepoUrl $InstallDir 2>$null
            Write-Success "Repository cloned to $InstallDir"
        } catch {
            Write-Error-Custom "Failed to clone repository"
            Write-Host "Please ensure Git is installed and configured"
            exit 1
        }
    }
}

function Setup-Configuration {
    Write-Step "Setting up configuration..."
    
    if (-not (Test-Path -Path $ConfigFile)) {
        $configContent = @"
# OpenCode Skills Configuration
# Generated by install-windows.ps1

# Default model provider (free, paid, or local)
# Options: ollama, google-ai, groq, mistral, cohere, anthropic, openai
default_provider: "google-ai"

# Default model for each provider
models:
  ollama: "llama2"
  google_ai: "gemini-pro"
  groq: "mixtral-8x7b-32768"
  mistral: "mistral-large-latest"
  cohere: "command-r-plus"
  anthropic: "claude-3-sonnet-20240229"
  openai: "gpt-4-turbo-preview"

# Default agent
default_agent: "claude"

# API Keys (set these via environment variables)
# `$env:ANTHROPIC_API_KEY = "your-key-here"`
# `$env:OPENAI_API_KEY = "your-key-here"`
# `$env:GOOGLE_API_KEY = "your-key-here"`
# `$env:GROQ_API_KEY = "your-key-here"`
# `$env:MISTRAL_API_KEY = "your-key-here"`
# `$env:COHERE_API_KEY = "your-key-here"`

# Skills directory
skills_path: "$InstallDir\skills"

# Output directory
output_path: ".\output"

# Logging level (debug, info, warn, error)
log_level: "info"
"@
        
        Set-Content -Path $ConfigFile -Value $configContent -Force
        Write-Success "Configuration created at $ConfigFile"
    } else {
        Write-Info "Configuration file already exists"
    }
}

function Setup-PowerShellProfile {
    Write-Step "Configuring PowerShell profile..."
    
    # Create profile directory if it doesn't exist
    $profileDir = Split-Path -Parent $profile
    if (-not (Test-Path -Path $profileDir)) {
        New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
    }
    
    # Check if profile exists
    if (-not (Test-Path -Path $profile)) {
        New-Item -ItemType File -Path $profile -Force | Out-Null
    }
    
    # Read profile content
    $profileContent = Get-Content -Path $profile -Raw -ErrorAction SilentlyContinue
    
    # Add configuration if not already there
    if (-not ($profileContent -like "*opencode-skills*")) {
        $profileAddition = @"

# OpenCode Skills Configuration
`$env:OPENCODE_HOME = "$InstallDir"
`$env:OPENCODE_CONFIG = "$ConfigFile"
`$env:PATH = "`$env:OPENCODE_HOME\bin;`$env:PATH"

# Function for quick access
function opencode {
    & python `$env:OPENCODE_HOME\cli.py `$args
}

# Alias for quick access
Set-Alias -Name oc -Value opencode -Option AllScope

"@
        
        Add-Content -Path $profile -Value $profileAddition
        Write-Success "PowerShell profile updated ($profile)"
        Write-Info "Run: . `$profile  (to reload)"
    } else {
        Write-Info "PowerShell profile already configured"
    }
}

function Install-StarterSkills {
    Write-Step "Checking starter skills..."
    
    $starterSkills = @("explain-concept", "readme-writer", "code-review")
    
    foreach ($skill in $starterSkills) {
        $skillPath = Join-Path $SkillsDir $skill
        if (Test-Path -Path $skillPath) {
            Write-Success "Starter skill: $skill"
        } else {
            Write-Info "Starter skill not yet available: $skill"
        }
    }
}

function Verify-Installation {
    Write-Step "Verifying installation..."
    
    $errors = 0
    
    # Check install directory
    if (-not (Test-Path -Path $InstallDir)) {
        Write-Error-Custom "Installation directory not found"
        $errors += 1
    } else {
        Write-Success "Installation directory exists"
    }
    
    # Check skills directory
    if (-not (Test-Path -Path $SkillsDir)) {
        Write-Error-Custom "Skills directory not found"
        $errors += 1
    } else {
        Write-Success "Skills directory exists"
    }
    
    # Check config file
    if (-not (Test-Path -Path $ConfigFile)) {
        Write-Error-Custom "Configuration file not found"
        $errors += 1
    } else {
        Write-Success "Configuration file exists"
    }
    
    # Check git repo
    if (-not (Test-Path -Path (Join-Path $InstallDir ".git"))) {
        Write-Error-Custom "Git repository not found"
        $errors += 1
    } else {
        Write-Success "Git repository initialized"
    }
    
    if ($errors -gt 0) {
        Write-Error-Custom "Installation verification failed with $errors error(s)"
        exit 1
    }
}

function Print-Summary {
    Write-Host ""
    Write-ColorOutput "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "Cyan"
    Write-ColorOutput "✓ Installation Complete!" "Green"
    Write-ColorOutput "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "Cyan"
    Write-Host ""
    
    Write-ColorOutput "📁 Installation paths:" "Yellow"
    Write-Host "   Install dir:  $InstallDir"
    Write-Host "   Skills dir:   $SkillsDir"
    Write-Host "   Config file:  $ConfigFile"
    Write-Host ""
    
    Write-ColorOutput "🔧 Next steps:" "Yellow"
    Write-Host "   1. Reload your PowerShell profile: . `$profile"
    Write-Host "   2. Set up your API keys in: $ConfigFile"
    Write-Host "   3. Try a skill: opencode explain-concept"
    Write-Host ""
    
    Write-ColorOutput "📚 Learn more:" "Yellow"
    Write-Host "   Documentation:  $InstallDir\README.md"
    Write-Host "   Quick Start:    $InstallDir\QUICK-START.md"
    Write-Host "   Skills Guide:   $InstallDir\SKILLS-GUIDE.md"
    Write-Host ""
    
    Write-ColorOutput "🚀 Ready to get started!" "Green"
    Write-Host ""
}

################################################################################
# MAIN INSTALLATION FLOW
################################################################################

function Main {
    Write-Header
    
    try {
        Test-Administrator
        Write-Host ""
        
        Test-Dependencies
        Write-Host ""
        
        New-DirectoriesIfNotExist
        Write-Host ""
        
        Clone-Repository
        Write-Host ""
        
        Setup-Configuration
        Write-Host ""
        
        Setup-PowerShellProfile
        Write-Host ""
        
        Install-StarterSkills
        Write-Host ""
        
        Verify-Installation
        Write-Host ""
        
        Print-Summary
        
    } catch {
        Write-Host ""
        Write-Error-Custom "Installation failed: $_"
        Write-Host "Please check the error message above and try again."
        exit 1
    }
}

# Run main function
Main
