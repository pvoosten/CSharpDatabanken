BEGIN TRANSACTION





CREATE TABLE Foo(
 Bar int
)


DROP TABLE Foo


ROLLBACK TRANSACTION
-- ROLLBACK kan zelfs CREATE of DROP
-- statements terugdraaien
