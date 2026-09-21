import cds from "@sap/cds";
import { SpaceFarer } from "#cds-models/GalacticService";
import {
  validateSpaceFarerCreate,
  validateSpaceFarerUpdate,
} from "./galactic-validation";

type NotificationService = {
  notify(payload: {
    recipients: string[];
    title: string;
    description: string;
  }): Promise<unknown>;
};

export default class GalacticService extends cds.ApplicationService {
  async init() {
    const notifications = (await cds.connect.to(
      "notifications",
    )) as unknown as NotificationService;

    this.before(
      "CREATE",
      "SpaceFarers",
      async (req: cds.Request<SpaceFarer>) => {
        return validateSpaceFarerCreate(req);
      },
    );

    this.after("CREATE", "SpaceFarers", async (data) => {
      await notifications.notify({
        recipients: [data.email],
        title: "Welcome to your Cosmic Journey!",
        description: `Congratulations! Your stardust collection begins now, ${data.name}. Your id: ${data.ID}.`,
      });
    });

    this.before("UPDATE", "SpaceFarers", validateSpaceFarerUpdate);

    this.before(
      "DELETE",
      "SpaceFarers",
      async (req: cds.Request<SpaceFarer>) => {
        const spaceFarer = (await SELECT.one
          .from("galactic.adventure.SpaceFarers")
          .where({ ID: req.data.ID })) as SpaceFarer | undefined;

        if (spaceFarer?.email) {
          await notifications.notify({
            recipients: [spaceFarer.email],
            title: "See you Space Cowboy!",
            description: `Goodbye! Your stardust collection ends now, ${spaceFarer?.name}.`,
          });
        }
      },
    );

    return super.init();
  }
}
