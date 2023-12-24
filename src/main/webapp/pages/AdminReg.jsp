<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Register Admin</title>
      <link rel="stylesheet" href="/css/adminreg.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   <body>
      <div class="wrapper">
         <div class="title-text">
            <div class="title login">
               Registration form
            </div>
           
         </div>
         <div class="form-container">
           
            <div class="form-inner">
               <form action="/adminSave" method="post" class="login">
                  <div class="field">
                     <input type="email" name="email" placeholder="Enter Email" required>
                  </div> 
                  <div class="field">
                    <input type="password" name="password"  placeholder="Enter Password" required>
                 </div> 
                 <div class="field">
                  <input type="password" name="cpassword" placeholder="Confirm password" required>
               </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                     <input type="submit" value="Register">
                  </div>  
            </div>
            <a href="/adminLog" class="h6 mt-2 d-flex align-items-center justify-content-center">Already Registerd? Login Here</a>
         </div>
      </div>
      <script>
         const loginText = document.querySelector(".title-text .login");
         const loginForm = document.querySelector("form.login");
         const loginBtn = document.querySelector("label.login");
         const signupBtn = document.querySelector("label.signup");
         const signupLink = document.querySelector("form .signup-link a");
         signupBtn.onclick = (()=>{
           loginForm.style.marginLeft = "-50%";
           loginText.style.marginLeft = "-50%";
         });
         loginBtn.onclick = (()=>{
           loginForm.style.marginLeft = "0%";
           loginText.style.marginLeft = "0%";
         });
         signupLink.onclick = (()=>{
           signupBtn.click();
           return false;
         });
      </script>
   </body>
</html>
