<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="resources/css/main.css" />
  </head>
  <body>
    <div class="base0">
      <div align="center">
        <form action="registerOk.jsp" method="post">
          <h2>북스코드 회원가입을 환영합니다.</h2>
          <hr />
          <div class="table_mng">
            <table border="1" width="800">
            	<tr>
	              <th style="background-color: skyblue" colspan="3">
	                <p>필수 입력 사항</p>
	              </th>
				</tr>
              <tr height="40">
                <th style="background-color: #b2ebf4">아 이 디</th>
                <td>
                  <input type="text" name="id" size="20" maxlength="12" />
                  4~12자의 영문 대소문자와 숫자로만 입력
                </td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">비밀번호</th>
                <td>
                  <input type="password" name="pwd" size="20" /> 4~12자의 영문
                  대소문자와 숫자로만 입력
                </td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">비밀번호확인</th>
                <td><input type="password" name="pwdck" size="20" /></td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">E-Mail</th>
                <td>
                  <input type="text" name="email" size="20" /> 예)id@domain.com
                </td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">이름</th>
                <td><input type="text" name="name" size="20" /></td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">전화번호</th>
                <td><input type="text" name="tel" size="20" /></td>
              </tr>

              <tr>
                <th style="background-color: skyblue" colspan="3">
                  <p>선택 입력 사항</p>
                </th>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">주소</th>
                <td><input type="text" name="addr" size="70" /></td>
              </tr>

            </table>
          </div>
          <br />

          <input type="submit" value="회원가입" />
          <input type="reset" value="다시입력" />
        </form>
      </div>
    </div>
  </body>
</html>
