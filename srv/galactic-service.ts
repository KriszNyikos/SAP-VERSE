import cds from "@sap/cds";

const LOG = cds.log("galactic-service");

export default class GalacticService extends cds.ApplicationService {
  async init() {
    this.before("CREATE", "SpaceFarers", (req) => {
      const { stardustCollection, wormholeNavigation } = req.data;

      if (stardustCollection === undefined) {
        req.data.stardustCollection = 0;
      }

      if (wormholeNavigation === undefined) {
        req.error(400, "wormholeNavigation is required");
      }

      if (stardustCollection !== undefined && stardustCollection < 0) {
        req.error(400, "stardustCollection must be non-negative");
      }

      if (
        wormholeNavigation !== undefined &&
        (wormholeNavigation < 0 || wormholeNavigation > 10)
      ) {
        req.error(400, "wormholeNavigation must be between 0 and 10");
      }
    });

    this.after("CREATE", "SpaceFarers", (data) => {
      LOG.info(`Cosmic notification sent for Spacefarer ${data.ID}`);
    });

    return super.init();
  }
}
