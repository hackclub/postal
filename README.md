# Postal

This is [HCB](https://hackclub.com/hcb/)'s deployment of [Sendy](https://sendy.co/), available for free to all Hack Clubs, hackathons, and nonprofits running on HCB.

Powered by NixOS and [Morph](https://github.com/DBCDK/morph).

## Design Goals

- Fully declarative deploy
- Deployed with GitHub Actions
- Secrets stored in GitHub Actions environment
- Backup script included with deploy

## To-Do

- Fix patching of Sendy, right now the patch is not applying at all for some reason
- Put uploads in /var/lib/sendy/uploads instead of in uploads/ of the derivation
- Put secrets in GitHub Actions environment, including Sendy license key for downloading source code
- Set up DB backups

And then deploy and replace the current VPS running Postal.

## License

This is licensed under the MIT License. See the full [`LICENSE`](./LICENSE)
