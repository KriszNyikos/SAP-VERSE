import cds from "@sap/cds";
import { SpaceFarer } from "#cds-models/GalacticService";

const LOG = cds.log("galactic-service");

export default class GalacticService extends cds.ApplicationService {
  async init() {
    this.before(
      "CREATE",
      "SpaceFarers",
      async (req: cds.Request<SpaceFarer>) => {
        if (!req.data.position_ID) {
          return req.error(400, "position must be set during creation");
        }

        if (!req.data.department_ID) {
          return req.error(400, "department must be set during creation");
        }

        if (
          req.data.stardustCollection != null &&
          req.data.stardustCollection < 0
        ) {
          return req.error(400, "stardustCollection must be non-negative");
        }

        if (
          req.data.wormholeNavigation != null &&
          (req.data.wormholeNavigation < 0 || req.data.wormholeNavigation > 10)
        ) {
          return req.error(400, "wormholeNavigation must be between 0 and 10");
        }

        const userPlanetCode = req.user.attr.planetCode;
        const originPlanet = await SELECT.one
          .from("galactic.adventure.Planets")
          .where({ code: userPlanetCode });

        if (originPlanet === undefined) {
          return req.error(400, "Origin planet not found for the user");
        }

        req.data.originPlanet_ID = originPlanet.ID;
      },
    );

    this.after("CREATE", "SpaceFarers", (data) => {
      LOG.info(`Cosmic notification sent for Spacefarer ${data.ID}`);
    });

    return super.init();
  }
}
