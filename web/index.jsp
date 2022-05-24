<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>仓库管理系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <style>
      input::-webkit-input-placeholder{
        color:white !important;
      }
      input::-moz-placeholder{   /* Mozilla Firefox 19+ */
        color:white !important;
      }
      input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
        color:white !important;
      }
      input:-ms-input-placeholder{  /* Internet Explorer 10-11 */
        color:white !important;
      }
      body{
        background-color: cornflowerblue;
      }
    </style>
  </head>
  <body>
  <div class="container" style="width: 400px; height: 250px; background-color: white; line-height: 20px; margin: 200px auto 0; border-radius: 10px">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <div class="page-header">
          <h1 style="text-align: center; color: cornflowerblue">
            <small>登录</small>
          </h1>
        </div>
      </div>
    </div>
    <form action="${pageContext.request.contextPath}/login" method="post">
      <div class="form-group">
        <label for="id" style="color: cornflowerblue">请输入ID：</label><input type="text" style="color: white; background-color: cornflowerblue" placeholder="id" name="id" id="id" class="form-control" required>
        <label for="password" style="color: cornflowerblue">请输入密码：</label><input type="text" style="color: white; background-color: cornflowerblue" placeholder="password" name="password" id="password" class="form-control" required>
      </div>
      <br>
      <div class="form-group" style="text-align: center">
        <input type="submit" class="btn btn-primary" style="width: 120px; background-color: cornflowerblue" value="进入">
      </div>
    </form>
  </div>
  </body>
</html>
