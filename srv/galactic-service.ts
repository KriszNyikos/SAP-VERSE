import cds from "@sap/cds";
import { SpaceFarer } from "#cds-models/GalacticService";
import { spaceFarerValidation } from "./galactic-validation";

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
        return spaceFarerValidation(req);
      },
    );

    this.after("CREATE", "SpaceFarers", async (data) => {
      await notifications.notify({
        recipients: [data.email],
        title: "Welcome to your Cosmic Journey!",
        description: `Congratulations! Your stardust collection begins now, ${data.name}. Your id: ${data.ID}.`,
      });
    });

    this.before("UPDATE", "SpaceFarers", spaceFarerValidation);

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

    this.on("SAVE", "SpaceFarers", async (req, next) => {
      try {
        return await next();
      } catch (error) {
        const err = error as { message?: string; code?: string };
        if (
          err.message &&
          (err.message.includes("UNIQUE constraint failed") ||
            err.code === "SQLITE_CONSTRAINT")
        ) {
          if (err.message.includes("name")) {
            req.error(400, "This name is already registered.", "in/name");
          } else if (err.message.includes("email")) {
            req.error(
              400,
              "This email address is already registered.",
              "in/email",
            );
          } else {
            req.error(
              400,
              "The supplied value already exists and must be unique.",
            );
          }
        }
        throw error;
      }
    });

    this.on("addStardust", "SpaceFarers", async (req, next) => {
      const { stardust } = req.data;
      const { ID } = req.params[0];

      if (!ID || typeof stardust !== "number") {
        req.error(400, "Invalid request data.");
      }
      const spaceFarer = (await SELECT.one
        .from("galactic.adventure.SpaceFarers")
        .where({ ID })) as SpaceFarer | undefined;

      if (!spaceFarer) {
        req.error(404, "SpaceFarer not found.");
      } else {
        spaceFarer.stardustCollection += stardust;
        await UPDATE("galactic.adventure.SpaceFarers")
          .set({ stardustCollection: spaceFarer.stardustCollection })
          .where({ ID });

        return spaceFarer;
      }
    });

    return super.init();
  }
}
