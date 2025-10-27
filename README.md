# poc-release-please-commitlint

This is a proof of concept repository demonstrating the integration of Release Please with Commitlint to automate semantic versioning and changelog generation based on commit messages.

## Features

- Automated semantic versioning based on commit messages
- Changelog generation from commit history
- Integration with GitHub Actions for continuous deployment
- Support for conventional commit messages

## Getting Started

To get started with this repository, clone it to your local machine and explore the GitHub Actions workflows defined in the .github/workflows directory. You can also check out the `release-please-config.json` file for configuration details.

Feel free to modify the commit messages following the conventional commit format to see how the versioning and changelog generation works!

## Installation

To set up Release Please and Commitlint in your own repository, follow these steps:

1. Install the required dependencies:

```bash
npm install --save-dev release-please commitlint
```

2. Create a `.release-please-manifest.json` file in the root of your repository with the following content:

```json
{
  ".": "0.1.0"
}
```

3. Configure Commitlint by creating a `commitlint.config.js` file in the root of your repository:

```javascript
module.exports = {
  extends: ['@commitlint/config-conventional']
};
```

4. Add a Git hook to lint commit messages before they are created. You can use `husky` for this:

```bash
npx husky install
```

5. Create a `.husky/commit-msg` file with the following content:

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

npx --no-install commitlint --edit "$1"
```

6. use task file to run release please commands as needed.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss potential improvements or features for this proof of concept repository and how Release Please and Commitlint can work together.

## Final Thoughts

This repository serves as a starting point for developers interested in automating their release processes using Release Please and Commitlint. Your feedback and contributions are highly appreciated!

Happy coding!