import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomSpaceFarersListGenerated from "./SpaceFarersList.gen";
import CustomSpaceFarersObjectPageGenerated from "./SpaceFarersObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("galacticreportpage") + "/test/flp.html#app-preview",
    pages: {
        onTheSpaceFarersListGenerated: new ListReport(
            {
                appId: "galacticreportpage",
                componentId: "SpaceFarersList",
                entitySet: "",
                contextPath: "/SpaceFarers"
            },
            CustomSpaceFarersListGenerated
        ),
        onTheSpaceFarersObjectPageGenerated: new ObjectPage(
            {
                appId: "galacticreportpage",
                componentId: "SpaceFarersObjectPage",
                entitySet: "",
                contextPath: "/SpaceFarers"
            },
            CustomSpaceFarersObjectPageGenerated
        )
    },
    async: true
});

export default runner;
