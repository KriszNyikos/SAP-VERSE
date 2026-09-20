## Galactic Spacefarer Adventure - Test Guide

This repository contains a CAP service and a generated SAP Fiori elements List Report/Object Page application for managing spacefarers.

## Running the application

### Prerequisites

- Node.js LTS
- npm

Install the dependencies from the repository root:

```bash
npm install
```

Start the application with:

```bash
npm run watch-galactic_report_page
```

Alternatively, start the CAP server with:

```bash
npm start
```

Then open:

```text
http://localhost:4004/galacticreportpage/index.html
```

When the authentication dialog appears, use one of the test users below. No password is required for the local development authentication.

| User | Planet | Role |
| --- | --- | --- |
| `alice` | Mars | `Analyst` |
| `bob` | Earth | `Analyst` |
| `luke` | Saturn | `Analyst` |

## Expected authorization behavior

The `SpaceFarers` list is restricted to the logged-in user's planet:

- `alice` can read and maintain Mars spacefarers.
- `bob` can read and maintain Earth spacefarers.
- `luke` can read and maintain Saturn spacefarers.

The `Positions` value help is restricted in the same way. For example, when logged in as `alice`, only Mars positions should be available for selection.

## Test checklist

### List Report

1. Open the application with each test user.
2. Verify that only spacefarers from the user's planet are displayed.
3. Verify that the table shows the readable values for the name, origin planet, position and department.
4. Use the filter bar and test filtering by the available fields.
5. Verify pagination/growing behavior. The seed data contains more than 30 spacefarers per planet, so the list should contain enough records to require loading more entries.

### Object Page and editing

1. Select a spacefarer to open the Object Page.
2. Choose **Edit**.
3. Verify that these fields can be changed:
   - `Name`
   - `Stardust Collection`
   - `Wormhole Navigation`
   - `Space Suit Color`
   - `Position ID`
4. Verify that `Position name`, `Department name` and `Origin Planet` are display-only values.
5. Change the position using the value help and save the draft.
6. Activate/save the draft and verify that the record contains the selected position.

The Fiori edit flow uses drafts. Therefore, a create or update can first appear as a draft and is only written to the active data after the draft is saved/activated.

### Create validation

Create a new spacefarer and verify the following:

- `Name` cannot be empty.
- `Position ID` is required.
- `Stardust Collection` cannot be negative.
- `Wormhole Navigation` must be between `0` and `10`.
- `Space Suit Color` must be selected from the available value help values.
- The selected position must exist.
- The selected position must belong to the logged-in user's planet.
- The origin planet is derived from the selected position and is not supplied manually.

### Update validation

Edit an existing record and verify that the same numeric and suit-color rules are enforced. When the position changes, the related origin planet is recalculated by the service.

## Service endpoint

The OData V4 service is available at:

```text
http://localhost:4004/odata/v4/galactic/
```

The main entity is:

```text
http://localhost:4004/odata/v4/galactic/SpaceFarers
```

The value-help entities are `Positions`, `Planets` and `SpaceSuitColors`.

## Resetting local seed data

If the local SQLite database needs to be recreated after changing the CDS model or seed CSV files, stop the running server and deploy the database again:

```bash
npx cds deploy --to sqlite:db/galactic.db
```

This recreates the local development data from the CDS model and the files in `db/data`.

## Generated application details

|               |
| ------------- |
|               |
| ------------- |
|**Generation Date and Time**<br>Sat Sep 19 2026 11:52:33 GMT+0200 (Central European Summer Time)|
|**App Generator**<br>SAP Fiori Application Generator|
|**App Generator Version**<br>1.32.0|
|**Generation Platform**<br>Visual Studio Code|
|**Template Used**<br>List Report Page V4|
|**Service Type**<br>Local CAP|
|**Service URL**<br>http://localhost:4004/odata/v4/galactic/|
|**Module Name**<br>galactic_report_page|
|**Application Title**<br>Galacti List Report|
|**Namespace**<br>|
|**UI5 Theme**<br>sap_horizon|
|**UI5 Version**<br>1.152.0|
|**Enable TypeScript**<br>True|
|**Add Eslint configuration**<br>True, see https://www.npmjs.com/package/@sap-ux/eslint-plugin-fiori-tools#rules for the eslint rules.|
|**Main Entity**<br>SpaceFarers|

## galactic_report_page

A Galactic SAP Fiori application.

### Starting the generated app

-   This app has been generated using the SAP Fiori tools - App Generator, as part of the SAP Fiori tools suite.  To launch the generated app, start your CAP project:  and navigate to the following location in your browser:

http://localhost:4004/galacticreportpage/index.html

#### Pre-requisites:

1. Active NodeJS LTS (Long Term Support) version and associated supported NPM version.  (See https://nodejs.org)

