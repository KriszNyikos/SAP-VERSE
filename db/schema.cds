using { cuid, managed } from '@sap/cds/common';

namespace galactic.adventure;

entity SpaceFarers: cuid, managed {
        name : String;
        stardustCollection : Integer default 0 ;
        wormholeNavigation : Integer @assert.range: [0,10] default 5;
        originPlanet       : Association to Planets;
        position           : Association to Positions;
        spaceSuitColor     : String(10) default 'WHITE';
}

entity Planets: cuid {
        name : String;
        code : String;
}

annotate Planets with @assert.unique: { code: [code] };

entity Departments: cuid, managed {
        name : String;
        planet : Association to Planets;
}

annotate Departments with @assert.unique: { name: [name, planet] };

entity Positions: cuid {
        name : String;
        department  : Association to Departments;
}
annotate Positions with @assert.unique: { name: [name, department] };

entity SpaceSuitColors {
        key code : String;
        name : String;  
}
