# Polaris icons

This repository is the place to contribute any changes to icons.

To design a new icon or suggest a change to the design of an existing icon, refer to the [design contributor’s guide](./CONTRIBUTING-DESIGN.md).

To add icons to the public and private packages, make a code change, or release a new version of the packages, refer to [coding contributor’s guide](./CONTRIBUTING-CODING.md).

## Usage

This project is structured as a [monorepo](https://en.wikipedia.org/wiki/Monorepo), storing multiple packages under a single repository. Some packages are related to each other, so a change in one package might require or trigger a change in another package.

The repository deploys a gem to [Shopify’s internal Package Cloud instance](https://packages.shopify.io/). This gem includes all the icons as PDFs and Android Drawables.

### Package Index

| package                                                       |                                                                                                                                                                                                     |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [@shopify/polaris-icons](/packages/polaris-icons)             | This package is deployed to public NPM, and exports a JS file that contains all of the Polaris icons that have been made available for public usage (i.e.: usage by partners in apps)               |
| [polaris-icons-internal](/packages/polaris-icons-internal)    | This package is deployed to Shopify's private NPM instance, and exports a JS file that contains all the polaris icons that are private, and for internal use only                                   |
| [polaris-icons-raw](/packages/polaris-icons-raw)              | This package is a helper package that is imported by the other two packages above. This package is deployed to Shopify's private NPM instance, and contains SVG files for all icons made by Shopify |
| [@shopify/polaris-icons-audit](/packages/polaris-icons-audit) | This package is deployed to public NPM, and is a CLI utility that can be run by any project to generate an audit of SVG usage                                                                       |
| [app-icon-explorer](/packages/app-icon-explorer)              | This is a private package that is not deployed to any NPM instance. The package is a Gatsby static website that displays all of the icons in `polaris-icons-raw` in a user-friendly way             |
