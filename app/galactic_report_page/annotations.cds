using GalacticService as service from '../../srv/galactic-service';

annotate service.SpaceFarers with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'stardustCollection',
                Value: stardustCollection,
            },
            {
                $Type: 'UI.DataField',
                Label: 'wormholeNavigation',
                Value: wormholeNavigation,
            },
            {
                $Type: 'UI.DataField',
                Label: 'spaceSuitColor',
                Value: spaceSuitColor,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'Stardust Collection',
            Value: stardustCollection,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Wormhole Navigation',
            Value: wormholeNavigation,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Space Suit Color',
            Value: spaceSuitColor,
        },
    ],
);

annotate service.SpaceFarers with {
    originPlanet @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Planets',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: originPlanet_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'code',
            },
        ],
    }
};

annotate service.SpaceFarers with {
    position @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Positions',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: position_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};
