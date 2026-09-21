using GalacticService as service from '../../srv/galactic-service';

annotate service.SpaceFarers with {
    name               @title: 'Name';
    email              @title: 'Email';
    stardustCollection @title: 'Stardust Collection';
    wormholeNavigation @title: 'Wormhole Navigation';
    spaceSuitColor     @title: 'Space Suit Color';
    position           @title: 'Position';
};

annotate service.SpaceFarers with @(
    UI.SelectionFields           : [
        stardustCollection,
        wormholeNavigation,
        spaceSuitColor,
        position,
    ],
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: email,
            },
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
                Label: 'Position ID',
                Value: position_ID,
            },
            {
                $Type               : 'UI.DataField',
                Label               : 'Position name',
                Value               : position.name,
                @Common.FieldControl: #ReadOnly
            },
            {
                $Type: 'UI.DataField',
                Label: 'Department name',
                Value: position.department.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Origin Planet',
                Value: originPlanet.name,
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
            Label: 'Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Email',
            Value: email,
        },
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
        $Type         : 'Common.ValueListType',
        CollectionPath: 'SpaceSuitColors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: spaceSuitColor,
                ValueListProperty: 'code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};
