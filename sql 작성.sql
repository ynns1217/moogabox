
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

create table Movie						--��ȭ ���̺�
(
MvName nvarchar(20) Not null,  --��ȭ�̸�
Hall Int,								--�󿵰�( �� �ϳ��� �ϳ��� ��ȭ�� ��)
StartTime time,							--��ȭ ���� �ð�
RunningTime time							--��ȭ ���� �ð�
)

create table Theater					--�󿵰� ���̺�
(
ThNum int Not null,			--�󿵰� ��ȣ
SeatNum varchar(10),					--�󿵰� �¼� ��ȣ
Eempty int								--�󿵰� �¼� ���ſ��� 
)

create table Member				--ȸ�����̺�
(
ID varchar(10) Not null,
PW varchar(20),
Who int							--���������� �մ����� ����
)

create table Reservation						--���� ���̺�
(
ID varchar(10) ,
RsvCode varchar(10) Not null ,		--���Ź�ȣ (�����ʹ� ���������� )
MvName nvarchar(20),				--���� ��ȭ �̸�
Hall int,							--���� ��ȭ �󿵰�
SeatNum varchar(10),				--���� �¼� ��ȣ
StartTime time,						--��ȭ ���� �ð�
RunningTime time,					--��ȭ ���� �ð�
Ccount int,							--���� ��� ��
Mmoney int							--��  ���� �ݾ�
)

create table Member            
(
ID varchar(10) Not null Primary Key,
PW varchar(20),
Phone varchar(20),
Who int                     
)

create table TmpReservation			--���� �ӽ� ���̺�
(
ID varchar(10) ,
RsvCode varchar(10) Not null,		--���Ź�ȣ (�����ʹ� ���������� )
MvName nvarchar(20),				--���� ��ȭ �̸�
Hall int,							--���� ��ȭ �󿵰�
SeatNum varchar(10),				--���� �¼� ��ȣ
StartTime time,						--��ȭ ���� �ð�
RunningTime time,					--��ȭ ���� �ð�
Ccount int,							--���� ��� ��
Mmoney int							--��  ���� �ݾ�
)

create table Snack							--���� ���̺�
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,  --���� ī��� ū�� = P01L / ���� ����Ѹ� �߰� = P02M 
SnackPrice int
)

drop table BuySnack;
create table BuySnack						--�������� ������ ���� ���̺�
(
ID varchar(10)  ,
SnackName nvarchar(10),
SnackNum varchar(10) Not null,
SnackSize int,
BuyPrice int,
BuyCount int
Constraint tb_BuySnack_group_PK primary Key(ID, SnackNum)
)

create table Jaego						--������̺�
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Maejum						-- �������̺�
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Balju						-- �������̺�
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

create table Edong						-- �̵����̺�
(
SnackName nvarchar(10),
SnackNum varchar(10) Not null Primary Key,
SnackCount int
)

drop table TmpBuySnack
create table TmpBuySnack                  --�������� ����  �ӽ� ���̺�
(
ID varchar(10)  ,
SnackName nvarchar(10),
SnackNum varchar(10) Not null,
BuyPrice int,
BuyCount int
Constraint tb_TmpBuySnack_group_PK primary Key(ID, SnackNum)
)

INSERT INTO Movie
values ('���� ��Ʈ������', 1, '10:10:00', '02:06:00'),
('���� ��Ʈ������', 1, '12:45:00', '02:06:00'),
 ('���� ��Ʈ������', 1, '15:20:00', '02:06:00'),
('���� ��Ʈ������', 1, '17:55:00', '02:06:00'),
 ('���� ��Ʈ������', 1, '20:30:00', '02:06:00')
, ('���� ��Ʈ������', 1, '23:05:00', '02:06:00')

Select * from Movie


