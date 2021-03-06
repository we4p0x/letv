--学生表
CREATE TABLE students(
  sid INT,
  sname VARCHAR2(10),
  sage int,
  ssex CHAR(5)
);


--学生表数据
 INSERT INTO students VALUES(1,'刘一',18,'男' );
 INSERT INTO students VALUES(2,'钱二',19,'女');
 INSERT INTO students VALUES(3,'张三',17,'男');
 INSERT INTO students VALUES(4,'李四',18,'女');
 INSERT INTO students VALUES(5,'王五',17,'男' );
 INSERT INTO students VALUES(6,'赵六',19,'女' );


--课程表
CREATE TABLE course(
  cid INT,
  cname VARCHAR2(10),
  tid INT
);

--课程表数据

INSERT INTO course VALUES(1,'语文',1);
INSERT INTO course VALUES( 2,'数学',2 );
INSERT INTO course VALUES(3,'英语',3 );
INSERT INTO course VALUES(4,'物理',4);


--成绩表
CREATE TABLE t_score(
  sid INT,
  cid INT,
  score INT
);
--成绩表数据
INSERT INTO t_score VALUES(1,1,56);
INSERT INTO t_score VALUES(1,2,78);
INSERT INTO t_score VALUES(1,3,67);
INSERT INTO t_score VALUES(1,4,58);
INSERT INTO t_score VALUES(2,1,79);
INSERT INTO t_score VALUES(2,2,81);
INSERT INTO t_score VALUES(2,3,92);
INSERT INTO t_score VALUES(2,4,68);
INSERT INTO t_score VALUES(3,1,91);
INSERT INTO t_score VALUES(3,2,47);
INSERT INTO t_score VALUES(3,3,88);
INSERT INTO t_score VALUES(3,4,56);
INSERT INTO t_score VALUES(4,1,78);
INSERT INTO t_score VALUES(4,2,88);
INSERT INTO t_score VALUES(4,3,92);
INSERT INTO t_score VALUES(4,4,93);
INSERT INTO t_score VALUES(5,1,46);
INSERT INTO t_score VALUES(5,2,66);
INSERT INTO t_score VALUES(5,4,53);
INSERT INTO t_score VALUES(6,1,35);
INSERT INTO t_score VALUES(6,3,68);



--教师表
CREATE TABLE teacher(
  tid INT,
  tname VARCHAR2(10)
);
--教师表数据
INSERT INTO teacher VALUES(1,'叶平');
INSERT INTO teacher VALUES(2,'贺高');
INSERT INTO teacher VALUES(3,'杨艳');
INSERT INTO teacher VALUES(4,'周磊');
SELECT *FROM students
SELECT *FROM course
SELECT *FROM t_score
SELECT *FROM teacher

1、查询“1”课程比“2”课程成绩高的所有学生的学号；
CREATE VIEW V_T_SCORE_1
AS
SELECT *
FROM T_SCORE
WHERE CID=1

CREATE VIEW V_T_SCORE_2
AS
SELECT *
FROM T_SCORE
WHERE CID=2

SELECT S1.SID
FROM V_T_SCORE_1 S1,V_T_SCORE_2 S2
WHERE S1.SID=S2.SID
AND S1.SCORE>S2.SCORE


2、查询平均成绩大于60分的同学的学号和平均成绩； 
SELECT AVG(SCORE)，SID
FROM T_SCORE
GROUP BY SID
HAVING AVG(SCORE)>60



3、查询所有同学的学号、姓名、选课数、总成绩； 
SELECT STU.SID,STU.SNAME,COUNT(TS.CID),SUM(TS.SCORE)
FROM T_SCORE TS,students STU
WHERE TS.SID=STU.SID
GROUP BY STU.SID,STU.SNAME  
ORDER BY STU.SID
4、查询姓“李”的老师的个数；
SELECT COUNT(*)
FROM teacher
WHERE SUBSTR (TNAME,0，1)='李'


5、查询没学过“叶平”老师课的同学的学号、姓名； 

6、查询学过“1”并且也学过编号“2”课程的同学的学号、姓名；

7、查询学过“叶平”老师所教的所有课的同学的学号、姓名； 

8、查询课程编号“2”的成绩比课程编号“1”课程低的所有同学的学号、姓名； 

9、查询所有课程成绩小于60分的同学的学号、姓名； 

10、查询没有学全所有课的同学的学号、姓名；

11、查询至少有一门课与学号为“1”的同学所学相同的同学的学号和姓名；

12、查询至少学过学号为“1”同学所有一门课的其他同学学号和姓名

13、把“t_score”表中“叶平”老师教的课的成绩都更改为此课程的平均成绩；

14、查询和“2”号的同学学习的课程完全相同的其他同学学号和姓名；

15、删除学习“叶平”老师课的t_score表记录

16、向t_score表中插入一些记录，这些记录要求符合以下条件：没有上过编号“3”课程的同学学号、2、 
    号课的平均成绩；

17、按平均成绩从高到低显示所有学生的“数学”、“物理”、“英语”三门的课程成绩，按如下形式显示： 学生ID,,数据库,企业管理,英语,有效课程数,有效平均分 

18、查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分 
19、按各科平均成绩从低到高和及格率的百分数从高到低顺序 

20、查询如下课程平均成绩和及格率的百分数(用"1行"显示): 语文（1），数学（2），英语（3），物理（4） 



21、查询不同老师所教不同课程平均分从高到低显示 

22、查询如下课程成绩第 3 名到第 6 名的学生成绩单：语文（1），数学（2），英语（3），物理（4） 

23、统计列印各科成绩,各分数段人数:课程ID,课程名称,[100-85],[85-70],[70-60],[ <60] 

24、查询学生平均成绩及其名次 

25、查询各科成绩前三名的记录:(不考虑成绩并列情况) 

26、查询每门课程被选修的学生数 

27、查询出只选修了一门课程的全部学生的学号和姓名 

28、查询男生、女生人数 

29、查询姓“张”的学生名单 

30、查询同名同性学生名单，并统计同名人数
