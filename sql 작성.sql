
-- drop table Movie;
-- drop table Theater;
-- drop table Member;
-- drop table Reservation;
-- drop table Snack;
-- drop table BuySnack;
-- drop table Jaego;
-- drop table Maejum;
-- drop table Balju;
-- drop table Edong;
-- drop table TmpReservation;

create table Movie						--영화 테이블
(
MvName nvarchar(20) Not null,  --영화이름
Hall Int,								--상영관( 관 하나에 하나의 영화만 상영)
StartTime time,							--영화 시작 시간
RunningTime time							--영화 러닝 시간
)

create table Theater					--상영관 테이블
(
ThNum int Not null,			--상영관 번호
SeatNum varchar(10),					--상영관 좌석 번호
Eempty int								--상영관 좌석 예매여부 
)

create table Member				--회원테이블
(
ID varchar(10) Not null,
PW varchar(20),
Who int							--관리자인지 손님인지 구분
)

create table Reservation						--예매 테이블
(
ID varchar(10) ,
RsvCode varchar(10) Not null ,		--예매번호 (데이터는 랜덤값으로 )
MvName nvarchar(20),				--예매 영화 이름
Hall int,							--예매 영화 상영관
SeatNum varchar(10),				--예매 좌석 번호
StartTime time,						--영화 시작 시간
RunningTime time,					--영화 러닝 시간
Ccount int,							--예매 사람 수
Mmoney int							--총  구매 금액
)

create table Member            
(
ID varchar(10) Not null Primary Key,
PW varchar(20),
Phone varchar(20),
Who int                     
)

create table TmpReservation			--예매 임시 테이블
(
ID varchar(10) ,
RsvCode varchar(10) Not null,		--예매번호 (데이터는 랜덤값으로 )
MvName nvarchar(20),				--예매 영화 이름
Hall int,							--예매 영화 상영관
SeatNum varchar(10),				--예매 좌석 번호
StartTime time,						--영화 시작 시간
RunningTime time,					--영화 러닝 시간
Ccount int,							--예매 사람 수
Mmoney int							--총  구매 금액
)

create table Snack							--스낵 테이블
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,  --팝콘 카라멜 큰거 = P01L / 팝콘 고소한맛 중간 = P02M 
SnackPrice int
)

drop table BuySnack;
create table BuySnack						--매점에서 구매한 스낵 테이블
(
ID varchar(10)  ,
SnackName nvarchar(10),
SnackNum varchar(10) Not null,
SnackSize int,
BuyPrice int,
BuyCount int
Constraint tb_BuySnack_group_PK primary Key(ID, SnackNum)
)

create table Jaego						--재고테이블
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Maejum						-- 매점테이블
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Balju						-- 발주테이블
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Edong						-- 이동테이블
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

drop table TmpBuySnack
create table TmpBuySnack                  --매점에서 구매  임시 테이블
(
ID varchar(10)  ,
SnackName nvarchar(10),
SnackNum varchar(10) Not null,
BuyPrice int,
BuyCount int
Constraint tb_TmpBuySnack_group_PK primary Key(ID, SnackNum)
)

INSERT INTO Movie
values ('닥터 스트레인지', 1, '10:10:00', '02:06:00'),
('닥터 스트레인지', 1, '12:45:00', '02:06:00'),
 ('닥터 스트레인지', 1, '15:20:00', '02:06:00'),
('닥터 스트레인지', 1, '17:55:00', '02:06:00'),
 ('닥터 스트레인지', 1, '20:30:00', '02:06:00')
, ('닥터 스트레인지', 1, '23:05:00', '02:06:00')

Select * from Movie


