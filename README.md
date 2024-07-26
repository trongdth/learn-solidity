# AC Metis Hardhat Template

This repository is inspired by the [Hardhat Boilerplate](https://github.com/NomicFoundation/hardhat-boilerplate) but includes more changes to suit modern requirements.

## Changes

- Support Typescript and new version of Ethers
- Suppport Yarn scripts
- Support Metis L2 Network
- Switch CRA to NextJs for frontend

## Quick start

The first things you need to do are cloning this repository and installing its
dependencies:

```sh
git clone git@github.com:appscyclone/ac-metis-hardhat-template.git
cd ac-metis-hardhat-template
yarn install
```

Once installed, let's run Hardhat's testing network:

```sh
yarn hardhat
```

Then, on a new terminal, go to the repository's root folder and run this to
deploy your contract:

```sh
yarn run:local scripts/deploy.ts
```

Finally, we can run the frontend with:

```sh
cd frontend
yarn install
yarn build
yarn start
```

**Happy _building_!**