INSERT INTO Movie
values ('���˵���2', 2, '10:30', '01:46:00'),
('���˵���2', 2, '12:15', '01:46:00'),
('���˵���2', 2, '14:30', '01:46:00'),
('���˵���2', 2, '16:45', '01:46:00'),
('���˵���2', 2, '19:00', '01:46:00'),
('���˵���2', 2, '21:15', '01:46:00'),
('���˵���2', 2, '23:30', '01:46:00'
)
INSERT INTO Movie
values
('���� ����: ���̴Ͼ�', 3, '09:40', '02:27:00'),
('���� ����: ���̴Ͼ�', 3, '13:00', '02:27:00'),
('���� ����: ���̴Ͼ�', 3, '15:20', '02:27:00'),
('���� ����: ���̴Ͼ�', 3, '17:40', '02:27:00'),
('���� ����: ���̴Ͼ�', 3, '20:00', '02:27:00'),
('���� ����: ���̴Ͼ�', 3, '22:20', '02:27:00')

INSERT INTO Snack
values
('�������(M)', 'P01M', 4000),
('�������(L)', 'P01L', 5000),
('��������(M)', 'P02M', 5000),
('��������(L)', 'P02L', 6000),
('����ġ������(M)', 'P03M', 5500),
('����ġ������(L)', 'P03L', 6000),
('������Ͼ�����(M)', 'P04M', 5500),
('������Ͼ�����(L)', 'P04L', 6000)

INSERT INTO Snack
values
('��ī�ݶ�(M)', 'D01M', 2500),
('��ī�ݶ�(L)', 'D01L', 3000),
('��������Ʈ(M)', 'D02M', 2500),
('��������Ʈ(L)', 'D02L', 3000),
('ȯŸ������(M)', 'D03M', 2500),
('ȯŸ������(L)', 'D03L', 3000),
('ȯŸ���ξ���(M)', 'D04M', 2500),
('ȯŸ���ξ���(L)', 'D04L', 3000),

('�����޺�', 'C01M', 9000),--����(L)1+ź������(M)2)
('�����޺�', 'C02D', 12000),  --  ��(M)2+ź������(M)2
('�����޺�', 'C04S', 6500) --����(M)1+ź������(M)1


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
('ghldnjs1', 'qwe123', 0), --�����ڸ� 1, �մ��̸� 0
('ghldnjs2', 'q1q2q3', 0),
('ghldnjs3', 'abc123', 0)

--��� ���� �����ʹ� ȸ���ϰ� �����Կ�--

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
-- UPDATE Movie Set MvNum = 'DR03' WHERE StartTime = '15:20:00' and MvName ='���� ��Ʈ������'
-- 
-- UPDATE Movie Set MvNum = 'JW01' WHERE StartTime = '09:40:00';
-- UPDATE Movie Set MvNum = 'JW02' WHERE StartTime = '13:00:00';
-- UPDATE Movie Set MvNum = 'JW03' WHERE StartTime = '15:20:00' and MvName ='���� ����:���̴Ͼ�'
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
insert into TmpBuySnack values('ID1','��ī�ݶ�(M)','D01M',5,10)
insert into TmpBuySnack values('ID1','��ī�ݶ�(L)','D01L',500,50)


INSERT INTO Maejum
values
('��ī�ݶ�(M)', 'D01M', 500),
('��ī�ݶ�(L)', 'D01L', 500),
('��������Ʈ(M)', 'D02M', 500),
('��������Ʈ(L)', 'D02L', 500),
('ȯŸ������(M)', 'D03M', 500),
('ȯŸ������(L)', 'D03L', 500),
('ȯŸ���ξ���(M)', 'D04M', 500),
('ȯŸ���ξ���(L)', 'D04L', 500)

INSERT INTO Maejum
values
('�������(M)', 'P01M', 500),
('�������(L)', 'P01L', 500),
('��������(M)', 'P02M', 500),
('��������(L)', 'P02L', 500),
('����ġ������(M)', 'P03M', 500),
('����ġ������(L)', 'P03L', 500),
('������Ͼ�����(M)', 'P04M', 500),
('������Ͼ�����(L)', 'P04L', 500)

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

