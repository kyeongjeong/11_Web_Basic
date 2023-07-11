USE DML_TEST;

CREATE TABLE MEMBER_TB(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NM 		VARCHAR(50),
	SEX 			VARCHAR(10),
	NATIONALITY 	VARCHAR(20),
	EMAIL 			VARCHAR(20),
    RESIDENCE		VARCHAR(20)
);

INSERT INTO MEMBER_TB VALUES('USER1', '메르켈' , 'F' , '외국' , 'MER@GMAIL.COM'  , '서울');
INSERT INTO MEMBER_TB VALUES('USER2', '제임스고슬링' , 'M' , '외국' , 'JAMES@GMAIL.COM' , '서울'); 
INSERT INTO MEMBER_TB VALUES('USER3', '신사임당' , 'F' , '내국' , 'SHINSA@NAVER.COM' , '경기');
INSERT INTO MEMBER_TB VALUES('USER4', '유관순' , 'F' , '내국' , 'YKS@NAVER.COM' , '인천');
INSERT INTO MEMBER_TB VALUES('USER5', '데니스리치' , 'M' , '외국' , 'DENIS@GMAIL.COM' , '부산');
INSERT INTO MEMBER_TB VALUES('USER6', '팀버너스리' , 'M' , '외국' , 'TIM@GMAIL.COM' , '대구');
INSERT INTO MEMBER_TB VALUES('USER7', '스티븐워즈니악' , 'M' , '외국' , 'STEVENW@GMAIL.COM' , '경기');
INSERT INTO MEMBER_TB VALUES('USER8', '선덕여왕' , 'F' , '내국' , 'SEONDUK@DAUM.NET' , '대구');
INSERT INTO MEMBER_TB VALUES('USER9', '스티브잡스' , 'M' , '외국' , 'JOBS@GMAIL.COM' , '부산');
INSERT INTO MEMBER_TB VALUES('USER10', '빌게이츠' , 'M' , '외국' , 'BILL@GMAIL.COM' , '서울');
INSERT INTO MEMBER_TB VALUES('USER11', '세종대왕' , 'M' , '내국' , 'SEOJONG@NAVER.COM' , '서울');
INSERT INTO MEMBER_TB VALUES('USER12', '이순신' , 'M' , '내국' , 'LEESS@DAUM.NET' , '부산');


# 1) '내국'인의 회원 수를 조회하기
SELECT COUNT(NATIONALITY) FROM MEMBER_TB WHERE NATIONALITY='내국';		
         
# 2) '서울' 지역의 회원 수를 조회하기        
SELECT COUNT(*) FROM MEMBER_TB WHERE RESIDENCE='서울';	
        
# 3) '부산' , '대구'에 거주하는 회원 수를 조회하기 
SELECT COUNT(*) FROM MEMBER_TB WHERE RESIDENCE IN ('부산' , '대구');	

# 4) 성별로 회원의 수를 조회하기
SELECT SEX, COUNT(*) FROM MEMBER_TB GROUP BY SEX;	
        
# 5) 거주지역별로 회원 수를 조회하기
SELECT RESIDENCE, COUNT(*) FROM MEMBER_TB GROUP BY RESIDENCE;	        
        
# 6) 국적별로 회원 수를 조회하기
SELECT NATIONALITY, COUNT(*) FROM MEMBER_TB GROUP BY NATIONALITY;	
        
# 7) 국적별로 성별로 회원 수를 조회하기
SELECT NATIONALITY, SEX, COUNT(*) FROM MEMBER_TB GROUP BY NATIONALITY, SEX;	

# 8) 거주지역별로 성별로 회원 수를 조회하기
SELECT RESIDENCE, SEX, COUNT(*) FROM MEMBER_TB GROUP BY RESIDENCE, SEX;	

# 9) 성별로 거주지역별로 회원 수를 조회하기
SELECT SEX, RESIDENCE, COUNT(*) FROM MEMBER_TB GROUP BY SEX, RESIDENCE;	

# 10) 국적별로 거주지역별로 성별로 회원 수를 조회하기
SELECT NATIONALITY, RESIDENCE, COUNT(*) FROM MEMBER_TB GROUP BY NATIONALITY, RESIDENCE;	

# 11) 도메인별로 회원 수를 조회하기(SUBSTRING , LOCATE 함수 사용)
select 
		SUBSTRING(EMAIL , LOCATE('@' , EMAIL) + 1) AS DOMAIN, 
        count(*) 
from
		member_tb
group by 
		DOMAIN;

# 12) 서울을 제외한 지역별로 회원 수를 조회하기
SELECT
		RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
WHERE
		RESIDENCE <> '서울'
GROUP BY
		RESIDENCE;

# 13) '서울' , '경기' , '인천' 지역별로 회원 수를 조회하되 회원수가 3명이상일 경우만 조회하기.
SELECT
		RESIDENCE,
        COUNT(*)
FROM
		MEMBER_TB
WHERE
		RESIDENCE IN ('서울' , '경기' , '인천')
GROUP BY
		RESIDENCE
HAVING
		COUNT(*) >= 3;
