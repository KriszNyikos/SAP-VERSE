using {galactic.adventure as db} from '../db/schema';

@(requires: 'authenticated-user')
service GalacticService {

    @restrict: [
        { grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'], to: 'Analyst', where: 'originPlanet.code = $user.planetCode' }
    ]
    entity SpaceFarers as projection on db.SpaceFarers;

    @readonly
    entity Planets     as projection on db.Planets;

    @readonly
    entity Departments as projection on db.Departments;

    @readonly
    entity Positions   as projection on db.Positions;
}
