<%-- 
    Document   : petchoose
    Created on : Feb 6, 2024, 3:31:06 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #website-width{
                width: 70%;
            }
            
            #foot{
                margin-top: 2%;
            }
            
            #profile-pet{
                border-radius: 20px;
                background-color: whitesmoke;
                border: 1px black solid;
                padding: 1%;
                padding-left: 3%;
                margin-top: 2%;
                
            }
            
            #profile-pet table{
                width: 100%;

            }
            
            
            #profile-pet table, th, td{
                border: 1px black solid;
                font-size: 80%;
                text-align: center;
            }
            
            #profile-pet table th{
                padding-top: 1%;
                padding-bottom: 1%;
                font-size: 85%;
            }
            
            .pet-form button{
                font-size: 90%;
                font-weight: bold;
            }
            #profile-pet p{
                font-size: 110%;
                color: black;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="profile-pet">
                <h4>Chọn các thú cưng cho booking:</h4>
                <form id="bookingForm" action="" method="post">
                    <table class="table table-bordered table-hover table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>Tên thú cưng</th>
                                <th>Giới tính thú cưng</th>
                                <th>Loại thú cưng</th>
                                <th>Cân nặng</th>
                                <th>Chiều cao</th>
                                <th>Chiều dài</th>
                                <th>Tính cách</th>
                                <th>Món ưa thích</th>
                                <th>Chọn thú cung</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:if test="${list_pet != null}">
                                <c:forEach var="pet" items="${list_pet}">
                                    <c:if test="${pet.petStatus != 'hidden' && pet.petStatus != 'disable' && pet.petStatus != 'booking'}">
                                        <tr onclick="toggleCheckbox(this, event);">
                                            <td>${pet.petName}</td>
                                            <td>${pet.petSex}</td>
                                            <td>${pet.petType}</td>
                                            <td>${pet.petWeight}</td>
                                            <td>${pet.petHeight}</td>
                                            <td>${pet.petLength}</td>
                                            <td>${pet.petBehavior}</td>
                                            <td>${pet.petFavoriteFood}</td>
                                            <td><input type="checkbox" name="pickpetchose" value="${pet.petId}"></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                    <div id="selected-pet"></div>
                    <!--<input type="hidden" name="redirectTo" id="redirectUrlInput" value="<%= request.getAttribute("redirectUrl")%>">-->
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="ServiceType1" name="serviceType" class="custom-control-input" value="shorttime" required>
                        <label class="custom-control-label" for="ServiceType1">Trong ngày</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="serviceType2" name="serviceType" class="custom-control-input" value="shorttime" required>
                        <label class="custom-control-label" for="serviceType2">Dài ngày</label>
                    </div>
                    <br>
                    <input type="submit" value="Book" class="btn btn-success" />
                </form>
            </div>
            <div id="foot"><%@include file="footer.jsp" %></div>
        </div>
        <script>
            function toggleCheckbox(row, event) {
                if (event.target.type !== 'checkbox') {
                    var checkbox = row.querySelector('input[type="checkbox"]');
                    checkbox.checked = !checkbox.checked;
            }

                var selectedPets = [];
                var checkboxes = document.querySelectorAll('input[name="pickpetchose"]:checked');
                checkboxes.forEach(function(checkbox) {
                    var petName = checkbox.closest('tr').querySelector('td:first-child').innerText;
                    selectedPets.push(petName);
                });

                // Display the selected pets
                var selectedPetDiv = document.getElementById('selected-pet');
                if (selectedPets.length > 0) {
                    selectedPetDiv.innerText = "Thú cưng đã chọn: " + selectedPets.join(', ');
                } else {
                    selectedPetDiv.innerText = "";
                }
            }
            window.onload = function() {
                setFormAction();
            };

            function setFormAction() {
                var form = document.getElementById('bookingForm');
                var redirectUrlInput = document.getElementById('redirectUrlInput');
                var redirectUrl = redirectUrlInput.value;
                form.action = redirectUrl;
            }
        </script>
    </body>
</html>
