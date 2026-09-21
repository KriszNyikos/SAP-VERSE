import cds from "@sap/cds";
import {
  SpaceFarer,
  Department,
  Position,
  Planet,
} from "#cds-models/GalacticService";

export const validateSpaceFarerCreate = async (
  req: cds.Request<SpaceFarer>,
) => {
  if (!req.data) {
    return req.error(400, "Request data is missing");
  }

  if (!req.data.email || req.data.email.trim() === "") {
    return req.error(400, "email must be set during creation");
  }

  if (!req.data.name || req.data.name.trim() === "") {
    return req.error(400, "name must be set during creation");
  }

  if (!req.data.position_ID) {
    return req.error(400, "position must be set during creation");
  }

  if (req.data.stardustCollection != null && req.data.stardustCollection < 0) {
    return req.error(400, "stardustCollection must be non-negative");
  }

  if (
    req.data.wormholeNavigation != null &&
    (req.data.wormholeNavigation < 0 || req.data.wormholeNavigation > 10)
  ) {
    return req.error(400, "wormholeNavigation must be between 0 and 10");
  }

  const spaceSuitRows = await SELECT.from(
    "galactic.adventure.SpaceSuitColors",
  ).columns("code");
  const allowedSpaceSuitColors = spaceSuitRows.map(
    (row: { code: string }) => row.code,
  );

  if (
    !req.data.spaceSuitColor ||
    !allowedSpaceSuitColors.includes(req.data.spaceSuitColor)
  ) {
    return req.error(400, "Invalid spaceSuitColor");
  }

  const position = (await SELECT.one
    .from("galactic.adventure.Positions")
    .where({
      ID: req.data.position_ID,
    })) as Position | undefined;

  if (position === undefined) {
    return req.error(400, "Position not found");
  }

  const department = (await SELECT.one
    .from("galactic.adventure.Departments")
    .where({ ID: position.department_ID })) as Department | undefined;

  if (department === undefined) {
    return req.error(400, "Department not found for the position");
  }

  const originPlanet = (await SELECT.one
    .from("galactic.adventure.Planets")
    .where({ ID: department.planet_ID })) as Planet | undefined;

  if (originPlanet === undefined) {
    return req.error(400, "Origin planet not found for the selected position");
  }

  req.data.originPlanet_ID = originPlanet.ID;
};

export const validateSpaceFarerUpdate = async (
  req: cds.Request<SpaceFarer>,
) => {
  if (!req.data) {
    return req.error(400, "Request data is missing");
  }

  if (!req.data.email || req.data.email.trim() === "") {
    return req.error(400, "email cannot be empty");
  }

  if (!req.data.name || req.data.name.trim() === "") {
    return req.error(400, "name cannot be empty");
  }

  if (req.data.stardustCollection != null && req.data.stardustCollection < 0) {
    return req.error(400, "stardustCollection must be non-negative");
  }

  if (
    req.data.wormholeNavigation != null &&
    (req.data.wormholeNavigation < 0 || req.data.wormholeNavigation > 10)
  ) {
    return req.error(400, "wormholeNavigation must be between 0 and 10");
  }

  const spaceSuitRows = (await SELECT.from(
    "galactic.adventure.SpaceSuitColors",
  ).columns("code")) as { code: string }[];
  const allowedSpaceSuitColors = spaceSuitRows.map(
    (row: { code: string }) => row.code,
  );

  if (
    req.data.spaceSuitColor &&
    !allowedSpaceSuitColors.includes(req.data.spaceSuitColor)
  ) {
    return req.error(400, "Invalid spaceSuitColor");
  }

  if (req.data.position_ID != null) {
    const position = (await SELECT.one
      .from("galactic.adventure.Positions")
      .where({ ID: req.data.position_ID })) as Position | undefined;

    if (position === undefined) {
      return req.error(400, "Position not found");
    }

    const department = (await SELECT.one
      .from("galactic.adventure.Departments")
      .where({ ID: position.department_ID })) as Department | undefined;

    if (department === undefined) {
      return req.error(400, "Department not found for the position");
    }

    const originPlanet = (await SELECT.one
      .from("galactic.adventure.Planets")
      .where({ ID: department.planet_ID })) as Planet | undefined;

    if (originPlanet === undefined) {
      return req.error(
        400,
        "Origin planet not found for the selected position",
      );
    }

    req.data.originPlanet_ID = originPlanet.ID;
  }
};
