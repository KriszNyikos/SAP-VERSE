using {galactic.adventure as db} from '../db/schema';

@(requires: 'authenticated-user')
service GalacticService {

    @restrict: [{
        grant: [
            'READ',
            'CREATE',
            'UPDATE',
            'DELETE',
            'addStardust'
        ],
        to   : 'Analyst',
        where: 'position.department.planet.code = $user.planetCode'
    }]
    @odata.draft.enabled
    entity SpaceFarers     as projection on db.SpaceFarers actions {
        action addStardust(stardust: Integer) returns SpaceFarers;
    }

    @readonly
    entity Planets         as projection on db.Planets;

    @readonly
    entity Departments     as projection on db.Departments;

    @restrict: [{
        grant: [
            'READ',
            'CREATE',
            'UPDATE'
        ],
        to   : 'Analyst',
        where: 'department.planet.code = $user.planetCode'
    }]
    entity Positions       as projection on db.Positions;

    @readonly
    entity SpaceSuitColors as projection on db.SpaceSuitColors;
}
