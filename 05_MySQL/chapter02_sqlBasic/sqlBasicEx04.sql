/*

	# 데이터 조작어 (DML : Data Manipulation Language) 
	
		[ UPDATE문 ]
		
		 - 테이블의 레코드를 수정한다.
		 - 대부분 where절과 같이 사용한다.
		 - MySQL에서 safe update 정책이 걸려 있어서 safe update를 설정을 해제해야 update쿼리를 사용할 수 있다.
	       좌측 상단 메뉴 Edit클릭 > Preference클릭 > SQL Editor클릭 Safe Updates 체크박스 해지 > MySQL Workbench 재시작
	
		[ 레코드 수정 형식 ]
	    
	   - UPDATE 
	   			테이블명 
	   	 SET 
	   	 		컬럼명1 = 값1 ,
	   	 		컬럼명2 = 값2
	   	 WHERE
	   	 		조건식
	   
	  
	  
	  EX) 
			UPDATE 
					MEMBER 
			SET 
					NAME = 'JACKSON', 
					HEIGHT = '185.1' 
			WHERE 
					NO = 3;

*/

USE DML_TEST;
CREATE TABLE UPDATE_EX (	
	PRODUCT_CD 		VARCHAR(20),
	PRODUCT_NM 		VARCHAR(100),
	PRICE			INT,
	REG_DT			TIMESTAMP
);

INSERT INTO UPDATE_EX VALUES 	('P10001' , '게이밍마우스패드' , 24850 , '2020-02-11'),
														('P10002' , '조립 PC' , 1000000 , '2020-06-30'),
														('P10003' , '브리츠 2채널 스피커' , 30750 , '2020-08-08'),
														('P10004' , '기계식키보드 화이트(청축)', 38150 , '2020-12-30'),
														('P10005' , '기계식키보드 화이트(적축)', 38150 , '2020-12-30'),
														('P10006' , '기계식키보드 화이트(갈축)', 38150 , '2020-12-30'),
														('P10007' , '기계식키보드 화이트(흑축)', 95450 , '2020-12-30');


# 'P10001'상품의 이름을 '일반 마우스패드'로 변경하기.
UPDATE
	UPDATE_EX
SET
	PRODUCT_NM='일반 마우스패드'
WHERE
	PRODUCT_CD='P10001';
COMMIT;

# 'P10002'상품의 가격을 1200000로 등록날짜를 '2020-07-01'로 변경하기
UPDATE
	UPDATE_EX
SET
	PRICE=1200000,
    REG_DT='2020-07-01'
WHERE
	PRODUCT_CD='P10002';
COMMIT;	
		
# 'P10003'상품의 가격을 기존가격에서 3000원 증가하고 등록시간을 현재 시간으로 변경하기
# java처럼 += 이런 건 없음...
UPDATE
	UPDATE_EX
SET
	PRICE=PRICE+3000,
    REG_DT=NOW()
WHERE
	PRODUCT_CD='P10003';
COMMIT;			

# '키보드' 상품의 가격을 기존가격에서 10% 할인하고 등록시간을 현재 시간으로 변경하기
UPDATE
	UPDATE_EX
SET
	PRICE=PRICE*0.9,
    REG_DT=NOW()
WHERE
	PRODUCT_NM='키보드';
COMMIT;		
