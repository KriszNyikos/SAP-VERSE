using {galactic.adventure as db} from '../db/schema';

service GalacticService {
    entity SpaceFarers as projection on db.SpaceFarers;

    @readonly
    entity Planets     as projection on db.Planets;

    @readonly
    entity Departments as projection on db.Departments;

    @readonly
    entity Positions   as projection on db.Positions;
}
