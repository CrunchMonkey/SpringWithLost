# REST API 프로젝트 설명
MVC모델을 적용하여 Model - Controller - View(JSON) 으로 구성하였습니다.
***
# 백엔드 구조

![afafas](https://github.com/CrunchMonkey/SpringWithLost/assets/41631740/74160743-b170-4d2e-971a-6ed6dee9e116)

- 게시판과 게시글, 댓글에 연결되어있는 Controller, Service, Mapper부분을 모듈화하여 오류를 최소화하고 유지보수 용이하게 작성

# mybatis 사용
![afasfas](https://github.com/CrunchMonkey/SpringWithLost/assets/41631740/7bcc5fb5-7e83-439c-9d9d-28ae7d76698b)
- mybatis를 사용하여 백엔드에 있는 쿼리부분과 Java부분을 분리하여 가독성을 높임
- 복잡한 JDBC코드를 사용하지않아 간결한 소스코드

# interface
![aaaaaaaaaa](https://github.com/CrunchMonkey/SpringWithLost/assets/41631740/01adff98-15cc-4a84-a852-93f66cc50dd6)
- interface와 그 interface를 구현하는 impl구조로, 처음 사용자도 알아보기 쉽고 유지보수 용이하게 작성
