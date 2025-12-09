# awesome-terragrunt

A curated collection of Terragrunt configurations and best practices for infrastructure as code.

## 🚀 Quick Start with Devbox

This project uses [Devbox](https://www.jetpack.io/devbox) to provide a consistent, reproducible development environment with all necessary tools pre-installed.

### Prerequisites

Install Devbox on your system:

```bash
# macOS
curl -fsSL https://get.jetpack.io/devbox | bash

# Linux
curl -fsSL https://get.jetpack.io/devbox | bash

# Windows (WSL)
curl -fsSL https://get.jetpack.io/devbox | bash
```

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/chanilharisankar/awesome-terragrunt.git
   cd awesome-terragrunt
   ```

2. **Start the devbox environment:**
   ```bash
   devbox shell
   ```

3. **Verify the installation:**
   ```bash
   devbox run test
   ```

### Available Tools

The devbox environment includes the following tools:

- **Terragrunt** - Infrastructure orchestration tool
- **Terraform** - Infrastructure as Code tool

### Devbox Commands

- `devbox shell` - Enter the development environment
- `devbox run test` - Test that all tools are properly installed
- `devbox run setup` - Run setup scripts
- `devbox services up` - Start any configured services
- `devbox services stop` - Stop running services

### Environment Variables

The following environment variables are automatically set:

- `TERRAGRUNT_DOWNLOAD` - Set to `.terragrunt-cache` for local caching

## 📚 Usage

After entering the devbox environment, you can use all Terragrunt and Terraform commands as usual:

```bash
# Example terragrunt commands
(cd infra/awesome/dev/network && terragrunt plan)
(cd infra/awesome/dev/network && terragrunt apply)
(cd infra/awesome/dev/network && terragrunt destroy)
```

## 🛠️ Development

### Adding New Tools

To add new tools to the development environment, edit the `devbox.json` file:

```json
{
  "packages": [
    "terragrunt@latest",
    "your-new-tool@latest"
  ]
}
```

Then run:
```bash
devbox install
```

### Custom Scripts

Add custom scripts to the `devbox.json` shell scripts section for project-specific workflows.

### Required env variables for aws

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION
TF_VAR_aws_region