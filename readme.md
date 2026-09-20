# Getting Started

Welcome to your new CAP project.

## Galactic Spacefarer Adventure

A CAP + SAP Fiori Elements application for managing spacefarer records. The application includes planet-based authorization, draft editing, position value help, and CREATE/UPDATE validation.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Quick Start

Install the dependencies and start the Fiori application:

```bash
npm install
npm run watch-galactic_report_page
```

Open the application at <http://localhost:4004/galacticreportpage/index.html>.

The OData V4 service is available at <http://localhost:4004/odata/v4/galactic/>.

The test users and detailed verification steps are described in the [application test guide](app/galactic_report_page/README.md).

## Project Structure

- `db/` - CDS domain model and seed data
- `srv/` - CAP service, authorization rules and validation logic
- `app/galactic_report_page/` - SAP Fiori Elements application
- For the Galactic Spacefarer application setup and test instructions, see the [application test guide](app/galactic_report_page/README.md).

## Learn More

Learn more at <https://cap.cloud.sap>.
