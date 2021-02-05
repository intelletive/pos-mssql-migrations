
if not exists (select * from sysobjects where name='schema_migration' and xtype='U')

create table schema_migration(
  filename varchar(256) primary key,
  date_ran DATETIME DEFAULT CURRENT_TIMESTAMP
)

go
