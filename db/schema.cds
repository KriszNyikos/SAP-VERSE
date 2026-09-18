using { cuid, managed } from '@sap/cds/common';

namespace galactic.adventure;

entity SpaceFarers: cuid, managed {
        stardustCollection : Integer;
        wormholeNavigation : Integer @assert.range: [0,10];
        originPlanet       : Association to Planets;
        position           : Association to Positions;
        department         : Association to Departments;
        spaceSuitColor     : SpaceSuitColor;
}

entity Planets: cuid {
        name : String;
        code : String;
}

annotate Planets with @assert.unique: { code: [code] };

entity Departments: cuid, managed {
        name : String;
}

entity Positions: cuid {
        name : String;
}

type SpaceSuitColor : String enum {
    RED;
    BLUE;
    GREEN;
    YELLOW;
    BLACK;
    WHITE;
}