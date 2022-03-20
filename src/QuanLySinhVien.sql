create database QuanLySinhVien;
use QuanLySinhVien;

create table Class(
    cID int not null auto_increment primary key ,
    cName varchar(60) not null ,
    startDate datetime not null ,
    status bit
);

create table Students(
    sID int not null auto_increment primary key ,
    sName varchar(30) not null ,
    address varchar(50),
    phone varchar(20),
    status bit,
    cID int not null
);

create table Subject(
    subID int not null auto_increment primary key ,
    subName varchar(30) not null ,
    credit tinyint not null default 1 check (credit>=1),
    status bit default 1
);

create table Mark(
    mID int not null auto_increment primary key ,
    subID int not null unique key ,
    sID int not null unique key ,
    mark float default 0 check ( mark between 0 and 100),
    examTimes tinyint default 1,
    unique (sID,subID),
    foreign key (sID) references Students(sID),
    foreign key (subID) references Subject(subID)
);
drop table Mark;
insert into Class values (1,'A1','2008-12-20',1);
insert into Class values (2,'A2','2008-12-22',1);
insert into Class values (3,'B3',current_date,0);

insert into Students(sName, address, phone, status, cID) values ('Hung','HN','0912113113',1,1);
insert into Students(sName, address, phone, status, cID) values ('Hoa','Hai Phong',null,1,1);
insert into Students(sName, address, phone, status, cID) values ('Manh','HCM','0123123123',0,2);


insert into Subject values (1,'CF',5,1);
insert into Subject values (2,'C',6,1);
insert into Subject values (3,'HDJ',5,1);
insert into Subject values (4,'RDBMS',10,1);

insert into Mark(subid, sid, mark, examtimes) values (1,1,8,1);
insert into Mark(subid, sid, mark, examtimes) values (1,2,10,2);
insert into Mark(subid, sid, mark, examtimes) values (2,1,12,1);


select * from Students;

select * from Students
where status=true;

select * from Subject
where credit<10;

SELECT S.sID, S.sName, C.cName
FROM Student S join Class C on S.cID = C.cID;

SELECT S.sID, S.sID, C.cName
FROM Student S join Class C on S.cID = C.cID
WHERE C.cName = 'A1';

SELECT S.sID, S.sName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.sID = M.sID join Subject Sub on M.SubId = Sub.SubId;

SELECT S.sID, S.sName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.sID = M.sID join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';