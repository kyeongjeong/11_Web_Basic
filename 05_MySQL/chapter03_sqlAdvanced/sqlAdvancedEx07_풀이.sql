USE EMPLOYEES;

# 1) 부서번호가 'd001'인 부서의 사원번호와 이름(FIRST,LAST)을 조회하기. (DEPT_EMP , EMPLOYEES)
SELECT EMP_NO, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE EMP_NO IN(SELECT EMP_NO
								FROM DEPT_EMP
                                WHERE DEPT_NO = 'd001');

													
# 2) 부서이름이 'Production'인 부서의 사원번호와 이름(FIRST,LAST)을 조회하기.  (DEPT_EMP , DEPARTMENTS , EMPLOYEES)


							
# 3) 전체급여의 평균보다 많이 수령하고 있는 사원의 사원번호 , 이름(FIRST,LAST)을 조회하기.	(SALARIES , EMPLOYEES)



# 4) 1960년 이후에 태어난 사원들이 근무하고 사원들의 사원번호, 근무부서 번호를 조회하기. (DEPT_EMP , EMPLOYEES)

  
  
# 5) 직급이 'Senior Engineer'인 사원의 이름(FIRST,LAST)을 조회하기. (TITLES , EMPLOYEES)

  

# 6) 관리자의 사원번호 , 이름(FIRST,LAST)을 조회하기. (DEPT_MANAGER , EMPLOYEES)

				   		
  
# 7) 'Development'부서에서 성별로 인원수를 조회하기 (EMPLOYEES , DEPT_EMP , DEPARTMENTS)

