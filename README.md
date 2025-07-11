# red-script

Monorepo for SkillSwap, using:

- Vue 3 (Vite, TypeScript) frontend
- Express (TypeScript) backend with Prisma
- SQLite database

---

## Prerequisites

- Node.js
- pnpm

Install pnpm globally if needed:

    npm install -g pnpm

---

## Clone the Repository

    git clone https://github.com/freeCodeCamp-2025-Summer-Hackathon/red-script.git
    cd red-script

---

## Install Dependencies

Run this from the repo root:

    pnpm install

This installs dependencies for both frontend and backend.

---

## Database Setup (SQLite)

Run migrations:

    cd backend
    npx prisma migrate dev --name init


Launch Prisma Studio to inspect & insert data whenever needed

    npx prisma studio

---

## Install mkcert

On Windows, open an elevated PowerShell instance and run the following:

    Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
choco install mkcert -y;
mkcert -install


On Linux, use your distro's package manager to install mkcert directly. 

---

## Populate your .env files

Navigate to the backend folder.
     -Create a file called .env. 
     -Add the following keys, along with each value you wish to use
         -DATABASE_URL="file:./dev.db"
         -JWT_SECRET
         -AZURE_STORAGE_CONNECTION_STRING
Note: If you are a Hackathon leader / judge and you need to run our project, please reach out to the team on Discord to get copies of our .env files.

---

## Run the Backend

From the backend folder:

    cd backend
    pnpm dev

Backend runs at:

    http://localhost:4000

---

## Run the Frontend

In another terminal:

    cd frontend
    pnpm dev

Frontend runs at:

    http://localhost:3000

## Contributing
This project is maintained by the internal development team. Contributions are restricted to authorized team members. Please follow these guidelines to ensure a smooth collaboration process.

### Branching Strategy
We use **Trunk-Based Development** for managing our codebase:

- **Main Branch (**`main`**)**: The `main` branch is the primary branch and should always be in a production-ready state.
- **Supporting Branches**: Create branches off `main` for specific changes. These branches **should be short-lived** and merged back into `main` frequently via pull requests (PRs). Use the following branch types:
  - `feature/<description>`: For new features or enhancements (e.g., `feature/add-user-auth`).
  - `fix/<description>`: For bug fixes or performance-related issues (e.g., `fix/login-bug` or `fix/slow-api-response`).
  - `chore/<description>`: For general maintenance tasks, such as updating dependencies or build tools (e.g., `chore/update-npm-packages`).
  - `ci/<description>`: For changes to CI/CD pipelines or configurations (e.g., `ci/add-github-actions-workflow`).
  - `docs/<description>`: For documentation updates (e.g., `docs/update-readme`).
  - `test/<description>`: For adding or updating tests (e.g., `test/add-unit-tests`).
  - `refactor/<description>`: For code refactoring or performance improvements without changing functionality (e.g., `refactor/optimize-database-query`).
  
**Pull Requests (PRs)**: All changes must go through a pull request for code review before merging into `main`. Keep PRs small and focused to facilitate quick reviews.

### Commit Messages

We follow the **Conventional Commits** specification for clear and consistent commit messages. Each commit message should follow this structure:

```
<type>(<scope>): <short description>
```

- **Types**:
  - `feat`: A new feature.
  - `fix`: A bug fix or performance issue resolution.
  - `test`: Adding or modifying tests.
  - `docs`: Documentation changes.
  - `ci`: Changes to CI/CD pipelines or configurations (e.g., GitHub Actions workflows).
  - `chore`: General maintenance tasks (e.g., updating dependencies or build scripts).
  - `refactor`: Code refactoring or performance improvements without changing functionality.
- **Scope**: A brief context of the change (e.g., `auth`, `ui`, `api`, `github`).
- **Short Description**: A concise summary of the change (50 characters or less).

**Examples**:

```
feat(auth): add user login endpoint
fix(ui): resolve button alignment issue
test(api): add unit tests for endpoints
docs(readme): update contributing guidelines
ci(github): add automated testing workflow
chore(deps): update lodash to v4.17.21
refactor(api): optimize query performance
```

### Contribution Workflow
obs.: It is recommended you use ssh, if you haven't set it yet check it [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).
1. **Clone the Repository**: Clone the main repository to your local machine.

   ```bash
   git clone <repository-url>
   ```

2. **Create a Branch**:

   ```bash
   git checkout -b <type>/<description>
   ```

   Example: `git checkout -b ci/add-github-actions`

3. **Make Changes**: Implement your changes, ensuring code quality and adherence to project standards.

4. **Commit Changes**: Use Conventional Commits for your commit messages.

   ```bash
   git commit -m "ci(github): add automated testing workflow"
   ```

5. **Push to the Repository**:

   ```bash
   git push origin <type>/<description>
   ```

6. **Open a Pull Request**: Submit a PR to the `main` branch within the repository. Include a clear description of your changes and reference any related issues.

7. **Code Review**: Address feedback from reviewers and make necessary changes.

8. **Merge and Cleanup**: Once approved, your PR will be merged into `main`. Delete the branch after merging to keep the repository clean.

   ```bash
   git push origin --delete <type>/<description>
   ```

### Additional Guidelines

- Keep commits atomic (one logical change per commit).
- Write tests for new features, bug fixes, or performance improvements where applicable.
- Ensure your code passes all existing tests and linting checks.
- Use `ci/` for changes to CI/CD pipelines (e.g., GitHub Actions, Jenkins) and `chore/` for other maintenance tasks (e.g., dependency updates).
- For performance improvements, use `refactor/` for non-functional optimizations (e.g., `refactor/optimize-rendering`) or `fix/` for performance-related bug fixes (e.g., `fix/slow-page-load`).
- Ensure branch protection rules are respected to prevent direct pushes to `main`.