INSERT INTO Movie
values ('범죄도시2', 2, '10:30', '01:46:00'),
('범죄도시2', 2, '12:15', '01:46:00'),
('범죄도시2', 2, '14:30', '01:46:00'),
('범죄도시2', 2, '16:45', '01:46:00'),
('범죄도시2', 2, '19:00', '01:46:00'),
('범죄도시2', 2, '21:15', '01:46:00'),
('범죄도시2', 2, '23:30', '01:46:00'
)
INSERT INTO Movie
values
('쥬라기 월드: 도미니언', 3, '09:40', '02:27:00'),
('쥬라기 월드: 도미니언', 3, '13:00', '02:27:00'),
('쥬라기 월드: 도미니언', 3, '15:20', '02:27:00'),
('쥬라기 월드: 도미니언', 3, '17:40', '02:27:00'),
('쥬라기 월드: 도미니언', 3, '20:00', '02:27:00'),
('쥬라기 월드: 도미니언', 3, '22:20', '02:27:00')

INSERT INTO Snack
values
('고소팝콘(M)', 'P01M', 4000),
('고소팝콘(L)', 'P01L', 5000),
('달콤팝콘(M)', 'P02M', 5000),
('달콤팝콘(L)', 'P02L', 6000),
('더블치즈팝콘(M)', 'P03M', 5500),
('더블치즈팝콘(L)', 'P03L', 6000),
('바질어니언팝콘(M)', 'P04M', 5500),
('바질어니언팝콘(L)', 'P04L', 6000)

INSERT INTO Snack
values
('코카콜라(M)', 'D01M', 2500),
('코카콜라(L)', 'D01L', 3000),
('스프라이트(M)', 'D02M', 2500),
('스프라이트(L)', 'D02L', 3000),
('환타오렌지(M)', 'D03M', 2500),
('환타오렌지(L)', 'D03L', 3000),
('환타파인애플(M)', 'D04M', 2500),
('환타파인애플(L)', 'D04L', 3000),

('무성콤보', 'C01M', 9000),--팝콘(L)1+탄산음료(M)2)
('더블콤보', 'C02D', 12000),  --  콘(M)2+탄산음료(M)2
('스몰콤보', 'C04S', 6500) --팝콘(M)1+탄산음료(M)1


INSERT INTO Theater
values
(1, 'A01', 0),
(1, 'A02', 0),
(1, 'A03', 0),
(1, 'A04', 0),
(1, 'A05', 0),
(1, 'B01', 0),
(1, 'B02', 0),
(1, 'B03', 0),
(1, 'B04', 0),
(1, 'B05', 0),
(1, 'C01', 0),
(1, 'C02', 0),
(1, 'C03', 0),
(1, 'C04', 0),
(1, 'C05', 0),
(1, 'D01', 0),
(1, 'D02', 0),
(1, 'D03', 0),
(1, 'D04', 0),
(1, 'D05', 0),

(2, 'A01', 0),
(2, 'A02', 0),
(2, 'A03', 0),
(2, 'A04', 0),
(2, 'A05', 0),
(2, 'B01', 0),
(2, 'B02', 0),
(2, 'B03', 0),
(2, 'B04', 0),
(2, 'B05', 0),
(2, 'C01', 0),
(2, 'C02', 0),
(2, 'C03', 0),
(2, 'C04', 0),
(2, 'C05', 0),
(2, 'D01', 0),
(2, 'D02', 0),
(2, 'D03', 0),
(2, 'D04', 0),
(2, 'D05', 0),

(3, 'A01', 0),
(3, 'A02', 0),
(3, 'A03', 0),
(3, 'A04', 0),
(3, 'A05', 0),
(3, 'B01', 0),
(3, 'B02', 0),
(3, 'B03', 0),
(3, 'B04', 0),
(3, 'B05', 0),
(3, 'C01', 0),
(3, 'C02', 0),
(3, 'C03', 0),
(3, 'C04', 0),
(3, 'C05', 0),
(3, 'D01', 0),
(3, 'D02', 0),
(3, 'D03', 0),
(3, 'D04', 0),
(3, 'D05', 0)

INSERT INTO Member
values
('rhksflwk', '0000', 1),
('ghldnjs1', 'qwe123', 0), --관리자면 1, 손님이면 0
('ghldnjs2', 'q1q2q3', 0),
('ghldnjs3', 'abc123', 0)

--재고 샘플 데이터는 회의하고 넣을게요--

