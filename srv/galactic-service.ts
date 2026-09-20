import cds from "@sap/cds";
import { SpaceFarer } from "#cds-models/GalacticService";
import {
  validateSpaceFarerCreate,
  validateSpaceFarerUpdate,
} from "./galactic-validation";

const LOG = cds.log("galactic-service");

export default class GalacticService extends cds.ApplicationService {
  async init() {
    this.before(
      "CREATE",
      "SpaceFarers",
      async (req: cds.Request<SpaceFarer>) => {
        return validateSpaceFarerCreate(req);
      },
    );

    this.after("CREATE", "SpaceFarers", (data) => {
      LOG.info(`Cosmic notification sent for Spacefarer ${data.ID}`);
    });

    this.before("UPDATE", "SpaceFarers", validateSpaceFarerUpdate);

    this.after("DELETE", "SpaceFarers", (data) => {
      LOG.info('See you space cowboy ...');
    });

    return super.init();
  }
}
