--******************
-- 2017.09.04      *
-- [1]SUBJECT_TAB  *
-- [2]MEMBER_TAB   *
-- [3]MAJOR_TAB    *
-- [4]PROF_TAB     *
-- [5]STUDENT_TAB  *
-- [6]GRADE_TAB    *
-- [7]BOARD_TAB    *
--******************

--****************
-- [1]SUBJECT_TAB
-- 2017.09.04
-- subj_id,title,major_id
--****************
CREATE TABLE 
  Subject
  (
    subj_id VARCHAR(10),
    title   VARCHAR(10),
    PRIMARY KEY(subj_id)    
);
INSERT INTO Subject(subj_id,title)VALUES('HTML','html');
INSERT INTO Subject(subj_id,title)VALUES('JAVA','자바');
INSERT INTO Subject(subj_id,title)VALUES('JC','자바스크립트');
INSERT INTO Subject(subj_id,title)VALUES('C++','C++');
INSERT INTO Subject(subj_id,title)VALUES('ORACLE','오라클');
INSERT INTO Subject(subj_id,title)VALUES('CSS','CSS');
INSERT INTO Subject(subj_id,title)VALUES('JSP','JSP');

UPDATE Subject SET subj_id='sql', title='sql' WHERE subj_id='mysql';

--****************
-- [2]MEMBER_TAB
-- 2017.09.04
-- id,pw,name,ssn,regdate,phone,email,major_id,profile,
--****************
CREATE TABLE 
  Member
  (
  	member_id VARCHAR(10), 
  	name      VARCHAR(20),
  	pass      VARCHAR(10), 
  	ssn       VARCHAR(15),
  	regdate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    phone     VARCHAR(20),
    email     VARCHAR(20),
    profile   VARCHAR(20),
  	PRIMARY KEY(member_id)
);

INSERT INTO 
    Member 
    (
    member_id,name,pass,ssn,regdate,phone,email,profile
    )
VALUES
    (
    'kim2','김경수','1','930812-1056548',NOW(),'010-8824-5788','kim2@naver.com','kim2.jpg'
);

--****************
-- [3]MAJOR_TAB
-- 2017.09.04
-- major_id,title
--****************
CREATE TABLE Major(
    major_id VARCHAR(10),
    title    VARCHAR(10),
    PRIMARY KEY(major_id)
);
INSERT INTO major(major_id,title)VALUES('hong','c');

--****************
-- [6]GRADE_TAB
-- 2017.09.04
-- grade_seq,score,exam_date,subj_id
--****************
CREATE TABLE Grade(
  grade_seq VARCHAR(10),
  score     VARCHAR(10),
  exam_date VARCHAR(10),
  subj_id   VARCHAR(10),
  primary key(grade_seq)
);
INSERT INTO grade(grade_seq,score,exam_date,subj_id,member_id)
VALUES(seq.nextval,'90','2017-03','java','kim');
INSERT INTO grade(grade_seq,score,exam_date,subj_id,member_id)
VALUES(seq.nextval,'80','2017-04','java','park');
INSERT INTO grade(grade_seq,score,exam_date,subj_id,member_id)
VALUES(seq.nextval,'70','2017-05','java','yang');


--****************
-- [7]BOARD_TAB
-- 2017.09.04
-- id,title,content,hitcount,regdate
--****************
CREATE TABLE Board(
	id VARCHAR(10),
	title VARCHAR(20),
	content VARCHAR(100),
	hitcount int,
	regdate	DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(article_seq)
);
INSERT INTO Board(id,title,content,hitcount,regdate)values('park','수소탄 核폭주','정은 북한 노동당 위원장이 ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('song','수소탄 核폭주1','3일 역대 최대 규모의 제6차 핵실험을 ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('yang','수소탄 核폭주2','전격 감행하면서 국제사회에서 핵보유국 지위를 ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('hong','수소탄 核폭주3','인정받기 위한 핵도박에 나섰다.',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('lee','제네시스 G70','제네시스 G70주행 성능이 좋다',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('kim','제일병원','경영난 이유 알아보니...',0,NOW());

INSERT INTO Board(id,title,content,hitcount,regdate)values('park','고급차','날렵하면서도 고급스러운 느낌을 보여줬다. ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('song','파급효과','전후방 생태계에 미치는 긍정적인 파급효과 등 성장 가능성이 높다"고 말했다.  ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('yang','생산성','우리나라에서 생산 가능한 업체는 당사가 유일하다 ',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('hong','솔레노이드','주력 제품 솔레노이드 밸브는 국내 시장',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('lee','살기좋은곳0','우리가 흔히 나이가 들면 공기 좋은 곳에서 편하게 살고 싶다고 말들을 하곤 한다.',0,NOW());
INSERT INTO Board(id,title,content,hitcount,regdate)values('kim','더블루힐','옥상에는 작은 수영장과 바비큐 데크가 있는 럭셔리한 유럽식 연벽식 건물이 내 소유다.',0,NOW());

--****************
-- [4]PROF_TAB
-- 2017.09.04
-- id, salary
--****************
CREATE TABLE Prof(
id varchar(10),
salary varchar(10),
primary key(id)
);
INSERT INTO prof(id,salary)VALUES('and','15000');


--****************
-- [5]STUDENT_TAB
-- 2017.08.02
-- id,stu_no
--****************
CREATE VIEW Student 
  (
  id,name,ssn,
  regdate,phone,email,
  pass,subjects
  )
AS
(
  SELECT 
      a.member_id id, 
      a.name,
      RPAD(SUBSTRING(a.ssn,1,8),14,'*') ssn,
      DATE_FORMAT(a.regdate,'%Y-%m-%d') regidate, 
      a.phone phone,
      a.email email,
      a.pass pass,
      GROUP_CONCAT(s.title, ',') Subjects
    FROM Member a 
      LEFT JOIN Major m 
        ON a.member_id LIKE m.major_id 
      LEFT JOIN Subject s 
        ON m.major_id LIKE s.subj_id
      GROUP BY 
        a.member_id, a.name, a.ssn,
        a.regdate, a.phone, a.email 
      ORDER BY regdate
);

SELECT *
FROM
    Member a
    left join major m 
        on a.member_id like m.major_id
    left join subject s 
        on m.major_id like s.subj_id
    group by a.member_id, a.name, a.ssn, 
    a.regdate, a.phone, a.email
    order by regdate;

CREATE VIEW Student (no,id,pw,name,ssn,regdate,phone,email,title)
AS
SELECT ROWNUM no,s.* FROM(
SELECT m.id, pw,name,rpad(substr(ssn,1,6),14,'*') ssn,to_char(regdate,'YYYY-MM-DD') 
regdate,phone,email,nvl(listagg(s.title,',')within GROUP(order by s.title),'誘몄젙') title 
FROM member m left join major j on m.ID = j.ID left join subject s on s.SUBJ_ID = j.SUBJ_ID
GROUP BY m.id, pw, name, ssn ,regdate, phone, email 
ORDER BY regdate) s;

SELECT *
FROM
    member a
    left join major m 
        on a.member_id like m.member_id
    left join subject s 
        on m.subj_id like s.subj_id
    group by a.member_id, a.name, a.ssn, 
    a.regdate, a.phone, a.email
    order by regdate;