-- alter table Movie add MvNum varchar(10)
-- 
-- UPDATE Movie Set MvNum = 'DR01' WHERE StartTime = '10:10:00';
-- UPDATE Movie Set MvNum = 'DR02' WHERE StartTime = '12:45:00';
-- UPDATE Movie Set MvNum = 'DR03' WHERE StartTime = '15:20:00';
-- UPDATE Movie Set MvNum = 'DR04' WHERE StartTime = '17:55:00';
-- UPDATE Movie Set MvNum = 'DR05' WHERE StartTime = '20:30:00';
-- UPDATE Movie Set MvNum = 'DR06' WHERE StartTime = '23:05:00';
-- 
-- UPDATE Movie Set MvNum = 'CC01' WHERE StartTime = '10:30:00';
-- UPDATE Movie Set MvNum = 'CC02' WHERE StartTime = '12:15:00';
-- UPDATE Movie Set MvNum = 'CC03' WHERE StartTime = '14:30:00';
-- UPDATE Movie Set MvNum = 'CC04' WHERE StartTime = '16:45:00';
-- UPDATE Movie Set MvNum = 'CC05' WHERE StartTime = '19:00:00';
-- UPDATE Movie Set MvNum = 'CC06' WHERE StartTime = '21:15:00';
-- UPDATE Movie Set MvNum = 'CC07' WHERE StartTime = '23:30:00';
-- UPDATE Movie Set MvNum = 'DR03' WHERE StartTime = '15:20:00' and MvName ='닥터 스트레인지'
-- 
-- UPDATE Movie Set MvNum = 'JW01' WHERE StartTime = '09:40:00';
-- UPDATE Movie Set MvNum = 'JW02' WHERE StartTime = '13:00:00';
-- UPDATE Movie Set MvNum = 'JW03' WHERE StartTime = '15:20:00' and MvName ='쥬라기 월드:도미니언'
-- UPDATE Movie Set MvNum = 'JW04' WHERE StartTime = '17:40:00';
-- UPDATE Movie Set MvNum = 'JW05' WHERE StartTime = '20:00:00';
-- UPDATE Movie Set MvNum = 'JW06' WHERE StartTime = '22:20:00';


delete from Reservation
delete from TmpReservation
delete from BuySnack
delete from TmpBuySnack;
go

alter table TmpReservation drop column RsvCode;

insert into TmpReservation values('ID1','RsvCode','MvName',1,'A1A2A3A4','09:40','02:27:00',4,4000)
insert into Reservation values('ID','RsvCode','MvName',1,'SeatNum','09:40','02:27:00',1,1000)
insert into TmpBuySnack values('ID1','코카콜라(M)','D01M',5,10)
insert into TmpBuySnack values('ID1','코카콜라(L)','D01L',500,50)


INSERT INTO Maejum
values
('코카콜라(M)', 'D01M', 500),
('코카콜라(L)', 'D01L', 500),
('스프라이트(M)', 'D02M', 500),
('스프라이트(L)', 'D02L', 500),
('환타오렌지(M)', 'D03M', 500),
('환타오렌지(L)', 'D03L', 500),
('환타파인애플(M)', 'D04M', 500),
('환타파인애플(L)', 'D04L', 500)

INSERT INTO Maejum
values
('고소팝콘(M)', 'P01M', 500),
('고소팝콘(L)', 'P01L', 500),
('달콤팝콘(M)', 'P02M', 500),
('달콤팝콘(L)', 'P02L', 500),
('더블치즈팝콘(M)', 'P03M', 500),
('더블치즈팝콘(L)', 'P03L', 500),
('바질어니언팝콘(M)', 'P04M', 500),
('바질어니언팝콘(L)', 'P04L', 500)

select * from TmpBuySnack;
select * from BuySnack;
select * from TmpReservation;
select * from Reservation;


select * from Maejum;

alter table BuySnack add SnackPrice int;
alter table TmpBuySnack add SnackPrice int;

select * from Maejum

create table Check_Connet
(
can_you_See_this int
);

insert into Check_Connet values(1);
select * from Check_Connet;

