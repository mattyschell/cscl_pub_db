drop index A527_IX1;
delete from 
    user_sdo_geom_metadata 
where 
    table_name = 'ADDRESSPOINT';
INSERT INTO user_sdo_geom_metadata (
    table_name
   ,column_name
   ,diminfo
   ,srid)
VALUES (
    'ADDRESSPOINT',
    'SHAPE',
    SDO_DIM_ARRAY(
        SDO_DIM_ELEMENT('X', 900000, 1090000, 0.0005),
        SDO_DIM_ELEMENT('Y', 110000, 295000, 0.0005)
    ),
    2263
);
update 
    ADDRESSPOINT a 
set 
    a.shape.sdo_srid = 2263;
commit;
CREATE INDEX 
    A527_IX1
ON 
    ADDRESSPOINT (shape)
INDEXTYPE IS MDSYS.SPATIAL_INDEX;