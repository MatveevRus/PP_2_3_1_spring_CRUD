<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <style>
        body {
            background: #f8f9fa;
        }
        h2 {
            font-weight: 600;
            color: #343a40;
        }
        .table-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 25px;
        }
        .btn {
            border-radius: 6px;
            font-size: 14px;
            padding: 6px 12px;
        }
        .btn-primary {
            background: #0d6efd;
            border: none;
        }
        .btn-danger {
            background: #dc3545;
            border: none;
        }
        .btn-success {
            background: #198754;
            border: none;
        }
    </style>
</head>
<body class="bg-light">

<!-- Toast контейнер -->
<div class="position-fixed top-0 end-0 p-3" style="z-index: 1100">
    <div id="liveToast" class="toast align-items-center text-bg-success border-0" role="alert">
        <div class="d-flex">
            <div class="toast-body">
                ${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<div class="container mt-5">
    <h2 class="text-center mb-4">User Management</h2>

    <div class="table-container">
        <div class="mb-3 text-end">
            <a href="${pageContext.request.contextPath}/users/form" class="btn btn-success">➕ Add User</a>
        </div>

        <table class="table table-bordered table-striped table-hover shadow-sm">
            <thead class="table-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Age</th>
                <th scope="col" style="width: 160px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.lastName}</td>
                    <td>${u.age}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/users/form?id=${u.id}" class="btn btn-primary btn-sm">Edit</a>
                        <form action="${pageContext.request.contextPath}/users/delete" method="post" class="d-inline">
                            <input type="hidden" name="id" value="${u.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <%-- Покажем тост только если есть сообщение --%>
    <c:if test="${not empty message}">
    var toastLiveExample = document.getElementById('liveToast');
    var toast = new bootstrap.Toast(toastLiveExample);
    toast.show();
    </c:if>
</script>

</body>
</html>
