USE DML_TEST;
CREATE TABLE ORDER_TB(
	ORDER_CD 			VARCHAR(50),
	MEMBER_ID 			VARCHAR(50),
    PRODUCT_CD			VARCHAR(20),
	ORDER_GOODS_QTY 	INT,
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATUS 	VARCHAR(100),
	ORDER_DT 			TIMESTAMP
);

INSERT INTO ORDER_TB VALUES('order1', 'user1' , 'product1' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-01-03');
INSERT INTO ORDER_TB VALUES('order2', 'user1' , 'product2' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-02-25');
INSERT INTO ORDER_TB VALUES('order3', 'user1' , 'product3' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-03-12');
INSERT INTO ORDER_TB VALUES('order4', 'user5' , 'product8' ,  2 , '배송전 연락 주세요.' ,  '배송중' , '2019-04-11');
INSERT INTO ORDER_TB VALUES('order5', 'user6' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-05-30');
INSERT INTO ORDER_TB VALUES('order6', 'user3' , 'product1' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-06-01');
INSERT INTO ORDER_TB VALUES('order7', 'user2' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-07-12');
INSERT INTO ORDER_TB VALUES('order8', 'user10' , 'product1' ,  10 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-12-25');
INSERT INTO ORDER_TB VALUES('order9', 'user9' , 'product2' ,  2 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송중' , '2020-01-07');
INSERT INTO ORDER_TB VALUES('order10', 'user5' , 'product10' , 1 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-02-28');
INSERT INTO ORDER_TB VALUES('order11', 'user7' , 'product4' , 1 , '경비실에 맡겨 주세요.' , '배송완료' , '2020-03-03');
INSERT INTO ORDER_TB VALUES('order12', 'user2' , 'product4' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-04-27');
INSERT INTO ORDER_TB VALUES('order13', 'user8' , 'product3' , 1 , '배송전 연락 주세요' , '배송완료' , '2020-05-05');
INSERT INTO ORDER_TB VALUES('order14', 'user9' , 'product7' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-05-08');
INSERT INTO ORDER_TB VALUES('order15', 'user3' , 'product2' , 3 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-06-27');
INSERT INTO ORDER_TB VALUES('order16', 'user3' , 'product9' , 10 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-07-08');
INSERT INTO ORDER_TB VALUES('order17', 'user4' , 'product7' , 7 ,  '경비실에 맡겨 주세요.' , '배송중' , '2020-08-15');
INSERT INTO ORDER_TB VALUES('order18', 'user6' , 'product6' , 3 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-10-03');
INSERT INTO ORDER_TB VALUES('order19', 'user7' , 'product6' , 12 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-11-11');
INSERT INTO ORDER_TB VALUES('order20', 'user10' , 'product8' , 5 , '배송전 연락 주세요' , '배송중' , '2020-12-20');


/*
   
	 # 집계(통계) 함수  
	 
	 	 
	 	- 많은 레코드를 입력으로 사용하고 결과로 많은 데이터에 대한 요약&산출된 '단일 값'을 반환한다.
	 	- NULL값의 데이터는 제외하고 반환데이터를 산출한다.
	 	
		 1) COUNT : 조회될 데이터들의 개수를 가져온다.
		 2) SUM   : 조회될 데이터들의 합을 가져온다.
		 3) AVG   : 조회될 데이터들의 평균을 가져온다.
		 4) MAX   : 조회될 데이터들의 최대값을 가져온다.
		 5) MIN   : 조회될 데이터들의 최소값을 가져온다.
	
*/

SELECT  COUNT(*) FROM ORDER_TB;
SELECT 
	SUM(ORDER_GOODS_QTY),
    AVG(ORDER_GOODS_QTY),
    COUNT(ORDER_GOODS_QTY),
    MAX(ORDER_GOODS_QTY),
    MIN(ORDER_GOODS_QTY)
FROM  
	ORDER_TB;

/*
     
     #  GROUP BY
     
		- 출력된 레코드를 그룹으로 묶고 각 그룹에 대한 요약 및 통계값을 계산한다. ( 집계함수와 같이 사용 한다. )
			
		[ 형식 ]
            
		SELECT 
			집계함수(<필드명>) 
		FROM 
			<테이블명> 
        GROUP BY 
			<필드명> 
            
*/

SELECT 
	DELIVERY_STATUS,
    COUNT(DELIVERY_STATUS)
FROM
    ORDER_TB
GROUP BY 
	DELIVERY_STATUS;
    
SELECT 
    DELIVERY_MESSAGE, 
    COUNT(DELIVERY_MESSAGE)
FROM
    ORDER_TB
GROUP BY DELIVERY_MESSAGE;
    


/*
                        
	 # HAVING
		
        - GROUP BY문법에 조건식을 추가할경우 HAVING을 사용한다.
    
		[ 형식 ]
            
		SELECT 
			집계함수(<필드명>) 
		FROM 
			<테이블명> 
		{WHERE					생략가능
			<조건식>}
        GROUP BY 
			<필드명> 
		HAVING 
			<GROUP BY조건>
    
 */	

