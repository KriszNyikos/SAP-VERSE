using GalacticService as service from '../../srv/galactic-service';

annotate service.SpaceFarers with {
    stardustCollection @title: 'Stardust Collection';
    wormholeNavigation @title: 'Wormhole Navigation';
    spaceSuitColor     @title: 'Space Suit Color';
};

annotate service.SpaceFarers with @(
    UI.SelectionFields           : [
        stardustCollection,
        wormholeNavigation,
        spaceSuitColor,
    ],
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: stardustCollection,
            },
            {
                $Type: 'UI.DataField',
                Value: wormholeNavigation,
            },
            {
                $Type: 'UI.DataField',
                Value: spaceSuitColor,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Origin Planet',
                Value: originPlanet.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Position',
                Value: position.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Department',
                Value: position.department.name,
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
        {
            $Type: 'UI.DataField',
            Label: 'Origin Planet',
            Value: originPlanet.name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Position',
            Value: position.name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Department',
            Value: position.department.name,
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

annotate service.SpaceFarers with {
    spaceSuitColor @Common.ValueList: {
        $Type: 'Common.ValueListType',
        CollectionPath: 'SpaceSuitColors',
        Parameters: [
            {
                $Type: 'Common.ValueListParameterInOut',
                LocalDataProperty: spaceSuitColor,
                ValueListProperty: 'code',
            },
            {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};
