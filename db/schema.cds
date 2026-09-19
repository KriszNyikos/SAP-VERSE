using { cuid, managed } from '@sap/cds/common';

namespace galactic.adventure;

entity SpaceFarers: cuid, managed {
        stardustCollection : Integer default 0;
        wormholeNavigation : Integer @assert.range: [0,10] default 5;
        originPlanet       : Association to Planets;
        position           : Association to Positions;
        department         : Association to Departments;
        spaceSuitColor     : SpaceSuitColor default 'WHITE';
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