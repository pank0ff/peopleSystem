<#import "parts/common.ftl" as c>

<@c.page>
    List of users
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Role</th>
            <th scope="col">Email</th>
            <th scope="col">Reg date</th>
            <th scope="col">Last conn</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <form action="/user" method="post">
                    <th scope="row">
                        <input type="hidden" name="username" value="${user.username}">
                        <#list user.roles as role>
                            <div>
                                <label><input type="checkbox"
                                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></label>
                            </div>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </th>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td>${user.email}</td>
                    <td>${user.dateOfRegistration}</td>
                    <td>${user.dateOfLastConnect}</td>
                    <td><a href="/user/${user.id}">edit</a></td>
                    <td>
                </form>
                </td>
                <td><form action="/user" method="post">
                        <input type="hidden" name="username" value="${user.username}">
                        <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit">Block</button></form></td>
                <td><form action="/userDelete" method="post">
                <input type="hidden" name="username" value="${user.username}">
                <input type="hidden" value="${user.id}" name="userId">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button type="submit">Delete</button></form></td>

            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>