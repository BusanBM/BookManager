<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="css/main.css" />
  </head>
  <body>
    <div class="base0">
      <center>
        <form action="registerOk.jsp" method="post">
          <h2>북스코드 회원가입을 환영합니다.</h2>
          <hr />
          <div class="table_mng">
            <table border="1" width="800">
              <th style="background-color: skyblue" colspan="3">
                <p>필수 입력 사항</p>
              </th>

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

            <!--   <tr height="40">
                <th style="background-color: #b2ebf4">생년월일</th>
                <td>
                  <input type="text" name="birth" size="20" />년

                  <select name="top1">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option></select
                  >월

                  <select name="top2">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option></select
                  >일
                </td>
              </tr>

              <tr height="40">
                <th style="background-color: #b2ebf4">관심장르</th>
                <td>
                  <input
                    type="checkbox"
                    name="cb"
                    value="컴퓨터"
                  />컴퓨터&nbsp;&nbsp;
                  <input
                    type="checkbox"
                    name="cb"
                    value="인터넷"
                  />인터넷/IT&nbsp;&nbsp;
                  <input
                    type="checkbox"
                    name="cb"
                    value="여행"
                  />여행&nbsp;&nbsp;
                  <input
                    type="checkbox"
                    name="cb"
                    value="영화"
                  />영화&nbsp;&nbsp;
                  <input type="checkbox" name="cb" value="음악" />음악<br />
                  <input
                    type="checkbox"
                    name="cb"
                    value="음악"
                  />요리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input
                    type="checkbox"
                    name="cb"
                    value="음악"
                  />미용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input
                    type="checkbox"
                    name="cb"
                    value="음악"
                  />애견&nbsp;&nbsp;
                </td>
              </tr> -->
            </table>
          </div>
          <br />

          <input type="submit" value="회원가입" />
          <input type="reset" value="다시입력" />
        </form>
      </center>
    </div>
  </body>
</html>
