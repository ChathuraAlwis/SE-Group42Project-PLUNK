<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/staff.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                      <?php
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("user");
                          $orderTable->show();
                       ?>

                          <!--    <table id="membertable">

                              <tr class="headerrow">
                                <th class="Staff_ID">Staff ID</th>
                                <th class="Name">Name with initials</th>
                                <th class="Position">Position</th>
                                <th class="Joined_Date">Joined<br>Date</th>
                                <th class="mail">E-mail</th>
                                <th class="NIC"> NIC </th>
                                <th class="Contact_No">Contact<br>No</th>
                              </tr>


                              <tr>
                                   <td>S0001</td>
                                   <td>S.L.D.S.D.WEERASINGHE</td>
                                   <td>restaurant manager</td>
                                   <td>2018.09.12</td>
                                   <td>shandilranga61@gmail.com</td>
                                   <td>893084838V</td>
                                   <td>0983838333</td>
                                 </tr>


                               <tr>
                                        <td>S0001</td>
                                        <td>S.L.D.S.D.WEERASINGHE</td>
                                        <td>restaurant manager</td>
                                        <td>2018.09.12</td>
                                        <td>shandilranga61@gmail.com</td>
                                        <td>893084838V</td>
                                        <td>0983838333</td>
                                      </tr>
                                    <tr>
                                         <td>S0001</td>
                                         <td>S.L.D.S.D.WEERASINGHE</td>
                                         <td>restaurant manager</td>
                                         <td>2018.09.12</td>
                                         <td>shandilranga61@gmail.com</td>
                                         <td>893084838V</td>
                                         <td>0983838333</td>
                                       </tr>
                                     <tr>
                                          <td>S0001</td>
                                          <td>S.L.D.S.D.WEERASINGHE</td>
                                          <td>restaurant manager</td>
                                          <td>2018.09.12</td>
                                          <td>shandilranga61@gmail.com</td>
                                          <td>893084838V</td>
                                          <td>0983838333</td>
                                        </tr>
                                        <tr>
                                             <td>S0001</td>
                                             <td>S.L.D.S.D.WEERASINGHE</td>
                                             <td>restaurant manager</td>
                                             <td>2018.09.12</td>
                                             <td>shandilranga61@gmail.com</td>
                                             <td>893084838V</td>
                                             <td>0983838333</td>
                                           </tr>
                                         <tr>
                                              <td>S0001</td>
                                              <td>S.L.D.S.D.WEERASINGHE</td>
                                              <td>restaurant manager</td>
                                              <td>2018.09.12</td>
                                              <td>shandilranga61@gmail.com</td>
                                              <td>893084838V</td>
                                              <td>0983838333</td>
                                            </tr>
                                          <tr>
                                               <td>S0001</td>
                                               <td>S.L.D.S.D.WEERASINGHE</td>
                                               <td>restaurant manager</td>
                                               <td>2018.09.12</td>
                                               <td>shandilranga61@gmail.com</td>
                                               <td>893084838V</td>
                                               <td>0983838333</td>
                                             </tr>
                                           <tr>
                                                <td>S0001</td>
                                                <td>S.L.D.S.D.WEERASINGHE</td>
                                                <td>restaurant manager</td>
                                                <td>2018.09.12</td>
                                                <td>shandilranga61@gmail.com</td>
                                                <td>893084838V</td>
                                                <td>0983838333</td>
                                              </tr>
                                              <tr>
                                                   <td>S0001</td>
                                                   <td>S.L.D.S.D.WEERASINGHE</td>
                                                   <td>restaurant manager</td>
                                                   <td>2018.09.12</td>
                                                   <td>shandilranga61@gmail.com</td>
                                                   <td>893084838V</td>
                                                   <td>0983838333</td>
                                                 </tr>
                                               <tr>
                                                    <td>S0001</td>
                                                    <td>S.L.D.S.D.WEERASINGHE</td>
                                                    <td>restaurant manager</td>
                                                    <td>2018.09.12</td>
                                                    <td>shandilranga61@gmail.com</td>
                                                    <td>893084838V</td>
                                                    <td>0983838333</td>
                                                  </tr>
                                                <tr>
                                                     <td>S0001</td>
                                                     <td>S.L.D.S.D.WEERASINGHE</td>
                                                     <td>restaurant manager</td>
                                                     <td>2018.09.12</td>
                                                     <td>shandilranga61@gmail.com</td>
                                                     <td>893084838V</td>
                                                     <td>0983838333</td>
                                                   </tr>
                                                 <tr>
                                                      <td>S0001</td>
                                                      <td>S.L.D.S.D.WEERASINGHE</td>
                                                      <td>restaurant manager</td>
                                                      <td>2018.09.12</td>
                                                      <td>shandilranga61@gmail.com</td>
                                                      <td>893084838V</td>
                                                      <td>0983838333</td>
                                                    </tr>
                                                    <tr>
                                                         <td>S0001</td>
                                                         <td>S.L.D.S.D.WEERASINGHE</td>
                                                         <td>restaurant manager</td>
                                                         <td>2018.09.12</td>
                                                         <td>shandilranga61@gmail.com</td>
                                                         <td>893084838V</td>
                                                         <td>0983838333</td>
                                                       </tr>
                                                     <tr>
                                                          <td>S0001</td>
                                                          <td>S.L.D.S.D.WEERASINGHE</td>
                                                          <td>restaurant manager</td>
                                                          <td>2018.09.12</td>
                                                          <td>shandilranga61@gmail.com</td>
                                                          <td>893084838V</td>
                                                          <td>0983838333</td>
                                                        </tr>
                                                      <tr>
                                                           <td>S0001</td>
                                                           <td>S.L.D.S.D.WEERASINGHE</td>
                                                           <td>restaurant manager</td>
                                                           <td>2018.09.12</td>
                                                           <td>shandilranga61@gmail.com</td>
                                                           <td>893084838V</td>
                                                           <td>0983838333</td>
                                                         </tr>
                                                       <tr>
                                                            <td>S0001</td>
                                                            <td>S.L.D.S.D.WEERASINGHE</td>
                                                            <td>restaurant manager</td>
                                                            <td>2018.09.12</td>
                                                            <td>shandilranga61@gmail.com</td>
                                                            <td>893084838V</td>
                                                            <td>0983838333</td>
                                                          </tr>

                            </table>-->
                    </div>

                </div>


  </body>
</html>
