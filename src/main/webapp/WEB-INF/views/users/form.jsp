<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <style>
        body {
            background: #f8f9fa;
        }
        h2 {
            font-weight: 600;
            color: #343a40;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        .btn {
            border-radius: 6px;
            font-size: 14px;
            padding: 6px 12px;
        }
        .btn-success {
            background: #198754;
            border: none;
        }
        .btn-secondary {
            background: #6c757d;
            border: none;
        }
        .error {
            color: #dc3545;
            font-size: 13px;
        }
    </style>
</head>
<body class="bg-light">

<!-- Toast контейнер -->
<div class="position-fixed top-0 end-0 p-3" style="z-index: 1100">
    <div id="liveToast" class="toast align-items-center text-bg-danger border-0" role="alert">
        <div class="d-flex">
            <div class="toast-body">
                ${errorMessage}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<div class="container mt-5">
    <h2 class="mb-4 text-center">
        <c:choose>
            <c:when test="${user.id != null}">Edit User</c:when>
            <c:otherwise>Add User</c:otherwise>
        </c:choose>
    </h2>

    <div class="card p-4 shadow">
        <form action="${pageContext.request.contextPath}/users/save" method="post">
            <c:if test="${user.id != null}">
                <input type="hidden" name="id" value="${user.id}" />
            </c:if>

            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" name="name" value="${user.name}" class="form-control" required minlength="2" maxlength="20"/>
                <c:if test="${not empty nameError}">
                    <div class="error">${nameError}</div>
                </c:if>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" name="lastName" value="${user.lastName}" class="form-control" required minlength="2" maxlength="30"/>
                <c:if test="${not empty lastNameError}">
                    <div class="error">${lastNameError}</div>
                </c:if>
            </div>

            <div class="mb-3">
                <label class="form-label">Age</label>
                <input type="number" name="age" value="${user.age}" class="form-control" min="1" max="120" required/>
                <c:if test="${not empty ageError}">
                    <div class="error">${ageError}</div>
                </c:if>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <%-- Покажем тост только если есть сообщение об ошибке --%>
    <c:if test="${not empty errorMessage}">
    var toastLiveExample = document.getElementById('liveToast');
    var toast = new bootstrap.Toast(toastLiveExample);
    toast.show();
    </c:if>
</script>

</body>
</html>
