# AjaxTest
- New dynamic web project
  - 프로젝트명: AjaxTest
  - context root: ajax
  - Tomcat 9.0
  - web.xml 체크
## Ajax
- Asynchronous JavaScript and XML
- 비동기 자바스크립트 + XML
- 자바스크립트를 사용해서 > 서버와 비동기 통신을 하는 기술 > 주고 받는 데이터의 형식이 XML이다.
- 클라이언트와 서버간에 XML 형식의 데이터를 주고 받는 자바스크립트 비동기 통신 기법(***)
- XMLHttpRequest 자바스크립트 객체(= ajax 객체)를 사용한 통신
- 구글맵

### 장점
1. 새로고침(화면 깜빡임) 없이 서버와 데이터 통신이 가능하다.
   1. 사용자 편의성 증가
2. 필요한 데이터를 최소한으로 주고 받는 통신이 가능하다.
   1. 시스템 운용에 도움(트래픽 감소)
### 단점
1. 개발자의 업무 복잡+증가

#### 라이브러리
- MapTest 동일


#### 파일
- AjaxTest
  - "script.sql"
- __iFrame사용__
- com.test.java.model
  - AjaxDAO.java
  - SurveyDTO.java
- com.test.java
  - Ex01.java
  - Ex02.java
  - Ex02Data.java
- views
  - ex01.jsp (iFrame문서)
  - ex02.jsp (메인문서)
  - ex02data.jsp 

- __ajax 사용__
- com.test.java
  - Ex03.java
  - Ex03Data.java
- views
  - ex03.jsp
---

## 웹의 특성
- 클라이언트 요구가 있을 때에만 서버가 응답한다
- 서버가 일방적으로 클라이언트 의사와 관계없이 데이터를 전송할 수 없다. (push 불가능)

--- 

### 